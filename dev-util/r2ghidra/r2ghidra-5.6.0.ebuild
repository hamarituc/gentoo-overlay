# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Integration of the Ghidra decompiler for radare2"
HOMEPAGE="https://github.com/radareorg/r2ghidra"

if [[ ${PV} == "9999" ]] ; then
    inherit git-r3
	EGIT_REPO_URI="https://github.com/radareorg/r2ghidra.git"
	EGIT_SUBMODULES=( '*' '-third-party/pugixml' )
	GHIDRA_COMMIT="0.1.5"

    KEYWORDS=""
else
	EGIT_COMMIT="v${PV}"
	GHIDRA_COMMIT="0.1.5"

	SRC_URI="
		https://github.com/radareorg/r2ghidra/archive/v${PV}.tar.gz -> ${P}.tar.gz
		https://github.com/radareorg/ghidra-native/archive/${GHIDRA_COMMIT}.tar.gz -> ghidra-${PN}-${GHIDRA_COMMIT}.tar.gz
	"
	KEYWORDS="~amd64"
fi

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64"

IUSE="iaito"

DEPEND="
	dev-libs/pugixml
	dev-util/radare2
	iaito? (
		dev-qt/qtwidgets:5
		dev-util/iaito
	)
"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}/${P}-nogit.patch"
	"${FILESDIR}/${P}-iaito_cmake.patch"
)

src_prepare() {
	mv "${WORKDIR}/ghidra-native-${GHIDRA_COMMIT}" "${S}/ghidra-native" || die

	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_IAITO_PLUGIN=$(usex iaito)
		-DUSE_SYSTEM_PUGIXML=ON
	)
	cmake_src_configure
}
