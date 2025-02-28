COMMENT=	small, easy to set up, fast and very secure FTP server

DISTNAME=	pure-ftpd-1.0.51
CATEGORIES=	net
MASTER_SITES=	https://download.pureftpd.org/pub/pure-ftpd/releases/ \
		ftp://ftp.pureftpd.org/pub/pure-ftpd/releases/ \
		ftp://ftp4.fr.pureftpd.org/pub/pure-ftpd/releases/ \
		ftp://ftp.dk.pureftpd.org/mirrors/pure-ftpd/releases/ \
		ftp://ftp.nl.pureftpd.org/pub/pure-ftpd/releases/ \
		${MASTER_SITE_SOURCEFORGE:=pureftpd/}
EXTRACT_SUFX=	.tar.bz2
REVISION=	0

HOMEPAGE=	https://www.pureftpd.org/project/pure-ftpd/

MAINTAINER=	Brad Smith <brad@comstyle.com>

# BSD
PERMIT_PACKAGE=	Yes

WANTLIB=	c crypto sodium ssl

LIB_DEPENDS=	security/libsodium

SEPARATE_BUILD=	Yes
CONFIGURE_STYLE= gnu
CONFIGURE_ARGS+= --disable-pie \
		 --with-everything \
		 --with-paranoidmsg \
		 --with-tls

FLAVORS=	ldap mysql postgresql virtual_chroot
FLAVOR?=

.if ${FLAVOR:Mldap}
LIB_DEPENDS+= 	databases/openldap
WANTLIB +=	ldap>=2 lber
CONFIGURE_ARGS+= --with-ldap="${LOCALBASE}"
DOCS+=	README.LDAP pureftpd.schema
CONF_FILE+= pureftpd-ldap.conf
.endif

.if ${FLAVOR:Mmysql}
LIB_DEPENDS+=	databases/mariadb
WANTLIB +=	mariadb m z
CONFIGURE_ARGS+= --with-mysql="${LOCALBASE}"
DOCS+=	README.MySQL
CONF_FILE+= pureftpd-mysql.conf
.endif

.if ${FLAVOR:Mpostgresql}
LIB_DEPENDS+=	databases/postgresql
WANTLIB +=	pq>=2 m z
CONFIGURE_ARGS+= --with-pgsql="${LOCALBASE}"
DOCS+=	README.PGSQL
CONF_FILE+= pureftpd-pgsql.conf
.endif

.if ${FLAVOR:Mvirtual_chroot}
CONFIGURE_ARGS+= --with-virtualchroot
.endif

DOCS+=	README README.Configuration-File README.TLS README.Virtual-Users \
	README.Authentication-Modules pure-ftpd.png

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/pure-ftpd
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/pure-ftpd
	${INSTALL_DATA} ${WRKBUILD}/pure-ftpd.conf \
		${PREFIX}/share/examples/pure-ftpd/pure-ftpd.conf.sample
	cd ${WRKSRC}; ${INSTALL_DATA} ${DOCS} ${PREFIX}/share/doc/pure-ftpd
.if defined(CONF_FILE) && !empty(CONF_FILE)
	cd ${WRKSRC}; ${INSTALL_DATA} ${CONF_FILE} \
		${PREFIX}/share/examples/pure-ftpd
.endif

.include <bsd.port.mk>
