# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit qmake-utils

DESCRIPTION="A tool that supports reconstructing useful images out of RDP cache bitmaps."
HOMEPAGE="https://github.com/BSI-Bund/RdpCacheStitcher"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/BSI-Bund/RdpCacheStitcher.git"
else
	SRC_URI="https://github.com/BSI-Bund/RdpCacheStitcher/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3+ LGPL-3+"
IUSE="doc"
SLOT="0"

DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
"
RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}/${P}-includes.patch"
	"${FILESDIR}/${P}-deprecations.patch"
)

src_configure() {
	eqmake5 src/RdpCacheStitcher.pro
}

src_install() {
	default

	dobin RdpCacheStitcher

	if use doc; then
		dodoc RdpCacheStitcher_manual.pdf
	fi
}
