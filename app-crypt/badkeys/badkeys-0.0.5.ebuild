# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..11} )
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
	SRC_URI="https://github.com/badkeys/badkeys/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"

RDEPEND="
	dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/gmpy[${PYTHON_USEDEP}]
"

PATCHES=(
	"${FILESDIR}/${PN}-tests.patch"
	"${FILESDIR}/${PN}-data.patch"
)

src_prepare()
{
	default

	# These tests require access to the online blocklist.
	rm "${S}/tests/test_ecbl.py" || die
	rm "${S}/tests/test_rsabl.py" || die
}

distutils_enable_tests pytest
