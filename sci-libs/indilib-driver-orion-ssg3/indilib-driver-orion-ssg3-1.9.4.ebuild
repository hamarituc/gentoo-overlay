# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="the INDI driver for the Orion StarShoot G3 and G4 cameras"
HOMEPAGE="http://indilib.org"
SRC_URI="https://github.com/indilib/indi-3rdparty/archive/v${PV}.tar.gz -> indilib-3rdparty-${PV}.tar.gz"

LICENSE="GPL-3"
KEYWORDS="~amd64 ~x86"

SLOT="0/1"

DEPEND="sci-libs/cfitsio
	~sci-libs/indilib-${PV}
	sys-libs/zlib
	virtual/libusb:1"

RDEPEND="${DEPEND}"

INDI_TARGET_DIRECTORY="indi-${PN##*-driver-}"

S="${WORKDIR}/indi-3rdparty-${PV}/${INDI_TARGET_DIRECTORY}"
