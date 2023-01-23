# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9..11} )
inherit distutils-r1

DESCRIPTION="Flight Dynamic Library"
HOMEPAGE="https://github.com/galactics/beyond"

if [[ ${PV} = "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/galactics/beyond.git"
else
	SRC_URI="https://github.com/galactics/beyond/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"
	KEYWORDS="amd64 x86"
fi

LICENSE="MIT"
SLOT="0"

RDEPEND="
	${PYTHON_DEPS}
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/python-jplephem[${PYTHON_USEDEP}]
	dev-python/python-sgp4[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/xmlschema-1.4.1[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

src_prepare() {
	default

	sed -e "s/--cov beyond --cov-report html //" -i "${S}/setup.cfg" || die
}
