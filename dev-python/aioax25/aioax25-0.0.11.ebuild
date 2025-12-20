# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1

DESCRIPTION="Asynchronous AX.25 library using asyncio"
HOMEPAGE="https://github.com/sjlongland/aioax25"

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/sjlongland/aioax25.git"
	inherit git-r3
else
	SRC_URI="https://github.com/sjlongland/aioax25/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
	KEYWORDS="amd64"
fi

LICENSE="GPL-2+"
SLOT="0"

RDEPEND="
	dev-python/pyserial[${PYTHON_USEDEP}]
	dev-python/pyserial-asyncio[${PYTHON_USEDEP}]
	dev-python/signalslot[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
