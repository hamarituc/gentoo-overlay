# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake git-r3

DESCRIPTION="Deep ghidra decompiler and sleigh disassembler integration for rizin"
HOMEPAGE="https://github.com/rizinorg/rz-ghidra"

EGIT_REPO_URI="https://github.com/rizinorg/rz-ghidra.git"
EGIT_COMMIT="v${PV}"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64"

IUSE="cutter"

DEPEND="
	dev-util/rizin
	cutter? (
		dev-qt/qtwidgets:5
		dev-util/cutter
	)
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DBUILD_CUTTER_PLUGIN=$(usex cutter)
	)
	cmake_src_configure
}
