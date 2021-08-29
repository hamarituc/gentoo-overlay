# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="ARDOP Software Modem"
HOMEPAGE="https://www.cantab.net/users/john.wiseman/Documents/ARDOPC.html https://github.com/hamarituc/ardop"
EGIT_REPO_URI="https://github.com/hamarituc/ardop.git"
EGIT_COMMIT="${PV}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="media-libs/alsa-lib"
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	for i in ARDOPC ARDOP2 ARDOP3K ARDOPOFDM ARDOP1OFDM; do
		pushd "${S}/${i}"
		emake
		popd
	done
}

src_install() {
	dobin "ARDOPC/ardopc"
	dobin "ARDOP2/ardop2"
	dobin "ARDOP3K/ardop3"
	dobin "ARDOPOFDM/ardopofdm"
	dobin "ARDOP1OFDM/ardop1ofdm"
	dodoc "README"
	insinto "/usr/share/${PN}"
	doins "${FILESDIR}/asoundrc"
}
