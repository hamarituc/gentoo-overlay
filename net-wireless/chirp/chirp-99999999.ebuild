# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1 xdg-utils git-r3

DESCRIPTION="Free open-source tool for programming your amateur radio"
HOMEPAGE="http://chirp.danplanet.com"

RESTRICT="test"

EGIT_REPO_URI="https://github.com/hamarituc/chirp.git"
EGIT_BRANCH="py3_new"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="radioreference"

DEPEND="${PYTHON_DEPS}
	dev-python/pygobject[${PYTHON_USEDEP}]
	dev-python/pyserial[${PYTHON_USEDEP}]
	dev-libs/libxml2[python]
	dev-python/suds[${PYTHON_USEDEP}]
	dev-python/future[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}
	radioreference? ( dev-python/suds[${PYTHON_USEDEP}] )"

PATCHES=(
	"${FILESDIR}/${P}-no-tests.patch"
)

src_prepare() {
	sed -i -e "/share\/doc\/chirp/d" setup.py || die
	distutils-r1_src_prepare
}

python_test() {
	pushd tests > /dev/null
	"${PYTHON}" run_tests || die
	popd > /dev/null
}

pkg_postinst() {
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
}
