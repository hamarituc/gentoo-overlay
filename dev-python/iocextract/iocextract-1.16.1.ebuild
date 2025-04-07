# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1

DESCRIPTION="Defanged Indicator of Compromise (IOC) Extractor"
HOMEPAGE="
	https://github.com/InQuest/iocextract
	https://pypi.org/project/iocextract/
"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/InQuest/iocextract.git"
else
	SRC_URI="https://github.com/InQuest/iocextract/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-2+"
SLOT="0"

RDEPEND="
	>=dev-python/regex-2020.6.8[${PYTHON_USEDEP}]
"

PATCHES=(
	"${FILESDIR}/${PN}-test.patch"
)

distutils_enable_tests unittest
distutils_enable_sphinx docs
