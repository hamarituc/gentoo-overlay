# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="SDK and firmware for the i.Nova PLx series CCD/CMOS cameras"
HOMEPAGE="http://indilib.org"
SRC_URI="https://github.com/indilib/indi-3rdparty/archive/v${PV}.tar.gz -> indilib-3rdparty-${PV}.tar.gz"

LICENSE="inova"
KEYWORDS="~amd64 ~arm ~x86"

SLOT="0/1"

RDEPEND="${DEPEND}
	virtual/libudev"

S="${WORKDIR}/indi-3rdparty-${PV}/${PN}"
