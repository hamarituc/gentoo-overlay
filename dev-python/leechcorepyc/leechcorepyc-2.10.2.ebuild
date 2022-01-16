# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="Python binding for dev-libs/LeechCore"
HOMEPAGE="https://github.com/ufrisk/LeechCore"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

KEYWORDS="amd64 x86"
LICENSE="GPL-3"
SLOT="0"

DEPEND=""
RDEPEND="
	${DEPEND}
	${PYTHON_DEPS}
	~dev-libs/LeechCore-$(ver_cut 1-2):=
"
