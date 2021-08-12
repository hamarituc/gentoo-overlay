# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN="sbig"

inherit cmake git-r3

DESCRIPTION="Driver for the Santa Barbara Instruments Group line of CCDs & Filter Wheels"
HOMEPAGE="http://indilib.org"
EGIT_REPO_URI="https://github.com/indilib/indi-3rdparty.git"
EGIT_CHECKOUT_DIR="${WORKDIR}/${P}"

LICENSE="sbig"
KEYWORDS=""

SLOT="0/1"

RDEPEND="${DEPEND}
	sys-apps/fxload"

S="${EGIT_CHECKOUT_DIR}/${PN}"
