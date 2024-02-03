# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )
inherit distutils-r1

MY_PN=PyKCS11
MY_P=${MY_PN}-${PV}

DESCRIPTION="PKCS#11 Wrapper for Python"
HOMEPAGE="
	https://pypi.org/project/pykcs11/
	https://github.com/LudovicRousseau/PyKCS11
"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/LudovicRousseau/PyKCS11.git"
else
	SRC_URI="https://github.com/LudovicRousseau/PyKCS11/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"
	KEYWORDS="amd64 x86"
	S="${WORKDIR}/${MY_P}"
fi

LICENSE="GPL-2+"
SLOT="0"
IUSE="examples"
RESTRICT="test"

RDEPEND="
	dev-lang/swig
	dev-python/asn1crypto[${PYTHON_USEDEP}]
"

DOCS=( README.md )

python_install_all() {
	if use examples; then
		dodoc -r samples
	fi

	distutils-r1_python_install_all
}
