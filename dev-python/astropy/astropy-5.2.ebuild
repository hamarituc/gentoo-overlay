# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="Python astronomy package"
HOMEPAGE="https://www.astropy.org/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

KEYWORDS="amd64 x86"
LICENSE="BSD"
SLOT="0"
IUSE="hdf5"

# TODO: wcslib
RDEPEND="${PYTHON_DEPS}
	>=dev-python/numpy-1.20[${PYTHON_USEDEP}]
	>=dev-python/pyerfa-2.0[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-3.13[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.5[${PYTHON_USEDEP}]
	>=dev-python/matplotlib-3.1[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	dev-python/mpmath[${PYTHON_USEDEP}]
	dev-python/html5lib[${PYTHON_USEDEP}]
	dev-python/beautifulsoup4[${PYTHON_USEDEP}]
	dev-python/python-jplephem[${PYTHON_USEDEP}]
	>=sci-libs/cfitsio-4.2.0
	hdf5? ( dev-python/h5py[${PYTHON_USEDEP}] )
"
BDEPEND="
	dev-python/extension-helpers[${PYTHON_USEDEP}]
"

RESTRICT="test"

distutils_enable_sphinx skyfield/documentation
