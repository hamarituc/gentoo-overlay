# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN="indi"

inherit cmake eutils

DESCRIPTION="Udev rules and firmware for ZWO Optics ASI cameras."
HOMEPAGE="http://indilib.org"
SRC_URI="https://github.com/${MY_PN}lib/${MY_PN}-3rdparty/archive/v${PV}.tar.gz -> ${MY_PN}lib-3rdparty-${PV}.tar.gz"

LICENSE="zwo-asi"
KEYWORDS="~amd64 ~x86"

SLOT="0/1"

RDEPEND="${DEPEND}
	sys-apps/fxload
	virtual/libudev"

S="${WORKDIR}/${MY_PN}-3rdparty-${PV}/${PN}"
