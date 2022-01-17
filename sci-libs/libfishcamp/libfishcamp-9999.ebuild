# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake git-r3

DESCRIPTION="Firmware for the Fishcamp Engineering's Starfish CMOS autoguider"
HOMEPAGE="http://indilib.org"
EGIT_REPO_URI="https://github.com/indilib/indi-3rdparty.git"
EGIT_CHECKOUT_DIR="${WORKDIR}/${P}"

LICENSE="fishcamp"
KEYWORDS=""

RDEPEND="${DEPEND}
	sys-apps/fxload
	~sci-libs/indilib-9999"

SLOT="0/1"

S="${EGIT_CHECKOUT_DIR}/${PN}"
