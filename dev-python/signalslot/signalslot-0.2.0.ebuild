# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1 pypi

DESCRIPTION="Simple signal slot implementation in Python"
HOMEPAGE="
	https://github.com/Numergy/signalslot
	https://pypi.org/project/signalslot/
"

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/Numergy/signalslot.git"
	inherit git-r3
else
	KEYWORDS="amd64"
fi

LICENSE="MIT"
SLOT="0"

BDEPEND="
	test? (
		dev-python/mock[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

# missing dependency eventlet
RESTRICT="test"

src_prepare() {
	default

	sed -i -e "/addopts = --pep8 --cov signalslot --cov-report html --doctest-modules/d" "${S}/setup.cfg"
}
