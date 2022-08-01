# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

#PYTHON_COMPAT=( python3_{9..11} )
TRANS_COMMIT="9e4b6de0d1cbf8f8bf077240b54532cc32b384b4"

# FIXME: Python Support seem to be broken

inherit meson xdg-utils
#inherit meson python-single-r1 xdg-utils

DESCRIPTION="A Qt and C++ GUI for radare2 reverse engineering framework"
HOMEPAGE="https://github.com/radareorg/iaito"
SRC_URI="
	https://github.com/radareorg/iaito/archive/refs/tags/${PV/_/-}.tar.gz -> ${P}.tar.gz
	https://github.com/radareorg/iaito-translations/archive/${TRANS_COMMIT}.tar.gz -> ${PN}-translations-${TRANS_COMMIT}.tar.gz
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
#IUSE="python"
#REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtsvg:5
	dev-qt/qtwidgets:5
	dev-util/radare2
"

#	python? (
#		$(python_gen_cond_dep '
#			dev-python/shiboken2[${PYTHON_USEDEP}]
#			dev-python/pyside2[${PYTHON_USEDEP}]
#		')
#	)

RDEPEND="
	${DEPEND}
"

#	python? ( ${PYTHON_DEPS} )

S="${WORKDIR}/${PN}-${PV/_/-}"

EMESON_SOURCE="${S}/src"

#pkg_setup() {
#	use python && python-single-r1_pkg_setup
#}

src_prepare() {
	default
	rmdir "${S}/src/translations" || die
	mv "${WORKDIR}/${PN}-translations-${TRANS_COMMIT}" "${S}/src/translations" || die
}

src_configure() {
	local emesonargs=(
		#$(meson_use python enable_python)
		#$(meson_use python enable_python_bindings)
	)
	meson_src_configure
}

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}
