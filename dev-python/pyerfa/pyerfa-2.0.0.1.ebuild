# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..9} )

inherit distutils-r1 git-r3

DESCRIPTION="Astronomical Computation Library"
HOMEPAGE="https://github.com/liberfa/pyerfa"
EGIT_REPO_URI="https://github.com/liberfa/pyerfa.git"
EGIT_COMMIT="v${PV}"
EGIT_OVERRIDE_COMMIT_LIBERFA_PYERFA="v${PV}"
EGIT_SUBMODULES=( liberfa/erfa )
EGIT_OVERRIDE_COMMIT_LIBERFA_ERFA="v$(ver_cut 1-3)"

KEYWORDS="amd64 x86"
LICENSE="BSD"
SLOT="0"
IUSE=""

RDEPEND="${PYTHON_DEPS}
	dev-python/numpy[${PYTHON_USEDEP}]
	=sci-astronomy/erfa-$(ver_cut 1-3)*"


python_compile()
{
	export PYERFA_USE_SYSTEM_LIBERFA=1
	distutils-r1_python_compile
}
