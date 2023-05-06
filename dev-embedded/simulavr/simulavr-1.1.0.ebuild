# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# PYTHON_COMPAT=( python3_{9..11} )

# inherit cmake git-r3 python-r1
inherit cmake git-r3

DESCRIPTION="Atmel AVR simulator"
HOMEPAGE="https://www.nongnu.org/simulavr/"
EGIT_REPO_URI="https://git.savannah.nongnu.org/git/simulavr.git"
EGIT_COMMIT="release-${PV}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
# IUSE="python verilog"
IUSE="verilog"

# RDEPEND="${PYTHON_DEPS}"
RDEPEND=""
DEPEND="${RDEPEND}"
BDEPEND="
	sys-apps/help2man
	sys-apps/texinfo
	verilog? ( sci-electronics/iverilog )
"
# ${PYTHON_DEPS}
# dev-lang/swig
# dev-python/beautifulsoup4[${PYTHON_USEDEP}]
# dev-python/requests[${PYTHON_USEDEP}]
# dev-python/sphinx[${PYTHON_USEDEP}]

PATCHES=(
	"${FILESDIR}/${P}-git-version.patch"
	"${FILESDIR}/${P}-cmake-dirs.patch"
	"${FILESDIR}/${P}-install-dirs.patch"
	"${FILESDIR}/${P}-no-gzip.patch"
	# "${FILESDIR}/${P}-install-pysimulavr.patch"
)

src_configure() {
	local mycmakeargs=()

	# use python  && mycmakeargs+=( -DBUILD_PYTHON=ON  )
	use verilog && mycmakeargs+=( -DBUILD_VERILOG=ON )

	cmake_src_configure
}

src_compile() {
	cmake_src_compile "all"
	cmake_src_compile "progdoc"
}

src_install() {
	cmake_src_install
}
