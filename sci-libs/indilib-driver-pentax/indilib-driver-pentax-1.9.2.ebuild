# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN="${PN%%lib-driver-**}"

inherit cmake eutils toolchain-funcs

DESCRIPTION="INDI driver for the Pentax DSLR"
HOMEPAGE="http://indilib.org"
SRC_URI="https://github.com/${MY_PN}lib/${MY_PN}-3rdparty/archive/v${PV}.tar.gz -> ${MY_PN}lib-3rdparty-${PV}.tar.gz"

LICENSE="LGPL-2.1"
KEYWORDS="~amd64 ~x86"

SLOT="0/1"

DEPEND="~sci-libs/indilib-${PV}
	~sci-libs/libpktriggercord-${PV}
	~sci-libs/libricohcamerasdk-${PV}"

RDEPEND="${DEPEND}"

INDI_TARGET_DIRECTORY="${PN%%lib-driver-**}${PN##*-driver}"

S="${WORKDIR}/${MY_PN}-3rdparty-${PV}/${INDI_TARGET_DIRECTORY}"
