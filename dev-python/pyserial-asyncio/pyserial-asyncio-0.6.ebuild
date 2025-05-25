# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} pypy3_11 )
PYPI_NO_NORMALIZE=1

inherit distutils-r1 pypi

DESCRIPTION="Python Serial Port extension"
HOMEPAGE="
	https://github.com/pyserial/pyserial-asyncio/
	https://pypi.org/project/pyserial-asyncio/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	>=dev-python/pyserial-3.1.1[${PYTHON_USEDEP}]
"

DOCS=( README.rst )

distutils_enable_tests pytest

distutils_enable_sphinx documentation --no-autodoc
