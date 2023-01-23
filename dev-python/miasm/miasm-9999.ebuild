# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..10} )
DISTUTILS_USE_SETUPTOOLS=no

inherit distutils-r1

DESCRIPTION="Reverse engineering framework in Python"
HOMEPAGE="https://miasm.re/"

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/cea-sec/miasm.git"
	inherit git-r3
else
	SRC_URI="https://github.com/cea-sec/miasm/archive/refs/tags/v${PV}/${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE=""
RESTRICT="test"

DEPEND=""
RDEPEND="${PYTHON_DEPS}"
