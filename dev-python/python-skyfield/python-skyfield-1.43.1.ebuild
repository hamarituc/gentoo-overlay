# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="Astronomical Computation Library"
HOMEPAGE="https://rhodesmill.org/skyfield/"

if [[ ${PV} = "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/skyfielders/python-skyfield.git"
else
	SRC_URI="https://github.com/skyfielders/python-skyfield/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"
	KEYWORDS="amd64 x86"
fi

LICENSE="MIT"
SLOT="0"

RDEPEND="
	${PYTHON_DEPS}
	>=dev-python/certifi-2017.4.17[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	>=dev-python/python-jplephem-2.13[${PYTHON_USEDEP}]
	>=dev-python/python-sgp4-2.2[${PYTHON_USEDEP}]
"

RESTRICT="test"

distutils_enable_sphinx skyfield/documentation
