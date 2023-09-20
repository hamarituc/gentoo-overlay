# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )

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
	>=dev-libs/capstone-5:=[python,${PYTHON_USEDEP}]
	dev-libs/keystone:=[python,${PYTHON_USEDEP}]
	dev-python/prompt-toolkit[${PYTHON_USEDEP}]
	dev-python/pygments[${PYTHON_USEDEP}]
	dev-python/PyQt6[${PYTHON_USEDEP}]
	dev-util/lief:=[python,${PYTHON_USEDEP}]
	dev-util/unicorn:=[python,${PYTHON_USEDEP}]
"

PATCHES=(
	"${FILESDIR}/${PN}-entrypoints.patch"
)

distutils_enable_tests pytest
