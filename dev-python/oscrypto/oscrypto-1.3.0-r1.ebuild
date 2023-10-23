# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9..11} pypy3 )
inherit edo distutils-r1 optfeature

DESCRIPTION="TLS sockets, key generation, encryption, decryption, signing, verification"
HOMEPAGE="
	https://pypi.org/project/oscrypto/
	https://github.com/wbond/oscrypto
"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/wbond/oscrypto.git"
else
	SRC_URI="https://github.com/wbond/${PN}/archive/${PV}.tar.gz -> ${P}.gh.tar.gz"
	KEYWORDS="amd64 x86"
fi

LICENSE="MIT"
SLOT="0"

RDEPEND="
	dev-libs/openssl
	>=dev-python/asn1crypto-1.5.1[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		$(python_gen_cond_dep 'dev-python/cffi[${PYTHON_USEDEP}]' 'python*')
	)
"

DOCS=( docs {changelog,readme}.md )

PATCHES=(
	"${FILESDIR}/${P}-openssl-version.patch"
)

distutils_enable_tests unittest

python_test() {
	local -x OSCRYPTO_SKIP_INTERNET_TESTS="true"
	edo ${EPYTHON} -m tests
}

pkg_postinst() {
	optfeature "faster FFI" virtual/python-cffi
}
