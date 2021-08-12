# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake git-r3 eutils

DESCRIPTION="Firmware for the Fishcamp Engineering's Starfish CMOS autoguider"
HOMEPAGE="http://indilib.org"
EGIT_REPO_URI="https://github.com/indilib/indi-3rdparty.git"
EGIT_CHECKOUT_DIR="${WORKDIR}/${P}"

LICENSE="fishcamp"
KEYWORDS=""

RDEPEND="${DEPEND}
	sys-apps/fxload"

SLOT="0/1"

S="${EGIT_CHECKOUT_DIR}/${PN}"
