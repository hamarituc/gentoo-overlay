# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..11} )
inherit distutils-r1

DESCRIPTION="sign and stamp PDF files"
HOMEPAGE="
	https://github.com/MatthiasValvekens/pyHanko
	https://pypi.org/project/pyHanko/
"
SRC_URI="https://github.com/MatthiasValvekens/pyHanko/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="async pkcs11 xmp"

# TODO
# * fonts
#   -> fonttools>=4.33.3
#   -> uharfbuzz>=0.25.0,<0.36.0
# * image
#   -> Pillow>=7.2.0
#   -> python-barcode==0.14.0

RDEPEND="
	>=dev-python/asn1crypto-1.5.1[${PYTHON_USEDEP}]
	>=dev-python/click-7.1.2[${PYTHON_USEDEP}]
	>=dev-python/cryptography-3.3.1[${PYTHON_USEDEP}]
	>=dev-python/oscrypto-1.2.1[${PYTHON_USEDEP}]
	=dev-python/pyhanko-certvalidator-0.20*[${PYTHON_USEDEP}]
	>=dev-python/pytz-2020.1[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.3.1[${PYTHON_USEDEP}]
	>=dev-python/qrcode-6.1[${PYTHON_USEDEP}]
	>=dev-python/requests-2.24.0[${PYTHON_USEDEP}]
	>=dev-python/tzlocal-2.1[${PYTHON_USEDEP}]
	async? ( >=dev-python/aiohttp-3.8.0[${PYTHON_USEDEP}] )
	pkcs11?	( >=dev-python/python-pkcs11-0.7.0[${PYTHON_USEDEP}] )
	xmp? ( >=dev-python/defusedxml-0.7.1[${PYTHON_USEDEP}] )
"

# Tests need a lot of unavailable packages
RESTRICT="test"

#BDEPEND="
#	test? (
#		>=dev-python/aiohttp-3.8.0[${PYTHON_USEDEP}]
#		>=dev-python/certomancer-0.9.1[${PYTHON_USEDEP}]
#		>=dev-python/freezegun-1.1.0[${PYTHON_USEDEP}]
#		>=dev-python/pytest-aiohttp-1.0.4[${PYTHON_USEDEP}]
#		>=dev-python/requests-mock-1.8.0[${PYTHON_USEDEP}]
#	)
#"
#
#distutils_enable_tests pytest
