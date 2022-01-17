# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Driver for the Quantum Scientific Imaging CCDs & Filter Wheels"
HOMEPAGE="http://indilib.org"
SRC_URI="https://github.com/indilib/indi-3rdparty/archive/v${PV}.tar.gz -> indilib-3rdparty-${PV}.tar.gz"

LICENSE="qsi"
KEYWORDS="~amd64 ~arm ~x86"

SLOT="0/1"

DEPEND="dev-embedded/libftdi:1
	~sci-libs/indilib-${PV}"

RDEPEND="${DEPEND}"

S="${WORKDIR}/indi-3rdparty-${PV}/${PN}"
