# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )
inherit distutils-r1

DESCRIPTION="Tool to find common vulnerabilities in cryptographic public keys"
HOMEPAGE="
	https://github.com/badkeys/badkeys
	https://pypi.org/project/badkeys/
"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/badkeys/badkeys.git"
else
	inherit pypi
	KEYWORDS="amd64"
fi

LICENSE="MIT"
SLOT="0"

RDEPEND="
	dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/gmpy2[${PYTHON_USEDEP}]
	dev-python/dnspython[${PYTHON_USEDEP}]
	dev-python/paramiko[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
