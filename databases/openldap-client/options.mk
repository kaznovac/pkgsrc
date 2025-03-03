# $NetBSD: options.mk,v 1.4 2024/07/15 12:28:08 hauke Exp $

PKG_OPTIONS_VAR=	PKG_OPTIONS.openldap-client
PKG_SUPPORTED_OPTIONS=	kerberos sasl slp inet6
PKG_SUGGESTED_OPTIONS=	inet6

.include "../../mk/bsd.options.mk"

###
### Kerberos authentication is via SASL.
###
.if !empty(PKG_OPTIONS:Mkerberos)
.  if empty(PKG_OPTIONS:Msasl)
PKG_OPTIONS+=		sasl
.  endif
.endif

###
### SASL authentication (requires SASL2)
###
.if !empty(PKG_OPTIONS:Msasl)
CONFIGURE_ARGS+=	--with-cyrus-sasl
BUILDLINK_API_DEPENDS.cyrus-sasl+=	cyrus-sasl>=2.1.15
.  include "../../security/cyrus-sasl/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--without-cyrus-sasl

# FreeBSD clang linker trips over undefined symbols
SUBST_CLASSES.FreeBSD+=	linksym
SUBST_STAGE.linksym=	pre-configure
SUBST_FILES.linksym=	libraries/libldap/ldap.map
SUBST_SED.linksym=	-E -e '/ldap_(int|pvt)_sasl_.+;/d'
SUBST_SED.linksym+=	-e '/ldap_host_connected_to;/d'
SUBST_MESSAGE.linksym=	Fixing missing symbols linker error.
.endif

###
### SLP (Service Locator Protocol)
###
.if !empty(PKG_OPTIONS:Mslp)
.  include "../../net/openslp/buildlink3.mk"
CONFIGURE_ARGS+=	--enable-slp
.endif

###
### IPv6 support
###
.if !empty(PKG_OPTIONS:Minet6)
CONFIGURE_ARGS+=	--enable-ipv6
.else
CONFIGURE_ARGS+=	--disable-ipv6
.endif
