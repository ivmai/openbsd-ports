COMMENT=	tools for the MongoDB database

GH_ACCOUNT=	mongodb
GH_PROJECT=	mongo-tools
GH_TAGNAME=	r4.3.2
PKGNAME=	mongo-tools-${GH_TAGNAME:S/r//}

CATEGORIES=	databases

HOMEPAGE=	https://www.mongodb.com/docs/database-tools/

# Apache v2
PERMIT_PACKAGE=	Yes

WANTLIB=	c pcap pthread

MODULES=	lang/go

do-build:
.for i in bsondump mongostat mongofiles mongoexport mongoimport mongorestore mongodump mongotop mongoreplay
	cd ${WRKSRC}; \
	GOROOT=/usr/local/go GOPATH=${WRKDIR}/go GO111MODULE=off HOME=${WRKDIR} \
	go build -v -p ${MAKE_JOBS} -o "bin/$i" $(buildflags) -ldflags "-X main.VersionStr=${GH_TAGNAME}" $i/main/$i.go
.endfor

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/bin/* ${PREFIX}/bin/

.include <bsd.port.mk>
