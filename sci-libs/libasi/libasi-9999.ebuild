# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake git-r3 eutils

DESCRIPTION="Udev rules and firmware for ZWO Optics ASI cameras."
HOMEPAGE="http://indilib.org"
EGIT_REPO_URI="https://github.com/indilib/indi-3rdparty.git"
EGIT_CHECKOUT_DIR="${WORKDIR}/${P}"

LICENSE="zwo-asi"
KEYWORDS=""

SLOT="0/1"

RDEPEND="${DEPEND}
	sys-apps/fxload
	virtual/libudev"

S="${EGIT_CHECKOUT_DIR}/${PN}"
