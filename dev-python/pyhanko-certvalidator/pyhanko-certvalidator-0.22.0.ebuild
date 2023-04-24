# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..11} )
inherit distutils-r1

DESCRIPTION="Python library for validating X.509 certificates and paths"
HOMEPAGE="
	https://github.com/MatthiasValvekens/certvalidator
	https://pypi.org/project/pyhanko-certvalidator/
"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/MatthiasValvekens/certvalidator.git"
else
	SRC_URI="https://github.com/MatthiasValvekens/certvalidator/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
	S="${WORKDIR}/certvalidator-${PV}"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"

RDEPEND="
	>=dev-python/asn1crypto-1.5.1[${PYTHON_USEDEP}]
	>=dev-python/cryptography-3.3.1[${PYTHON_USEDEP}]
	>=dev-python/oscrypto-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.24.0[${PYTHON_USEDEP}]
	>=dev-python/uritools-3.0.1[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/freezegun-1.1.0[${PYTHON_USEDEP}]
		>=dev-python/aiohttp-3.8.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-aiohttp-1.0.4[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
