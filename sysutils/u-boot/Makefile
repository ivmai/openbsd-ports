BROKEN-sparc64=	Error: the specified option is not accepted in ISB at operand 1 -- isb sy
BROKEN-arm=	lib/time.c:187:1: internal compiler error: Bus error

DPB_PROPERTIES=	parallel

FLAVORS=	aarch64 arm riscv64
FLAVOR?=	arm

COMMENT=	U-Boot firmware
VERSION=	2021.10
REVISION=	6
DISTNAME=	u-boot-${VERSION}
PKGNAME=	u-boot-${FLAVOR}-${VERSION:S/-//}
FULLPKGNAME=	${PKGNAME}
CATEGORIES=	sysutils
HOMEPAGE=	https://www.denx.de/wiki/U-Boot

# GPLv2
PERMIT_PACKAGE=	Yes

MASTER_SITES=	https://ftp.denx.de/pub/u-boot/
EXTRACT_SUFX=	.tar.bz2
PKG_ARCH=	*

BUILD_DEPENDS=	devel/bison \
		devel/dtc \
		devel/swig

# for pkg_resources used in tools/binman/control.py
BUILD_DEPENDS+=	devel/py-setuptools${MODPY_FLAVOR}

MODULES=	lang/python
MODPY_RUNDEP=	No

MODPY_ADJ_FILES=\
	arch/arm/mach-rockchip/make_fit_atf.py

MAKE_ENV=	KBUILD_VERBOSE=1 \
		PYTHON="${MODPY_BIN}"

.if "${FLAVOR}" == "aarch64"
BUILD_DEPENDS+=	devel/arm-none-eabi/gcc,aarch64 \
		devel/py-elftools${MODPY_FLAVOR} \
		sysutils/arm-trusted-firmware>=2.2p0v0
MAKE_ENV+=	CROSS_COMPILE="aarch64-none-elf-"
RK3328_BL31=	"${LOCALBASE}/share/arm-trusted-firmware/rk3328-bl31.elf"
RK3399_BL31=	"${LOCALBASE}/share/arm-trusted-firmware/rk3399-bl31.elf"
SUNXI_BL31=	"${LOCALBASE}/share/arm-trusted-firmware/sun50i_a64-bl31.bin"
SUNXI_H6_BL31=	"${LOCALBASE}/share/arm-trusted-firmware/sun50i_h6-bl31.bin"
.elif "${FLAVOR}" == "arm"
BUILD_DEPENDS+=	devel/arm-none-eabi/gcc,arm
MAKE_ENV+=	CROSS_COMPILE="arm-none-eabi-"
.elif "${FLAVOR}" == "riscv64"
BUILD_DEPENDS+= devel/riscv-elf/gcc \
		sysutils/opensbi>=0.9p0
MAKE_ENV+=	CROSS_COMPILE="riscv64-unknown-elf-"
FW_DYNAMIC=	"${LOCALBASE}/share/opensbi/generic/fw_dynamic.bin"
.endif

USE_GMAKE=	Yes
NO_TEST=	Yes

.if "${FLAVOR}" == "aarch64"
SUNXI64=\
	a64-olinuxino \
	bananapi_m64 \
	nanopi_a64 \
	nanopi_neo2 \
	orangepi_pc2 \
	orangepi_prime \
	orangepi_win \
	orangepi_zero_plus \
	pine64-lts \
	pine64_plus \
	pine_h64-model-b \
	pinebook \
	sopine_baseboard
BOARDS=\
	firefly-rk3399 \
	mvebu_espressobin-88f3720 \
	mvebu_mcbin-88f8040 \
	nanopc-t4-rk3399 \
	nanopi-neo4-rk3399 \
	nanopi-r2s-rk3328 \
	nanopi-r4s-rk3399 \
	pinebook-pro-rk3399 \
	qemu_arm64 \
	rock64-rk3328 \
	rock960-rk3399 \
	rock-pi-4-rk3399 \
	rock-pi-n10-rk3399pro \
	rockpro64-rk3399 \
	rpi_arm64
.elif "${FLAVOR}" == "arm"
OMAP=\
	omap4_panda \
	am335x_evm
SUNXI64=
SUNXI=\
	A10-OLinuXino-Lime \
	A10s-OLinuXino-M \
	A20-OLinuXino-Lime \
	A20-OLinuXino-Lime2 \
	A20-OLinuXino-Lime2-eMMC \
	A20-OLinuXino_MICRO \
	Bananapi \
	Bananapi_M2_Ultra \
	Bananapi_m2m \
	bananapi_m2_plus_h3 \
	bananapi_m2_zero \
	Bananapro \
	CHIP \
	Cubieboard \
	Cubieboard2 \
	Cubieboard4 \
	Cubietruck \
	Lamobo_R1 \
	Linksprite_pcDuino \
	Linksprite_pcDuino3 \
	Linksprite_pcDuino3_Nano \
	nanopi_neo \
	Orangepi \
	Orangepi_mini \
	orangepi_2 \
	orangepi_lite \
	orangepi_one \
	orangepi_pc \
	orangepi_pc_plus \
	orangepi_plus \
	orangepi_plus2e \
	orangepi_zero
IMX=\
	cm_fx6 \
	mx6cuboxi \
	mx6qsabrelite \
	nitrogen6q \
	novena \
	udoo \
	usbarmory \
	wandboard
BOARDS=\
	${OMAP} \
	${SUNXI} \
	${IMX} \
	clearfog \
	qemu_arm \
	rpi_2 \
	rpi_3_32b \
	tinker-rk3288 \
	turris_omnia
.elif "${FLAVOR}" == "riscv64"
BOARDS=\
	qemu-riscv64_smode \
	sifive_unmatched
.endif

FILES=\
	MLO \
	SPL \
	u-boot \
	u-boot.img \
	u-boot.bin \
	u-boot-sunxi-with-spl.bin \
	u-boot.imx \
	u-boot-dtb.imx \
	u-boot-spl.kwb \
	u-boot-with-spl.bin \
	u-boot.itb \
	u-boot-rockchip.bin \
	idbloader.img \
	spl/sunxi-spl.bin \
	spl/u-boot-spl.bin

do-build:
.for BOARD in ${BOARDS}
	cd ${WRKSRC} && \
	    mkdir -p build/${BOARD} && \
	    ${SETENV} ${MAKE_ENV} ${MAKE_PROGRAM} ${MAKE_FLAGS} \
	        O="build/${BOARD}" \
	        -f ${MAKE_FILE} "${BOARD}"_defconfig
.if "${BOARD:M*-rk3399*}"
	cd ${WRKSRC} && \
	    ${SETENV} ${MAKE_ENV} BL31=${RK3399_BL31} ${MAKE_PROGRAM} \
	        ${MAKE_FLAGS} O="build/${BOARD}" \
	        -f ${MAKE_FILE} ${ALL_TARGET}
.elif "${BOARD:M*-rk3328}"
	cd ${WRKSRC} && \
	    ${SETENV} ${MAKE_ENV} BL31=${RK3328_BL31} ${MAKE_PROGRAM} \
	        ${MAKE_FLAGS} O="build/${BOARD}" \
	        -f ${MAKE_FILE} ${ALL_TARGET}
.elif "${BOARD:M*sifive_*}"
	cd ${WRKSRC} && \
	    ${SETENV} ${MAKE_ENV} OPENSBI=${FW_DYNAMIC} ${MAKE_PROGRAM} \
	        ${MAKE_FLAGS} O="build/${BOARD}" \
	        -f ${MAKE_FILE} ${ALL_TARGET}
.else
	cd ${WRKSRC} && \
	    ${SETENV} ${MAKE_ENV} ${MAKE_PROGRAM} ${MAKE_FLAGS} \
	        O="build/${BOARD}" \
	        -f ${MAKE_FILE} ${ALL_TARGET}
.endif
.if "${BOARD:M*-rk3288}"
	cd ${WRKSRC}/build/${BOARD} && \
	    tools/mkimage -n rk3288 -T rksd -d tpl/u-boot-tpl.bin \
	        idbloader.img && \
	    cat spl/u-boot-spl-dtb.bin >> idbloader.img
.endif
.endfor
.for BOARD in ${SUNXI64}
.if "${BOARD:M*_h64*}"
	cd ${WRKSRC} && \
	    mkdir -p build/${BOARD} && \
	    ${SETENV} ${MAKE_ENV} BL31=${SUNXI_H6_BL31} ${MAKE_PROGRAM} \
	        ${MAKE_FLAGS} O="build/${BOARD}" \
	        -f ${MAKE_FILE} "${BOARD}"_defconfig && \
	    ${SETENV} ${MAKE_ENV} BL31=${SUNXI_H6_BL31} ${MAKE_PROGRAM} \
	        ${MAKE_FLAGS} O="build/${BOARD}" \
	        -f ${MAKE_FILE} ${ALL_TARGET}
.else
	cd ${WRKSRC} && \
	    mkdir -p build/${BOARD} && \
	    ${SETENV} ${MAKE_ENV} BL31=${SUNXI_BL31} ${MAKE_PROGRAM} \
	        ${MAKE_FLAGS} O="build/${BOARD}" \
	        -f ${MAKE_FILE} "${BOARD}"_defconfig && \
	    ${SETENV} ${MAKE_ENV} BL31=${SUNXI_BL31} ${MAKE_PROGRAM} \
	        ${MAKE_FLAGS} O="build/${BOARD}" \
	        -f ${MAKE_FILE} ${ALL_TARGET}
.endif
	if [[ -f ${WRKSRC}/build/${BOARD}/spl/sunxi-spl.bin && \
	      -f ${WRKSRC}/build/${BOARD}/u-boot.itb ]]; then \
		cd ${WRKSRC}/build/${BOARD} && \
		    cat spl/sunxi-spl.bin u-boot.itb > u-boot-sunxi-with-spl.bin ; \
	fi
.endfor

do-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/u-boot
.for BOARD in ${BOARDS} ${SUNXI64}
	${INSTALL_DATA_DIR} ${PREFIX}/share/u-boot/${BOARD}
	-cd ${WRKSRC}/build/${BOARD} && \
	    cp ${FILES} ${PREFIX}/share/u-boot/${BOARD}/
.endfor

.include <bsd.port.mk>
