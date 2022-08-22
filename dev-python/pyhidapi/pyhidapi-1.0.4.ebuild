# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )
inherit distutils-r1

DESCRIPTION="Python hidapi bindings in ctypes"
HOMEPAGE="https://pypi.org/project/hid/"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/apmorton/${PN}"
else
	SRC_URI="https://github.com/apmorton/pyhidapi/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"
	KEYWORDS="amd64 x86"
fi

LICENSE="MIT"
SLOT="0"

RDEPEND="
	dev-libs/hidapi
"
BDEPEND=""

RESTRICT="test"
