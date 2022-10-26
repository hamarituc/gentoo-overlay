# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="Utilities for working with vivisect"
HOMEPAGE="https://github.com/williballenthin/viv-utils"

if [[ ${PV} = "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/williballenthin/viv-utils.git"
else
	SRC_URI="https://github.com/williballenthin/viv-utils/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="Apache-2.0"
SLOT="0"

distutils_enable_tests pytest

RDEPEND="
	>=dev-python/funcy-1.17[${PYTHON_USEDEP}]
	>=dev-python/pefile-2022.5.30[${PYTHON_USEDEP}]
	>=dev-python/vivisect-1.0.8[${PYTHON_USEDEP}]
	>=dev-python/intervaltree-3.1.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.2.0[${PYTHON_USEDEP}]
"
