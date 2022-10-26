# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="Beautiful spinners for terminal, IPython and Jupyter"
HOMEPAGE="https://github.com/manrajgrover/halo"

if [[ ${PV} = "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/manrajgrover/halo.git"
else
	COMMIT="c5f6ef233d5a3ef6c3db9f44aef03a789cb4a6ce"
	SRC_URI="https://github.com/manrajgrover/halo/archive/${COMMIT}.tar.gz -> ${P}.gh.tar.gz"
	S="${WORKDIR}/${PN}-${COMMIT}"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"

distutils_enable_tests pytest

RDEPEND="
	>=dev-python/colorama-0.3.9[${PYTHON_USEDEP}]
	>=dev-python/six-1.12.0[${PYTHON_USEDEP}]
	>=dev-python/py-log-symbols-0.0.14[${PYTHON_USEDEP}]
	>=dev-python/py-spinners-0.0.24[${PYTHON_USEDEP}]
	>=dev-python/termcolor-1.1.0[${PYTHON_USEDEP}]
"

RESTRICT="test"
