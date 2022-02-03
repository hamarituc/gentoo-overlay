# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Open Graph Drawing Framework"
HOMEPAGE="http://www.ogdf.net/"

if [[ ${PV} =~ "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/ogdf/ogdf.git"
else
	# Name depends on release
	SRC_URI="https://github.com/ogdf/ogdf/archive/refs/tags/dogwood-202202.tar.gz -> ${P}.tar.gz"
	S="${WORKDIR}/${PN}-dogwood-${PV//.}"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-2 GPL-3"
SLOT="0"
IUSE="doc"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="doc? ( app-doc/doxygen )"

src_configure() {
	local mycmakeargs=(
		-DOGDF_INSTALL_LIBRARY_DIR="$(get_libdir)"
		-DCOIN_INSTALL_LIBRARY_DIR="$(get_libdir)"
		-DDOC_INSTALL="$(usex doc)"
		-DDOC_INSTALL_DIR="share/doc/${PN}"
	)
	cmake_src_configure
}
