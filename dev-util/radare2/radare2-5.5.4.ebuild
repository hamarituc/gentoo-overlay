# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit bash-completion-r1 git-r3 toolchain-funcs

DESCRIPTION="unix-like reverse engineering framework and commandline tools"
HOMEPAGE="http://www.radare.org"

if [[ ${PV} == *9999 ]]; then
	EGIT_REPO_URI="https://github.com/radareorg/radare2"
else
	SRC_URI="https://github.com/radareorg/radare2/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm ~arm64 ~x86"
fi


LICENSE="GPL-2"
SLOT="0"
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

src_unpack() {
	if [[ ${PV} == *9999 ]]; then
		git-r3_src_unpack
	else
		default
	fi

	# From libr/asm/arch/arm/v35arm64/Makefile
	git-r3_fetch https://github.com/radareorg/vector35-arch-arm64 3c5eaba46dab72ecb7d5f5b865a13fdeee95b464
	git-r3_fetch https://github.com/radareorg/vector35-arch-armv7 dde39f69ffea19fc37e681874b12cb4707bc4f30
	git-r3_checkout https://github.com/radareorg/vector35-arch-arm64 "${WORKDIR}/${P}/libr/asm/arch/arm/v35arm64/arch-arm64"
	git-r3_checkout https://github.com/radareorg/vector35-arch-armv7 "${WORKDIR}/${P}/libr/asm/arch/arm/v35arm64/arch-armv7"
}

src_prepare() {
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
