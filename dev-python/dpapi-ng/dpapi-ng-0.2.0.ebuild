# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1

DESCRIPTION="Python DPAPI NG Decryptor for non-Windows Platforms"
HOMEPAGE="
	https://pypi.org/project/dpapi-ng/
	https://github.com/jborean93/dpapi-ng
"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/jborean93/dpapi-ng.git"
else
	SRC_URI="https://github.com/jborean93/dpapi-ng/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"

RDEPEND="
	dev-python/cryptography[${PYTHON_USEDEP}]
	>=dev-python/dnspython-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/pyspnego-0.9.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
