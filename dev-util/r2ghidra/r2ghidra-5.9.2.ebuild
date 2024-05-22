# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="Integration of the Ghidra decompiler for radare2"
HOMEPAGE="https://github.com/radareorg/r2ghidra"

# From Makefile.acr
GHIDRA_COMMIT="0.4.5"

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/radareorg/r2ghidra.git"
	EGIT_SUBMODULES=( '*' '-third-party/pugixml' )
else
	SRC_URI="
		https://github.com/radareorg/r2ghidra/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
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

PATCHES=(
	"${FILESDIR}/${P}-nogit.patch"
	"${FILESDIR}/${P}-system_pugixml.patch"
)

src_prepare() {
	default
	mv "${WORKDIR}/ghidra-native-${GHIDRA_COMMIT}" "${S}/ghidra-native" || die
	emake -C ghidra-native patch
}
