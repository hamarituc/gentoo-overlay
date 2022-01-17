# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake git-r3

DESCRIPTION="SDK and firmware for the i.Nova PLx series CCD/CMOS cameras"
HOMEPAGE="http://indilib.org"
EGIT_REPO_URI="https://github.com/indilib/indi-3rdparty.git"
EGIT_CHECKOUT_DIR="${WORKDIR}/${P}"

LICENSE="inova"
KEYWORDS=""

SLOT="0/1"

RDEPEND="${DEPEND}
	virtual/libudev"

S="${EGIT_CHECKOUT_DIR}/${PN}"
