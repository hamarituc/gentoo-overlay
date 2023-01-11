# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )
inherit distutils-r1

DESCRIPTION="Better multiprocessing and multithreading in Python"
HOMEPAGE="https://github.com/uqfoundation/multiprocess"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/uqfoundation/${PN}.git"
else
	SRC_URI="https://github.com/uqfoundation/multiprocess/releases/download/${P}/${P}.tar.gz -> ${P}.gh.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="BSD"
SLOT="0"

RDEPEND="
	${PYTHON_DEPS}
	>=dev-python/dill-0.3.5.1[${PYTHON_USEDEP}]
"

distutils_enable_tests setup.py
