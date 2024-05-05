# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="Python version of NASA DE4xx ephemerides"
HOMEPAGE="https://github.com/brandon-rhodes/python-jplephem"

if [[ ${PV} = "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/brandon-rhodes/python-jplephem.git"
else
	SRC_URI="https://github.com/brandon-rhodes/python-jplephem/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"
	KEYWORDS="amd64 x86"
fi

LICENSE="MIT"
SLOT="0"

RDEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
"

RESTRICT="test"
