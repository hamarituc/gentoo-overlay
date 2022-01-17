# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="INDILIB driver for Bresser Exos II GoTo Telescope Mount"
HOMEPAGE="http://indilib.org"
SRC_URI="https://github.com/indilib/indi-3rdparty/archive/v${PV}.tar.gz -> indilib-3rdparty-${PV}.tar.gz"

LICENSE="LGPL-2.1"
KEYWORDS="~amd64 ~x86"

SLOT="0/1"

DEPEND="~sci-libs/indilib-${PV}"

RDEPEND="${DEPEND}"

INDI_TARGET_DIRECTORY="indi-${PN##*-driver-}"

S="${WORKDIR}/indi-3rdparty-${PV}/${INDI_TARGET_DIRECTORY}"
