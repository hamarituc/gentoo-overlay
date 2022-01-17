# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Driver for the Player One Astronomy's Camera Driver"
HOMEPAGE="http://indilib.org"
SRC_URI="https://github.com/indilib/indi-3rdparty/archive/v${PV}.tar.gz -> indilib-3rdparty-${PV}.tar.gz"

LICENSE="playerone"
KEYWORDS="~amd64 ~arm ~x86"

SLOT="0/1"

DEPEND="~sci-libs/indilib-${PV}
	virtual/libudev
	virtual/libusb:1"

RDEPEND="${DEPEND}"

S="${WORKDIR}/indi-3rdparty-${PV}/${PN}"
