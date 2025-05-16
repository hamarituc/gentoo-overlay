# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..13} )

if [[ ${PV} == 9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.com/librespacefoundation/satnogs/gr-satnogs.git"
else
	MY_P="${PN}-v${PV}"
	SRC_URI="https://gitlab.com/librespacefoundation/satnogs/gr-satnogs/-/archive/v${PV}/${MY_P}.tar.bz2 -> ${P}.tar.bz2"
	S="${WORKDIR}/${MY_P}"
	KEYWORDS="~amd64"
fi

inherit cmake python-single-r1

DESCRIPTION="GNU Radio decoder for various scientific and academic sattelites"
HOMEPAGE="https://gitlab.com/librespacefoundation/satnogs/gr-satnogs"

LICENSE="GPL-3"
SLOT="0/${PV}"
IUSE="doc python"

REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

RDEPEND="
	>=dev-cpp/nlohmann_json-3.5:=
	dev-cpp/pngpp:=
	dev-libs/boost:=
	media-libs/hamlib:=
	media-libs/libogg:=
	media-libs/libpng:=
	media-libs/libvorbis:=
	>=net-wireless/gnuradio-3.10:=[${PYTHON_SINGLE_USEDEP}]
	sci-libs/gsl:=
	sci-libs/itpp:=
	sci-libs/volk:=
	python?
	(
		${PYTHON_DEPS}
		$(python_gen_cond_dep '
			>=dev-python/construct-2.9[${PYTHON_USEDEP}]
			dev-python/pybind11[${PYTHON_USEDEP}]
			dev-python/requests[${PYTHON_USEDEP}]
		')
	)
"
DEPEND="${RDEPEND}"
BDEPEND="
	doc? ( app-text/doxygen )
"

pkg_setup() {
	use python && python-single-r1_pkg_setup
}

src_configure() {
	local mycmakeargs=(
		-DENABLE_DOXYGEN=$(usex doc)
		-DENABLE_PYTHON=$(usex python)
		-DPYTHON_EXECUTABLE="${PYTHON}"
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	find "${ED}" -name '*.py[oc]' -delete || die
	python_optimize

	mv "${ED}/usr/share/doc/${PN}" "${ED}/usr/share/doc/${P}"
}
