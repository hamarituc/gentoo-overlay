# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake git-r3

DESCRIPTION="INDI driver for the LimeSDR series receivers."
HOMEPAGE="http://indilib.org"
EGIT_REPO_URI="https://github.com/indilib/indi-3rdparty.git"
EGIT_CHECKOUT_DIR="${WORKDIR}/${P}"

LICENSE="LGPL-2"
KEYWORDS=""

SLOT="0/1"

DEPEND="~sci-libs/indilib-9999
	~net-wireless/limesuite-9999"

RDEPEND="${DEPEND}"

INDI_GIT_DIR="indi-${PN##*-driver-}"

S="${EGIT_CHECKOUT_DIR}/${INDI_GIT_DIR}"
