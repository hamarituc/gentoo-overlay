# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..11} )
inherit distutils-r1

DESCRIPTION="URI parsing, classification and composition"
HOMEPAGE="
	https://github.com/tkem/uritools/
	https://pypi.org/project/uritools/
"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/tkem/uritools.git"
else
	SRC_URI="https://github.com/tkem/uritools/archive/refs/tags/v${PV}.tar.gz -> ${P}.gz.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"

distutils_enable_tests pytest
