$NetBSD: patch-platform_xpcom_reflect_xptcall_md_unix_xptcstubs__arm__netbsd.cpp,v 1.1 2024/07/29 18:13:48 nia Exp $

Update code to fix NetBSD/arm. Copied from www/firefox52.

--- platform/xpcom/reflect/xptcall/md/unix/xptcstubs_arm_netbsd.cpp.orig	2024-07-10 08:54:53.000000000 +0000
+++ platform/xpcom/reflect/xptcall/md/unix/xptcstubs_arm_netbsd.cpp
@@ -6,15 +6,32 @@
 /* Implement shared vtbl methods. */
 
 #include "xptcprivate.h"
+#include "xptiprivate.h"
 
-nsresult ATTRIBUTE_USED
+/* Specify explicitly a symbol for this function, don't try to guess the c++ mangled symbol.  */
+static nsresult PrepareAndDispatch(nsXPTCStubBase* self, uint32_t methodIndex, uint32_t* args) asm("_PrepareAndDispatch")
+ATTRIBUTE_USED;
+
+#ifdef __ARM_EABI__
+#define DOUBLEWORD_ALIGN(p) ((uint32_t *)((((uint32_t)(p)) + 7) & 0xfffffff8))
+#else
+#define DOUBLEWORD_ALIGN(p) (p)
+#endif
+
+// Apple's iOS toolchain is lame and does not support .cfi directives.
+#ifdef __APPLE__
+#define CFI(str)
+#else
+#define CFI(str) str
+#endif
+
+static nsresult
 PrepareAndDispatch(nsXPTCStubBase* self, uint32_t methodIndex, uint32_t* args)
 {
 #define PARAM_BUFFER_COUNT     16
 
     nsXPTCMiniVariant paramBuffer[PARAM_BUFFER_COUNT];
     nsXPTCMiniVariant* dispatchParams = nullptr;
-    nsIInterfaceInfo* iface_info = nullptr;
     const nsXPTMethodInfo* info;
     uint8_t paramCount;
     uint8_t i;
@@ -22,12 +39,7 @@ PrepareAndDispatch(nsXPTCStubBase* self,
 
     NS_ASSERTION(self,"no self");
 
-    self->GetInterfaceInfo(&iface_info);
-    NS_ASSERTION(iface_info,"no interface info");
-
-    iface_info->GetMethodInfo(uint16_t(methodIndex), &info);
-    NS_ASSERTION(info,"no interface info");
-
+    self->mEntry->GetMethodInfo(uint16_t(methodIndex), &info);
     paramCount = info->GetParamCount();
 
     // setup variant array pointer
@@ -55,13 +67,16 @@ PrepareAndDispatch(nsXPTCStubBase* self,
         case nsXPTType::T_I8     : dp->val.i8  = *((int8_t*)  ap);       break;
         case nsXPTType::T_I16    : dp->val.i16 = *((int16_t*) ap);       break;
         case nsXPTType::T_I32    : dp->val.i32 = *((int32_t*) ap);       break;
-        case nsXPTType::T_I64    : dp->val.i64 = *((int64_t*) ap); ap++; break;
+        case nsXPTType::T_I64    : ap = DOUBLEWORD_ALIGN(ap);
+				   dp->val.i64 = *((int64_t*) ap); ap++; break;
         case nsXPTType::T_U8     : dp->val.u8  = *((uint8_t*) ap);       break;
         case nsXPTType::T_U16    : dp->val.u16 = *((uint16_t*)ap);       break;
         case nsXPTType::T_U32    : dp->val.u32 = *((uint32_t*)ap);       break;
-        case nsXPTType::T_U64    : dp->val.u64 = *((uint64_t*)ap); ap++; break;
+        case nsXPTType::T_U64    : ap = DOUBLEWORD_ALIGN(ap);
+				   dp->val.u64 = *((uint64_t*)ap); ap++; break;
         case nsXPTType::T_FLOAT  : dp->val.f   = *((float*)   ap);       break;
-        case nsXPTType::T_DOUBLE : dp->val.d   = *((double*)  ap); ap++; break;
+        case nsXPTType::T_DOUBLE : ap = DOUBLEWORD_ALIGN(ap);
+				   dp->val.d   = *((double*)  ap); ap++; break;
         case nsXPTType::T_BOOL   : dp->val.b   = *((bool*)  ap);       break;
         case nsXPTType::T_CHAR   : dp->val.c   = *((char*)    ap);       break;
         case nsXPTType::T_WCHAR  : dp->val.wc  = *((wchar_t*) ap);       break;
@@ -71,9 +86,7 @@ PrepareAndDispatch(nsXPTCStubBase* self,
         }
     }
 
-    result = self->CallMethod((uint16_t)methodIndex, info, dispatchParams);
-
-    NS_RELEASE(iface_info);
+    result = self->mOuter->CallMethod((uint16_t)methodIndex, info, dispatchParams);
 
     if(dispatchParams != paramBuffer)
         delete [] dispatchParams;
@@ -82,26 +95,114 @@ PrepareAndDispatch(nsXPTCStubBase* self,
 }
 
 /*
- * These stubs move just move the values passed in registers onto the stack,
- * so they are contiguous with values passed on the stack, and then calls
- * PrepareAndDispatch() to do the dirty work.
+ * This is our shared stub.
+ *
+ * r0 = Self.
+ *
+ * The Rules:
+ *   We pass an (undefined) number of arguments into this function.
+ *   The first 3 C++ arguments are in r1 - r3, the rest are built
+ *   by the calling function on the stack.
+ *
+ *   We are allowed to corrupt r0 - r3, ip, and lr.
+ *
+ * Other Info:
+ *   We pass the stub number in using `ip'.
+ *
+ * Implementation:
+ * - We save r1 to r3 inclusive onto the stack, which will be
+ *   immediately below the caller saved arguments.
+ * - setup r2 (PrepareAndDispatch's args pointer) to point at
+ *   the base of all these arguments
+ * - Save LR (for the return address)
+ * - Set r1 (PrepareAndDispatch's methodindex argument) from ip
+ * - r0 is passed through (self)
+ * - Call PrepareAndDispatch
+ * - When the call returns, we return by loading the PC off the
+ *   stack, and undoing the stack (one instruction)!
+ *
  */
+__asm__ ("\n"
+         ".text\n"
+         ".align 2\n"
+         "SharedStub:\n"
+         CFI(".cfi_startproc\n")
+         "stmfd	sp!, {r1, r2, r3}\n"
+         CFI(".cfi_def_cfa_offset 12\n")
+         CFI(".cfi_offset r3, -4\n")
+         CFI(".cfi_offset r2, -8\n")
+         CFI(".cfi_offset r1, -12\n")
+         "mov	r2, sp\n"
+         "str	lr, [sp, #-4]!\n"
+         CFI(".cfi_def_cfa_offset 16\n")
+         CFI(".cfi_offset lr, -16\n")
+         "mov	r1, ip\n"
+         "bl	_PrepareAndDispatch\n"
+         "ldr	pc, [sp], #16\n"
+         CFI(".cfi_endproc\n"));
+
+/*
+ * Create sets of stubs to call the SharedStub.
+ * We don't touch the stack here, nor any registers, other than IP.
+ * IP is defined to be corruptable by a called function, so we are
+ * safe to use it.
+ *
+ * This will work with or without optimisation.
+ */
+
+/*
+ * Note : As G++3 ABI contains the length of the functionname in the
+ *  mangled name, it is difficult to get a generic assembler mechanism like
+ *  in the G++ 2.95 case.
+ *  Create names would be like :
+ *    _ZN14nsXPTCStubBase5Stub9Ev
+ *    _ZN14nsXPTCStubBase6Stub13Ev
+ *    _ZN14nsXPTCStubBase7Stub144Ev
+ *  Use the assembler directives to get the names right...
+ */
+
+#define STUB_ENTRY(n)						\
+  __asm__(							\
+	".section \".text\"\n"					\
+"	.align 2\n"						\
+"	.iflt ("#n" - 10)\n"                                    \
+"	.globl	_ZN14nsXPTCStubBase5Stub"#n"Ev\n"		\
+"	.type	_ZN14nsXPTCStubBase5Stub"#n"Ev,#function\n"	\
+"_ZN14nsXPTCStubBase5Stub"#n"Ev:\n"				\
+"	.else\n"                                                \
+"	.iflt  ("#n" - 100)\n"                                  \
+"	.globl	_ZN14nsXPTCStubBase6Stub"#n"Ev\n"		\
+"	.type	_ZN14nsXPTCStubBase6Stub"#n"Ev,#function\n"	\
+"_ZN14nsXPTCStubBase6Stub"#n"Ev:\n"				\
+"	.else\n"                                                \
+"	.iflt ("#n" - 1000)\n"                                  \
+"	.globl	_ZN14nsXPTCStubBase7Stub"#n"Ev\n"		\
+"	.type	_ZN14nsXPTCStubBase7Stub"#n"Ev,#function\n"	\
+"_ZN14nsXPTCStubBase7Stub"#n"Ev:\n"				\
+"	.else\n"                                                \
+"	.err \"stub number "#n"> 1000 not yet supported\"\n"    \
+"	.endif\n"                                               \
+"	.endif\n"                                               \
+"	.endif\n"                                               \
+"	mov	ip, #"#n"\n"					\
+"	b	SharedStub\n\t");
+
+#if 0
+/*
+ * This part is left in as comment : this is how the method definition
+ * should look like.
+ */
+
+#define STUB_ENTRY(n)  \
+nsresult nsXPTCStubBase::Stub##n ()  \
+{ \
+  __asm__ (	  		        \
+"	mov	ip, #"#n"\n"					\
+"	b	SharedStub\n\t");                               \
+  return 0; /* avoid warnings */                                \
+}
+#endif
 
-#define STUB_ENTRY(n)							\
-__asm__(								\
-    ".global	_Stub"#n"__14nsXPTCStubBase\n\t"			\
-"_Stub"#n"__14nsXPTCStubBase:\n\t"					\
-    "stmfd	sp!, {r1, r2, r3}	\n\t"				\
-    "mov	ip, sp			\n\t"				\
-    "stmfd	sp!, {fp, ip, lr, pc}	\n\t"				\
-    "sub	fp, ip, #4		\n\t"				\
-    "mov	r1, #"#n"		\n\t"    /* = methodIndex 	*/ \
-    "add	r2, sp, #16		\n\t"				\
-    "bl		_PrepareAndDispatch__FP14nsXPTCStubBaseUiPUi   \n\t"	\
-    "ldmea	fp, {fp, sp, lr}	\n\t"				\
-    "add	sp, sp, #12		\n\t"				\
-    "mov	pc, lr			\n\t"				\
-);
 
 #define SENTINEL_ENTRY(n) \
 nsresult nsXPTCStubBase::Sentinel##n() \
