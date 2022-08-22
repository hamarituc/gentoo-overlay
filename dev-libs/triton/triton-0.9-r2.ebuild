# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )

inherit cmake python-single-r1

DESCRIPTION="Triton is a Dynamic Binary Analysis (DBA) framework"
HOMEPAGE="https://triton.quarkslab.com/"

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/JonathanSalwan/Triton.git"
	KEYWORDS=""
	S="${WORKDIR}/Triton"
	inherit git-r3
else
	SRC_URI="https://github.com/JonathanSalwan/Triton/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
	S="${WORKDIR}/Triton-${PV}"
fi

LICENSE="Apache-2.0"
SLOT="0"

IUSE="python static-libs z3"

REQUIRED_USE="
	python? ( ${PYTHON_REQUIRED_USE} )
	python? ( !static-libs )
"

DEPEND="
	>=dev-libs/boost-1.68:=
	>=dev-libs/capstone-4.0:=
	z3? ( >=sci-mathematics/z3-4.6.0:= )
"
RDEPEND="
	${DEPEND}
	python?
	(
		${PYTHON_DEPS}
		$(python_gen_cond_dep '
			dev-libs/boost[python,${PYTHON_USEDEP}]
			dev-libs/capstone[python,${PYTHON_USEDEP}]
		')
	)
"
BDEPEND=""

PATCHES=(
	"${FILESDIR}/${P}-installdir.patch"
	"${FILESDIR}/${P}-capstone.patch"
)

pkg_setup() {
	use python && python-single-r1_pkg_setup
}

src_configure() {
	local mycmakeargs=(
		-DPYTHON_BINDINGS="$(usex python)"
		-DBUILD_SHARED_LIBS="$(usex static-libs OFF ON)"
		-DZ3_INTERFACE="$(usex z3)"
	)
	cmake_src_configure
}
