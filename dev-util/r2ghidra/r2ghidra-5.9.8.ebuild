# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="Integration of the Ghidra decompiler for radare2"
HOMEPAGE="https://github.com/radareorg/r2ghidra"

# From Makefile.acr
GHIDRA_COMMIT="0.5.0"

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/radareorg/r2ghidra.git"
	EGIT_SUBMODULES=( '*' '-third-party/pugixml' )
else
	SRC_URI="
		https://github.com/radareorg/r2ghidra/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
		https://github.com/radareorg/r2ghidra/releases/download/${PV}/r2ghidra_sleigh-${PV}.zip
		https://github.com/radareorg/ghidra-native/archive/${GHIDRA_COMMIT}.tar.gz -> ghidra-${PN}-${GHIDRA_COMMIT}.tar.gz
	"
	KEYWORDS="~amd64"
fi

LICENSE="LGPL-3"
SLOT="0"

DEPEND="
	dev-libs/pugixml
	dev-util/radare2:=
"
RDEPEND="${DEPEND}"
BDEPEND="app-arch/unzip"

PATCHES=(
	"${FILESDIR}/${PN}-5.9.2-nogit.patch"
	"${FILESDIR}/${PN}-5.9.2-system_pugixml.patch"
	"${FILESDIR}/${PN}-5.9.8-zlib.patch"
)

src_prepare() {
	default

	mv "${WORKDIR}/ghidra-native-${GHIDRA_COMMIT}" "${S}/ghidra-native" || die
	emake -C ghidra-native patch
}

src_install() {
	meson_install

	insinto "/usr/lib/radare2/${PV}/r2ghidra_sleigh"
	doins -r "${WORKDIR}/r2ghidra_sleigh-${PV}"/*
}
