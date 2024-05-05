# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )

PYPI_NO_NORMALIZE=1
PYPI_PN=${PN//-/_}

inherit distutils-r1 pypi

DESCRIPTION="International earth rotation data for Astropy"
HOMEPAGE="
	https://pypi.org/project/astropy-iers-data/
	https://github.com/astropy/astropy-iers-data
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
