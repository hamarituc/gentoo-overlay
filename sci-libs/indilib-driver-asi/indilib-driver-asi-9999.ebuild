# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake git-r3 eutils

MY_PN="asicam"

DESCRIPTION="INDI driver for the ZWO Optics ASI cameras"
HOMEPAGE="http://indilib.org"
EGIT_REPO_URI="https://github.com/indilib/indi-3rdparty.git"
EGIT_CHECKOUT_DIR="${WORKDIR}/${P}"

LICENSE="LGPL-2.1"
KEYWORDS=""

SLOT="0/1"

DEPEND="~sci-libs/indilib-9999
	~sci-libs/libasi-9999
	virtual/libudev"

RDEPEND="${DEPEND}"

INDI_GIT_DIR="${PN%%lib-driver-*}${PN##*-driver}"

S="${EGIT_CHECKOUT_DIR}/${INDI_GIT_DIR}"
