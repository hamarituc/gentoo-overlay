# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
DISTUTILS_EXT=1
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1 pypi

DESCRIPTION="Python astronomy package"
HOMEPAGE="https://www.astropy.org/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="hdf5 parquet test"

# TODO: Unbundle wcslib
# TODO: Unbundle expat
RDEPEND="
	>=dev-python/astropy-iers-data-0.2024.10.28.0.34.7[${PYTHON_USEDEP}]
	dev-python/beautifulsoup4[${PYTHON_USEDEP}]
	dev-python/bleach[${PYTHON_USEDEP}]
	dev-python/bottleneck[${PYTHON_USEDEP}]
	dev-python/certifi[${PYTHON_USEDEP}]
	dev-python/html5lib[${PYTHON_USEDEP}]
	>=dev-python/matplotlib-3.9.1[${PYTHON_USEDEP}]
	dev-python/mpmath[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.23[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
	>=dev-python/pyerfa-2.0.1.1[${PYTHON_USEDEP}]
	dev-python/python-jplephem[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-3.13[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.8[${PYTHON_USEDEP}]
	dev-python/sortedcontainers[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.0.0[${PYTHON_USEDEP}]
	hdf5? ( dev-python/h5py[${PYTHON_USEDEP}] )
	parquet? ( >=dev-python/pyarrow-7.0.0[${PYTHON_USEDEP}] )
	test? ( dev-python/threadpoolctl[${PYTHON_USEDEP}] )
"
BDEPEND="
	dev-python/extension-helpers[${PYTHON_USEDEP}]
"

RESTRICT="test"
