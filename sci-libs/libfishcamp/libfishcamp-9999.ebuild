# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake udev

DESCRIPTION="Firmware for the Fishcamp Engineering's Starfish CMOS autoguider"
HOMEPAGE="http://indilib.org"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/indilib/indi-3rdparty.git"
	EGIT_CHECKOUT_DIR="${WORKDIR}/${P}"
	S="${EGIT_CHECKOUT_DIR}/${PN}"
else
	SRC_URI="https://github.com/indilib/indi-3rdparty/archive/v${PV}.tar.gz -> indilib-3rdparty-${PV}.tar.gz"
	KEYWORDS="~amd64 ~x86"
	S="${WORKDIR}/indi-3rdparty-${PV}/${PN}"
fi

LICENSE="fishcamp"
SLOT="0/1"

DEPEND="
	=sci-libs/indilib-$(ver_cut 1-3)*
	virtual/udev
"
RDEPEND="
	${DEPEND}
	sys-apps/fxload
"

pkg_postinst() {
	udev_reload
}

pkg_postrm() {
	udev_reload
}
