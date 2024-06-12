# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )
inherit distutils-r1

DESCRIPTION="Pure Python parser for Windows Registry hives"
HOMEPAGE="https://github.com/williballenthin/python-registry"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/williballenthin/${PN}.git"
else
	SRC_URI="https://github.com/williballenthin/python-registry/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="Apache-2.0"
SLOT="0"

PATCHES=(
	"${FILESDIR}/${PN}-no-enum-compat.patch"
)

distutils_enable_tests setup.py
