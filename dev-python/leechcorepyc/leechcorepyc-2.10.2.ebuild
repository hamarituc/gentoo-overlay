# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..10} )

inherit distutils-r1

DESCRIPTION="Python binding for dev-libs/LeechCore"
HOMEPAGE="https://github.com/ufrisk/LeechCore"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

KEYWORDS="~amd64"
LICENSE="BSD"
SLOT="0"

RDEPEND="
	${PYTHON_DEPS}
	~dev-libs/LeechCore-$(ver_cut 1-2)
"
DEPEND="${RDEPEND}"
