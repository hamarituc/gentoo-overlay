# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake git-r3 eutils

DESCRIPTION="SDK and firmware for the QHY CCD cameras"
HOMEPAGE="http://indilib.org"
EGIT_REPO_URI="https://github.com/indilib/indi-3rdparty.git"
EGIT_CHECKOUT_DIR="${WORKDIR}/${P}"

LICENSE="qhyccd"
KEYWORDS=""

SLOT="0/1"

DEPEND=""

RDEPEND="${DEPEND}
	sys-apps/fxload"

S="${EGIT_CHECKOUT_DIR}/${PN}"
