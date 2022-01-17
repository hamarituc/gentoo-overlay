# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="INDI driver for controlling power distribution from a Raspberry Pi usinng the GPIO pins."
HOMEPAGE="http://indilib.org"
SRC_URI="https://github.com/indilib/indi-3rdparty/archive/v${PV}.tar.gz -> indilib-3rdparty-${PV}.tar.gz"

LICENSE="GPL-3"
KEYWORDS="~arm"

SLOT="0/1"

DEPEND="dev-libs/pigpio
	~sci-libs/indilib-${PV}"

RDEPEND="${DEPEND}"

INDI_TARGET_DIRECTORY="indi-${PN##*-driver-}"

S="${WORKDIR}/indi-3rdparty-${PV}/${INDI_TARGET_DIRECTORY}"
