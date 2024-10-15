# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

#PYTHON_COMPAT=( python3_{10..12} )

# FIXME: Python Support seems to be broken

inherit meson xdg-utils
#inherit meson python-single-r1 xdg-utils

DESCRIPTION="A Qt and C++ GUI for radare2 reverse engineering framework"
HOMEPAGE="https://github.com/radareorg/iaito"
SRC_URI="
	https://github.com/radareorg/iaito/archive/refs/tags/${PV/_/-}.tar.gz -> ${P}.tar.gz
"

S="${WORKDIR}/${PN}-${PV/_/-}"

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
	=dev-util/radare2-5.9*
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

EMESON_SOURCE="${S}/src"

#pkg_setup() {
#	use python && python-single-r1_pkg_setup
#}

src_configure() {
	local emesonargs=(
		#$(meson_use python enable_python)
		#$(meson_use python enable_python_bindings)
	)
	meson_src_configure
}

src_install() {
	meson_src_install

	# Build system doesn't install anything
	pushd "${S}-build" || die
	dobin iaito
	popd || die
}

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}
