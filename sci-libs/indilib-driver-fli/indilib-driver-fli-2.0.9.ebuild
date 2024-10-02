# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="INDI driver for the Finger Lakes Instruments CCD and Focuser"
HOMEPAGE="http://indilib.org"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/indilib/indi-3rdparty.git"
	EGIT_CHECKOUT_DIR="${WORKDIR}/${P}"
	MY_S="${EGIT_CHECKOUT_DIR}"
else
	SRC_URI="https://github.com/indilib/indi-3rdparty/archive/v${PV}.tar.gz -> indilib-3rdparty-${PV}.tar.gz"
	KEYWORDS="amd64 ~x86"
	MY_S="${WORKDIR}/indi-3rdparty-${PV}"
fi

S="${MY_S}/indi-${PN##*-driver-}"

LICENSE="LGPL-2.1"
SLOT="0/1"

DEPEND="
	~sci-libs/indilib-${PV}
	~sci-libs/libfli-${PV}
"
RDEPEND="${DEPEND}"
