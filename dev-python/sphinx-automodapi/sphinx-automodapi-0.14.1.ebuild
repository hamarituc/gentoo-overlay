# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="Sphinx extension for generating API documentation"
HOMEPAGE="
	https://sphinx-automodeapi.readthedocs.io/
	https://github.com/astropy/sphinx-automodapi
	https://pypi.org/project/sphinx-automodapi/
"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"

RDEPEND="
	>=dev-python/sphinx-2.0[${PYTHON_USEDEP}]
"

DOCS=( README.rst CHANGES.rst )

distutils_enable_tests pytest
distutils_enable_sphinx docs --no-autodoc
