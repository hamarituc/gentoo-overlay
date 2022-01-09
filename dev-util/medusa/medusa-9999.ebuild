# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )

inherit cmake python-single-r1

DESCRIPTION="An open source interactive disassembler"
HOMEPAGE="https://github.com/wisk/medusa"

if [[ ${PV} =~ "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/wisk/medusa.git"
else
	SRC_URI="https://github.com/wisk/medusa/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE=""
SLOT="0"
IUSE="doc python qt5 sqlite"

REQUIRED_USE="
	python? ( ${PYTHON_REQUIRED_USE} )
"

DEPEND="
	>=dev-libs/boost-1.46:=
	dev-libs/libfmt
	dev-libs/pegtl
	sci-libs/ogdf
	python? ( dev-python/pybind11 )
	qt5?
	(
		>=dev-qt/qtcore-5.2.0
		>=dev-qt/qtwidgets-5.2.0
	)
	sqlite? ( >=dev-db/sqlite-3 )
"

RDEPEND="
	${DEPEND}
	python?
	(
		${PYTHON_DEPS}
		$(python_gen_cond_dep '
			dev-libs/boost:=[python,${PYTHON_USEDEP}]
		')
	)
"

BDEPEND="doc? ( app-doc/doxygen )"

pkg_setup() {
	use python && python-single-r1_pkg_setup
}

src_configure() {
	local mycmakeargs=(
		-DOGDF_PATH=/usr
		-DBoost_USE_STATIC_LIBS=OFF
	)
	cmake_src_configure
}
