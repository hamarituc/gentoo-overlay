# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )
inherit distutils-r1

DESCRIPTION="PKCS#11/Cryptoki support for Python"
HOMEPAGE="
	https://github.com/danni/python-pkcs11
	https://pypi.org/project/python-pkcs11/
"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/danni/python-pkcs11.git"
else
	PYPI_NO_NORMALIZE=true
	inherit pypi
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"

RDEPEND="
	>=dev-python/asn1crypto-1.4.0[${PYTHON_USEDEP}]
	>=dev-python/cached-property-1.5.2[${PYTHON_USEDEP}]
"

# tests require HSM crypto devices
RESTRICT="test"
