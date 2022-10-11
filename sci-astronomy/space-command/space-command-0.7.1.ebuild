# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )
inherit distutils-r1

DESCRIPTION="Satellite tracking command line"
HOMEPAGE="https://github.com/galactics/space-command"

if [[ ${PV} = "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/galactics/space-command.git"
else
	SRC_URI="https://github.com/galactics/space-command/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"
	KEYWORDS="amd64 x86"
fi

LICENSE="MIT"
SLOT="0"

RDEPEND="
	${PYTHON_DEPS}
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/beautifulsoup4[${PYTHON_USEDEP}]
	dev-python/beyond[${PYTHON_USEDEP}]
	dev-python/docopt[${PYTHON_USEDEP}]
	dev-python/matplotlib[${PYTHON_USEDEP}]
	dev-python/peewee[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
"

RESTRICT="test"

PATCHES=(
	"${FILESDIR}/${P}-celestrak.patch"
	"${FILESDIR}/${P}-sqlite.patch"
)

src_prepare() {
	default

	sed -e "s/--cov space --cov-report html //" -i "${S}/setup.cfg" || die
}
