# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake git-r3 eutils

DESCRIPTION="INDI driver for the Adafruit Motor HAT addon board to Raspberry Pi"
HOMEPAGE="https://github.com/rkaczorek/astroberry-amh"
EGIT_REPO_URI="https://github.com/Ctibor/astroberry-amh"
EGIT_CHECKOUT_DIR="${WORKDIR}/${P}"

LICENSE="GPL-3"
KEYWORDS="-amd64 -x86"

SLOT="0/1"

DEPEND="~sci-libs/indilib-9999
	dev-libs/wiringPi" #WiringPi is available in hacking-gentoo overlay

RDEPEND="${DEPEND}"

#INDI_GIT_DIR="${PN%%lib-driver-*}${PN##*-driver}"

#S="${EGIT_CHECKOUT_DIR}/${INDI_GIT_DIR}"
