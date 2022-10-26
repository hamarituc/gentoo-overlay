# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="Parse .NET executable files"
HOMEPAGE="https://github.com/malwarefrank/dnfile"

if [[ ${PV} = "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="git@github.com:malwarefrank/dnfile.git"
else
	COMMIT_TESTFILES="d2da9190e74f82caa70a8bcd844c929182a8dc8e"
	SRC_URI="
		https://github.com/malwarefrank/dnfile/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
		test? ( https://github.com/malwarefrank/dnfile-testfiles/archive/${COMMIT_TESTFILES}.tar.gz -> ${PN}-testfiles-${COMMIT_TESTFILES}.tar.gz )
	"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE="test"

RDEPEND="
	>=dev-python/pefile-2019.4.18[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

src_prepare() {
	default

	if use test; then
		rm -r ${WORKDIR}/${P}/tests/data || die
		mv ${WORKDIR}/dnfile-testfiles-${COMMIT_TESTFILES} ${WORKDIR}/${P}/tests/data || die
	fi
}
