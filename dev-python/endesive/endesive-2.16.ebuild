# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..11} )
inherit distutils-r1

DESCRIPTION="Sign and verify digital signatures in mail, PDF and XML documents"
HOMEPAGE="
	https://pypi.org/project/endesive/
	https://github.com/m32/endesive
"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/m32/endesive.git"
else
	SRC_URI="https://github.com/m32/endesive/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
	KEYWORDS="amd64 x86"
fi

LICENSE="MIT LGPL-3 BSD"
SLOT="0"
IUSE="examples"

RDEPEND="
	dev-python/asn1crypto[${PYTHON_USEDEP}]
	dev-python/attrs[${PYTHON_USEDEP}]
	dev-python/certvalidator[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/oscrypto[${PYTHON_USEDEP}]
	dev-python/paramiko[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/pykcs11[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	test?
	(
		dev-libs/softhsm:=
		dev-python/unittest-or-fail[${PYTHON_USEDEP}]
	)
"

DOCS=( README.rst )

PATCHES=(
	"${FILESDIR}/${PN}-2.16-test-import.patch"
	"${FILESDIR}/${PN}-2.16-test-cms.patch"
	"${FILESDIR}/${PN}-2.16-libdir.patch"
	"${FILESDIR}/${PN}-2.16-fontdir.patch"
)

distutils_enable_tests unittest

src_prepare() {
	default

	# Missing fixtures
	rm tests/test_hsm.py || die
}

python_install_all() {
	if use examples; then
		dodoc -r examples
	fi

	distutils-r1_python_install_all
}
