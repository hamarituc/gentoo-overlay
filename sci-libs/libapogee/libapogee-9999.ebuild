# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake git-r3 eutils

DESCRIPTION="Driver for the Apogee ALTA device drivers"
HOMEPAGE="http://indilib.org"
EGIT_REPO_URI="https://github.com/indilib/indi-3rdparty.git"
EGIT_CHECKOUT_DIR="${WORKDIR}/${P}"

LICENSE="GPL-2"
KEYWORDS=""

SLOT="0/1"

DEPEND="virtual/libusb:1
	net-misc/curl"

RDEPEND="${DEPEND}
	sys-apps/fxload"

S="${EGIT_CHECKOUT_DIR}/${PN}"
