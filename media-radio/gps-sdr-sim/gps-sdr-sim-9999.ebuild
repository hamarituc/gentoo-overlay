# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="GPS baseband signal generator"
HOMEPAGE="https://github.com/osqzss/gps-sdr-sim"

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/osqzss/gps-sdr-sim.git"
	inherit git-r3
else
	SRC_URI="https://github.com/osqzss/gps-sdr-sim/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE="bladerf uhd"

src_install() {
	dobin gps-sdr-sim
	use uhd && dobin gps-sdr-sim-uhd.py

	dodoc README.md

	insinto /usr/share/${PN}
	doins {brdc3540.14n,*.csv,triumphv3.txt}
	use bladerf && doins bladerf.script
}
