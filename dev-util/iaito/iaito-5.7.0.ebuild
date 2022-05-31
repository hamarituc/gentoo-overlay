# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
TRANS_COMMIT="9e4b6de0d1cbf8f8bf077240b54532cc32b384b4"

inherit cmake xdg-utils python-single-r1

DESCRIPTION="A Qt and C++ GUI for radare2 reverse engineering framework"
HOMEPAGE="https://github.com/radareorg/iaito"
SRC_URI="
	https://github.com/radareorg/iaito/archive/refs/tags/${PV/_/-}.tar.gz -> ${P}.tar.gz
	https://github.com/radareorg/iaito-translations/archive/${TRANS_COMMIT}.tar.gz -> ${PN}-translations-${TRANS_COMMIT}.tar.gz
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="graphviz"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="
	${PYTHON_DEPS}
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtsvg:5
	dev-qt/qtwidgets:5
	dev-util/radare2
	graphviz? ( media-gfx/graphviz )
"

RDEPEND="
	${DEPEND}
	dev-qt/linguist-tools:5
"

S="${WORKDIR}/${PN}-${PV/_/-}"

CMAKE_USE_DIR="${S}/src"

src_prepare() {
	rmdir "${S}/src/translations" || die
	mv "${WORKDIR}/${PN}-translations-${TRANS_COMMIT}" "${S}/src/translations" || die

	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DCMAKE_CXX_COMPILER="$(tc-getCXX)"
		-DCMAKE_C_COMPILER="$(tc-getCC)"
		-DCMAKE_INSTALL_PREFIX="${EPREFIX}/usr"
		-DIAITO_ENABLE_GRAPHVIZ="$(usex graphviz)"
		-DIAITO_ENABLE_KSYNTAXHIGHLIGHTING=OFF
		-DIAITO_ENABLE_PYTHON=ON
		-DIAITO_USE_ADDITIONAL_RADARE2_PATHS=OFF
		-DIAITO_USE_BUNDLED_RADARE2=OFF
	)

	cmake_src_configure
}

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}
