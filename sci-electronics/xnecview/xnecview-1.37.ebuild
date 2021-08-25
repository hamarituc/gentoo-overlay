# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION=""
HOMEPAGE="https://www.pa3fwm.nl/software/xnecview/"
SRC_URI="https://www.pa3fwm.nl/software/xnecview/xnecview-${PV}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	>=media-libs/libpng-1.6
	x11-libs/gtk+
"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

src_install() {
	dobin xnecview
	doman xnecview.1x
	dodoc README
	dodoc HISTORY
}
