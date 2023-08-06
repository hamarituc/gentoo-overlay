# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..11} )

inherit distutils-r1 xdg-utils

DESCRIPTION="Free open-source tool for programming your amateur radio"
HOMEPAGE="http://chirp.danplanet.com"

if [[ ${PV} == "99999999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/kk7ds/chirp.git"
else
	SRC_URI="https://github.com/kk7ds/chirp/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3"
SLOT="0"

DEPEND="
	dev-python/pyserial[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	dev-python/suds-community[${PYTHON_USEDEP}]
	dev-python/wxpython:4.0[${PYTHON_USEDEP}]
	dev-python/yattag[${PYTHON_USEDEP}]
"

pkg_postinst() {
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
}

distutils_enable_tests pytest
