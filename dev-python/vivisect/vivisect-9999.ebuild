# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="A combined disassembler/static analysis/symbolic execution/debugger framework."
HOMEPAGE="https://github.com/vivisect/vivisect"

if [[ ${PV} = "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/vivisect/vivisect.git"
else
	SRC_URI="https://github.com/vivisect/vivisect/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="Apache-2.0"
SLOT="0"

distutils_enable_tests pytest

# TODO: cxxfilt
# TODO: pyqtwebengine
RDEPEND="
	>=dev-python/pyasn-0.4.5[${PYTHON_USEDEP}]
	>=dev-python/pyasn-modules-0.2.4[${PYTHON_USEDEP}]
	>=dev-python/msgpack-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/pycparser-2.20[${PYTHON_USEDEP}]
	>=dev-python/PyQt5-5.15.7[${PYTHON_USEDEP}]
"
