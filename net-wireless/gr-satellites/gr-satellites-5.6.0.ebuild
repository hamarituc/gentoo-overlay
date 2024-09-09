# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )

if [[ ${PV} == 9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/daniestevez/gr-satellites/${PN}"
	EGIT_BRANCH="maint-3.10"
else
	KEYWORDS="~amd64 ~x86"
	SRC_URI="https://github.com/daniestevez/gr-satellites/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

inherit cmake optfeature python-single-r1

DESCRIPTION="GNU Radio decoder for Amateur satellites"
HOMEPAGE="https://github.com/daniestevez/gr-satellites"

LICENSE="GPL-3"
SLOT="0/${PV}"
IUSE="doc"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
	>=dev-lang/orc-0.4:=
	dev-libs/spdlog:=
	media-libs/libsndfile:=
	=net-wireless/gnuradio-3.10*:=[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/construct-2.9[${PYTHON_USEDEP}]
		dev-python/pybind11[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/websocket-client[${PYTHON_USEDEP}]
	')
"
DEPEND="${RDEPEND}"
BDEPEND="
	doc? ( app-text/doxygen )
"

PATCHES=(
	"${FILESDIR}/${PN}-$(ver_cut 1)-no-bzip2.patch"
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

pkg_postinst() {
	optfeature "realtime image decoding" media-gfx/feh
}
