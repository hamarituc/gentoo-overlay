# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
DISTUTILS_EXT=1
PYTHON_COMPAT=( python3_{10..14} )

inherit distutils-r1

DESCRIPTION="Astronomical Computation Library"
HOMEPAGE="
	https://github.com/liberfa/pyerfa
	https://pypi.org/project/pyerfa/
"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/liberfa/pyerfa.git"
else
	inherit pypi
	KEYWORDS="amd64 x86"
fi

LICENSE="BSD"
SLOT="0"

RDEPEND="
	>=dev-python/numpy-2[${PYTHON_USEDEP}]
	=sci-astronomy/erfa-$(ver_cut 1-3)*
"

RESTRICT="test"

python_compile()
{
	export PYERFA_USE_SYSTEM_LIBERFA=1
	distutils-r1_python_compile
}
