# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..11} )
inherit distutils-r1

DESCRIPTION="Construct, mock & deploy PKI test configurations"
HOMEPAGE="
	https://github.com/MatthiasValvekens/certomancer
	https://pypi.org/project/certomancer/
"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/MatthiasValvekens/certomancer.git"
else
	SRC_URI="https://github.com/MatthiasValvekens/certomancer/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE="pkcs11"

RDEPEND="
	>=dev-python/asn1crypto-1.5.0[${PYTHON_USEDEP}]
	>=dev-python/cryptography-3.4.7[${PYTHON_USEDEP}]
	>=dev-python/click-7.1.2[${PYTHON_USEDEP}]
	>=dev-python/oscrypto-1.2.1[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.8.1[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.4.1[${PYTHON_USEDEP}]
	>=dev-python/tzlocal-2.1[${PYTHON_USEDEP}]
	pkcs11? ( >=dev-python/python-pkcs11-0.7.0[${PYTHON_USEDEP}] )
"
BDEPEND="
	test? (
		>=dev-python/freezegun-1.1.0[${PYTHON_USEDEP}]
		>=dev-python/pyhanko-certvalidator-0.20.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-aiohttp-1.0.4[${PYTHON_USEDEP}]
		>=dev-python/pytz-2020.1[${PYTHON_USEDEP}]
		>=dev-python/requests-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/requests-mock-1.8.0[${PYTHON_USEDEP}]
		>=dev-python/werkzeug-2.2.3[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
