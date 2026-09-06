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
	SRC_URI="https://github.com/rizinorg/rz-ghidra/releases/download/v${PV}/${PN}-src-v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"

	S="${WORKDIR}/${PN}"
fi

LICENSE="LGPL-3+"
SLOT="0"

IUSE="cutter"

DEPEND="
	dev-libs/pugixml
	=dev-util/rizin-$(ver_cut 1-2)*:=
	cutter? (
		dev-qt/qtbase:6[gui,widgets]
		dev-util/cutter
	)
"
RDEPEND="${DEPEND}"

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
