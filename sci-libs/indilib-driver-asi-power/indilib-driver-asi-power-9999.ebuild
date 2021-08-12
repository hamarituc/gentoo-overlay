# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake git-r3 eutils

DESCRIPTION="INDI driver for controlling power distribution from a Raspberry Pi usinng the GPIO pins."
HOMEPAGE="http://indilib.org"
EGIT_REPO_URI="https://github.com/indilib/indi-3rdparty.git"
EGIT_CHECKOUT_DIR="${WORKDIR}/${P}"

LICENSE="GPL-3"
KEYWORDS=""

SLOT="0/1"

DEPEND="dev-libs/pigpio
	~sci-libs/indilib-9999"

RDEPEND="${DEPEND}"

INDI_GIT_DIR="${PN%%lib-driver-*}${PN##*-driver}"

S="${EGIT_CHECKOUT_DIR}/${INDI_GIT_DIR}"
