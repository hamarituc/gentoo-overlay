# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )

if [[ ${PV} == 9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.com/librespacefoundation/satnogs/gr-satnogs.git"
else
	MY_P="${PN}-v${PV}"
	SRC_URI="https://gitlab.com/librespacefoundation/satnogs/gr-satnogs/-/archive/v${PV}/${MY_P}.tar.bz2 -> ${P}.tar.bz2"
	S="${WORKDIR}/${MY_P}"
	KEYWORDS="amd64"
fi

inherit cmake python-single-r1

DESCRIPTION="GNU Radio decoder for various scientific and academic sattelites"
HOMEPAGE="https://gitlab.com/librespacefoundation/satnogs/gr-satnogs"

LICENSE="GPL-3"
SLOT="0/${PV}"
IUSE="doc"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}
	>=dev-cpp/nlohmann_json-3.5:=
	dev-cpp/pngpp:=
	dev-libs/boost:=
	media-libs/libogg:=
	media-libs/libpng:=
	media-libs/libvorbis:=
	>=net-wireless/gnuradio-3.8:=[${PYTHON_SINGLE_USEDEP}]
	sci-libs/volk:=
	$(python_gen_cond_dep '
		>=dev-python/construct-2.9[${PYTHON_USEDEP}]
		dev-python/pybind11[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
	')
"
DEPEND="${RDEPEND}"
BDEPEND="
	dev-lang/swig
	doc? ( app-text/doxygen )
"

PATCHES=(
	"${FILESDIR}/${PN}-no-qa.patch"
)

src_configure() {
	local mycmakeargs=(
		-DENABLE_DOXYGEN=$(usex doc)
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
