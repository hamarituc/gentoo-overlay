# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1 pypi

DESCRIPTION="Helpers to assist with building Python pkgs with compiled C/Cython extensions"
HOMEPAGE="https://extension-helpers.readthedocs.io"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"

BDEPEND="dev-python/setuptools-scm[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
distutils_enable_sphinx docs dev-python/sphinx-automodapi

python_test() {
	epytest -k 'not test_limited_api'
}
