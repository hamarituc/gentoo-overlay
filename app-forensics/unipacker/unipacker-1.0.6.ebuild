# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )
inherit distutils-r1

DESCRIPTION="Automatic and platform-independent unpacker for Windows binaries"
HOMEPAGE="https://github.com/unipacker/unipacker"
SRC_URI="https://github.com/unipacker/unipacker/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-libs/capstone:=
	dev-python/cmd2[${PYTHON_USEDEP}]
	dev-python/colorama[${PYTHON_USEDEP}]
	dev-python/pefile[${PYTHON_USEDEP}]
	dev-python/yara-python[${PYTHON_USEDEP}]
	dev-util/unicorn:=[python,${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
