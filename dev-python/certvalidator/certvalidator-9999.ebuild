# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )
inherit distutils-r1

DESCRIPTION="Python library for validating X.509 certificates and paths"
HOMEPAGE="
	https://pypi.org/project/certvalidator/
	https://github.com/wbond/certvalidator
"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/wbond/certvalidator.git"
else
	SRC_URI="https://github.com/wbond/${PN}/archive/${PV}.tar.gz -> ${P}.gh.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"

# Test cases depend on real time (certificate validity)
RESTRICT="test"

RDEPEND="
	>=dev-python/asn1crypto-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/oscrypto-1.1.0[${PYTHON_USEDEP}]
"

DOCS=( docs {changelog,readme}.md )
