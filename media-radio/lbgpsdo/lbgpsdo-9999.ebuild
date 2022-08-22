# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )
inherit python-single-r1

DESCRIPTION="Configuration Utility for Leo Bodnar GPSDO"
HOMEPAGE="https://github.com/hamarituc/lbgpsdo"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/hamarituc/${PN}"
else
	SRC_URI="https://github.com/hamarituc/lbgpsdo/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3+"
SLOT="0"
IUSE="examples"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
	$(python_gen_cond_dep '
		dev-python/pyhidapi[${PYTHON_USEDEP}]
	')
"
BDEPEND="${RDEPEND}"

RESTRICT="test"

DOCS=( README.md )

src_install() {
	default
	newbin lbgpsdo.py lbgpsdo

	if use examples; then
		insinto /usr/share/${PN}
		doins -r examples
	fi
}
