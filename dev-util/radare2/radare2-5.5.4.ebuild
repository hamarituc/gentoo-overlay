# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit bash-completion-r1 toolchain-funcs

# From libr/asm/arch/arm/v35arm64/Makefile
VECTOR35_ARCH_ARM64_COMMIT="3c5eaba46dab72ecb7d5f5b865a13fdeee95b464"
VECTOR35_ARCH_ARMV7_COMMIT="dde39f69ffea19fc37e681874b12cb4707bc4f30"

DESCRIPTION="unix-like reverse engineering framework and commandline tools"
HOMEPAGE="http://www.radare.org"
SRC_URI="
	https://github.com/radareorg/radare2/archive/${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/radareorg/vector35-arch-arm64/archive/${VECTOR35_ARCH_ARM64_COMMIT}.tar.gz -> vector35-arch-arm64-${VECTOR35_ARCH_ARM64_COMMIT}.tar.gz
	https://github.com/radareorg/vector35-arch-armv7/archive/${VECTOR35_ARCH_ARMV7_COMMIT}.tar.gz -> vector35-arch-armv7-${VECTOR35_ARCH_ARMV7_COMMIT}.tar.gz
"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="ssl"

RDEPEND="
	dev-libs/libzip
	dev-libs/xxhash
	sys-apps/file
	sys-libs/zlib
	dev-libs/capstone:0=
	ssl? ( dev-libs/openssl:0= )
"
DEPEND="
	${RDEPEND}
	dev-util/gperf
"
BDEPEND="virtual/pkgconfig"

PATCHES=(
	"${FILESDIR}/${P}-nogit.patch"
)

src_prepare() {
	mv "${WORKDIR}/vector35-arch-arm64-${VECTOR35_ARCH_ARM64_COMMIT}" "${S}/libr/asm/arch/arm/v35arm64/arch-arm64" || die
	mv "${WORKDIR}/vector35-arch-armv7-${VECTOR35_ARCH_ARMV7_COMMIT}" "${S}/libr/asm/arch/arm/v35arm64/arch-armv7" || die

	# Fix hardcoded docdir for fortunes
	sed -i -e "/^#define R2_FORTUNES/s/radare2/$PF/" \
		libr/include/r_userconf.h.acr
	default
}

src_configure() {
	# Ideally these should be set by ./configure
	tc-export CC AR LD OBJCOPY RANLIB
	export HOST_CC=${CC}

	econf \
		--without-libuv \
		--with-syscapstone \
		--with-sysmagic \
		--with-sysxxhash \
		--with-syszip \
		$(use_with ssl openssl)
}

src_install() {
	default

	insinto /usr/share/zsh/site-functions
	doins doc/zsh/_*

	newbashcomp doc/bash_autocompletion.sh "${PN}"
	bashcomp_alias "${PN}" rafind2 r2 rabin2 rasm2 radiff2

	# a workaround for unstable $(INSTALL) call, bug #574866
	local d
	for d in doc/*; do
		if [[ -d ${d} ]]; then
			rm -rfv "${d}" || die "failed to delete '${d}'"
		fi
	done

	# These are not really docs. radare assumes
	# uncompressed files: bug #761250
	docompress -x /usr/share/doc/${PF}/fortunes.{creepy,fun,nsfw,tips}
}
