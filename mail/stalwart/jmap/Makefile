COMMENT =		JMAP server

GH_PROJECT =		jmap-server
REVISION =		3

.include "crates.inc"

# added manually here because of Cargo.toml patches...
MODCARGO_CRATES +=	jmap-client	0.2.0	# Apache-2.0 OR MIT
MODCARGO_CRATES +=	mail-parser	0.7.0	# Apache-2.0 OR MIT
MODCARGO_CRATES +=	mail-send	0.2.3	# Apache-2.0 OR MIT
MODCARGO_CRATES +=	sieve-rs	0.2.0	# AGPL-3.0-only

# otherwise blows because rocksdb wants to statically links against libz ?
MODCARGO_CRATES_KEEP +=	libz-sys

# for rocksdb bindings
MODCARGO_ENV=	LIBCLANG_PATH=${LOCALBASE}/lib
MAKE_ENV +=	DEP_BZIP2_INCLUDE=${LOCALBASE}/include

#librocksdb-sys looks for libclang.so
BUILD_DEPENDS=	devel/llvm
LIB_DEPENDS +=	archivers/zstd \
		archivers/bzip2

WANTLIB += ${COMPILER_LIBCXX} bz2 c m zstd

post-install:
	mv ${PREFIX}/bin/export ${PREFIX}/bin/stalwart-export
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/stalwart/jmap
	${SUBST_CMD} -c ${WRKSRC}/resources/config/config.yml ${PREFIX}/share/examples/stalwart/jmap/config.yml

.include <bsd.port.mk>
