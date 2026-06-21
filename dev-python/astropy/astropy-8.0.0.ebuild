# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
DISTUTILS_EXT=1
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1 pypi

DESCRIPTION="Python astronomy package"
HOMEPAGE="https://www.astropy.org/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="hdf5 parquet test"

# TODO: Unbundle wcslib
# TODO: Unbundle expat
RDEPEND="
	>=dev-python/astropy-iers-data-0.2026.6.1.17.39.59[${PYTHON_USEDEP}]
	>=dev-python/beautifulsoup4-4.11.2[${PYTHON_USEDEP}]
	>=dev-python/bleach-3.2.1[${PYTHON_USEDEP}]
	>=dev-python/bottleneck-1.4.0[${PYTHON_USEDEP}]
	>=dev-python/certifi-2022.6.15.1[${PYTHON_USEDEP}]
	>=dev-python/html5lib-1.1[${PYTHON_USEDEP}]
	>=dev-python/matplotlib-3.8.4[${PYTHON_USEDEP}]
	>=dev-python/mpmath-1.2.1[${PYTHON_USEDEP}]
	>=dev-python/narwhals-2.13.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-2.2.2[${PYTHON_USEDEP}]
	>=dev-python/pandas-2.0[${PYTHON_USEDEP}]
	>=dev-python/pyerfa-2.0.1.3[${PYTHON_USEDEP}]
	>=dev-python/pyparsing-2.4.0[${PYTHON_USEDEP}]
	>=dev-python/python-jplephem-2.6[${PYTHON_USEDEP}]
	>=dev-python/pytz-2016.10[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0.0[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.13[${PYTHON_USEDEP}]
	>=dev-python/sortedcontainers-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.0.0[${PYTHON_USEDEP}]
	hdf5? ( >=dev-python/h5py-3.8.0[${PYTHON_USEDEP}] )
	parquet? ( >=dev-python/pyarrow-16.0[${PYTHON_USEDEP}] )
	test? ( >=dev-python/threadpoolctl-3.0.0[${PYTHON_USEDEP}] )
"
BDEPEND="
	=dev-python/extension-helpers-1*[${PYTHON_USEDEP}]
"

RESTRICT="test"
