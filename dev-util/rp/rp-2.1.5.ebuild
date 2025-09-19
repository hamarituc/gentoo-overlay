# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="C++ ROP gadget finder"
HOMEPAGE="https://github.com/0vercl0k/rp"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/0vercl0k/rp.git"
else
	SRC_URI="https://github.com/0vercl0k/rp/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

S="${WORKDIR}/${P}/src"

LICENSE="MIT"
SLOT="0"

src_install() {
	dobin "${BUILD_DIR}/rp-lin"
}
