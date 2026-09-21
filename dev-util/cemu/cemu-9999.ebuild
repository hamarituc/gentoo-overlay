# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="Cheap EMUlator: lightweight multi-architecture assembly playground"
HOMEPAGE="https://github.com/hugsy/cemu"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/hugsy/${PN}.git"
else
	SRC_URI="https://github.com/hugsy/cemu/archive/refs/tags/${PV}.tar.gz -> ${P}.gz.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"

RDEPEND="
	>=dev-libs/capstone-5.0.1:=[python,${PYTHON_USEDEP}]
	>=dev-libs/keystone-0.9.2:=[python,${PYTHON_USEDEP}]
	>=dev-python/prompt-toolkit-3.0.47[${PYTHON_USEDEP}]
	>=dev-python/pygments-2.18.0[${PYTHON_USEDEP}]
	>=dev-python/pyqt6-6.7.1[${PYTHON_USEDEP}]
	>=dev-util/lief-0.15.1:=[python,${PYTHON_USEDEP}]
	>=dev-util/unicorn-2.0.1:=[python,${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
