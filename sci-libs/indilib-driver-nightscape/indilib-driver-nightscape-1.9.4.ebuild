# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="INDI driver for the Celestron Nightscape 8300 line of CCDs"
HOMEPAGE="http://indilib.org"
SRC_URI="https://github.com/indilib/indi-3rdparty/archive/v${PV}.tar.gz -> indilib-3rdparty-${PV}.tar.gz"

LICENSE="LGPL-2"
KEYWORDS="~amd64 ~x86"

SLOT="0/1"

DEPEND="dev-embedded/libftdi:1
	~sci-libs/indilib-${PV}"

RDEPEND="${DEPEND}"

INDI_TARGET_DIRECTORY="indi-${PN##*-driver-}"

S="${WORKDIR}/indi-3rdparty-${PV}/${INDI_TARGET_DIRECTORY}"
