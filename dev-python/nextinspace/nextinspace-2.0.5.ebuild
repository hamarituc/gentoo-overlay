# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{9..11} )
inherit distutils-r1

DESCRIPTION="A command-line tool for seeing the latest in space"
HOMEPAGE="https://github.com/gideonshaked/nextinspace"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/gideonshaked/${PN}"
else
	SRC_URI="https://github.com/gideonshaked/nextinspace/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3+"
SLOT="0"

RDEPEND="
	>=dev-python/colorama-0.4.3
	>=dev-python/requests-2.24
"
BDEPEND="
	test? (
		${RDEPEND}
		>=dev-python/pytest-lazy-fixture-0.6.3
		>=dev-python/requests-mock-1.8
	)
"

distutils_enable_tests pytest
