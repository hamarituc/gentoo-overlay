# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Deep ghidra decompiler and sleigh disassembler integration for rizin"
HOMEPAGE="https://github.com/rizinorg/rz-ghidra"

if [[ ${PV} == "9999" ]] ; then
    inherit git-r3
	EGIT_REPO_URI="https://github.com/rizinorg/rz-ghidra.git"
	EGIT_SUBMODULES=( '*' '-third-party/pugixml' )
    KEYWORDS=""
else
	EGIT_COMMIT="v${PV}"
	# From git submodule
	GHIDRA_COMMIT="d87905747fe38d2dcd7492ed2e83bbf438b156d3"

	SRC_URI="
		https://github.com/rizinorg/rz-ghidra/archive/v${PV}.tar.gz -> ${P}.tar.gz
		https://github.com/rizinorg/ghidra/archive/${GHIDRA_COMMIT}.tar.gz -> ghidra-${PN}-${GHIDRA_COMMIT}.tar.gz
	"
	KEYWORDS="~amd64"
fi

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="~amd64"

IUSE="cutter"

DEPEND="
	dev-libs/pugixml
	dev-util/rizin:=
	cutter? (
		dev-qt/qtwidgets:5
		dev-util/cutter
	)
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	if [[ ${PV} != "9999" ]]; then
		rmdir "${S}/ghidra/ghidra" || die
		mv "${WORKDIR}/ghidra-${GHIDRA_COMMIT}" "${S}/ghidra/ghidra" || die
	fi

	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_CUTTER_PLUGIN=$(usex cutter)
		-DCUTTER_INSTALL_PLUGDIR="${EPREFIX}/usr/share/rizin/cutter/plugins/native/"
		-DUSE_SYSTEM_PUGIXML=ON
	)
	cmake_src_configure
}
