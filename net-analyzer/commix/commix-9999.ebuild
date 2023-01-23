# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="https://commixproject.com/"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/commixproject/commix.git"
else
	SRC_URI="https://github.com/commixproject/commix/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"

RDEPEND="
	${PYTHON_DEPS}
	dev-python/beautifulsoup4[${PYTHON_USEDEP}]
	dev-python/requests[socks5,${PYTHON_USEDEP}]
	dev-python/dnspython[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]
	dev-python/xmltodict[${PYTHON_USEDEP}]
	dev-python/fake-useragent[${PYTHON_USEDEP}]
"

RESTRICT="test"
