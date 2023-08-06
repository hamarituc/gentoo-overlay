# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake flag-o-matic

DESCRIPTION="Deep ghidra decompiler and sleigh disassembler integration for rizin"
HOMEPAGE="https://github.com/rizinorg/rz-ghidra"

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/rizinorg/rz-ghidra.git"
	EGIT_SUBMODULES=( '*' '-third-party/pugixml' )
else
	# From git submodule
	GHIDRA_COMMIT="d89dd09b18645ba62fc202f962fdb73fb60145a7"

	SRC_URI="
		https://github.com/rizinorg/rz-ghidra/archive/v${PV}.tar.gz -> ${P}.tar.gz
		https://github.com/rizinorg/ghidra/archive/${GHIDRA_COMMIT}.tar.gz -> ghidra-${PN}-${GHIDRA_COMMIT}.tar.gz
	"
	KEYWORDS="~amd64"
fi

LICENSE="LGPL-3+"
SLOT="0"

IUSE="cutter"

DEPEND="
	dev-libs/pugixml
	=dev-util/rizin-$(ver_cut 1-2)*:=
	cutter? (
		dev-qt/qtwidgets:5
		dev-util/cutter
	)
"
RDEPEND="${DEPEND}"

src_prepare() {
	if [[ ${PV} != "9999" ]]; then
		rmdir "${S}/ghidra/ghidra" || die
		mv "${WORKDIR}/ghidra-${GHIDRA_COMMIT}" "${S}/ghidra/ghidra" || die
	fi

	cmake_src_prepare
}

src_configure() {
	append-flags "-mno-crc32"

	local mycmakeargs=(
		-DBUILD_CUTTER_PLUGIN=$(usex cutter)
		-DUSE_SYSTEM_PUGIXML=ON
	)

	if use cutter; then
		mycmakeargs+=(
			-DCUTTER_INSTALL_PLUGDIR="${EPREFIX}/usr/share/rizin/cutter/plugins/native/"
		)
	fi

	cmake_src_configure
}
