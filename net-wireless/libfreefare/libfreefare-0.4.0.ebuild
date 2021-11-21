# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit autotools

DESCRIPTION="a library for high level manipulation of MIFARE tags"
HOMEPAGE="https://github.com/nfc-tools/libfreefare"

if [[ ${PV} == "9999" ]] ; then
    EGIT_REPO_URI="https://github.com/nfc-tools/libfreefare.git"
    KEYWORDS=""
    inherit git-r3
else
	SRC_URI="https://github.com/nfc-tools/libfreefare/archive/${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND="dev-libs/libnfc
		dev-libs/openssl:=
		virtual/libusb:0"

RDEPEND="${DEPEND}"

S="${WORKDIR}"/"${PN}-${P}"

src_prepare() {
	eapply_user
	eautoreconf
}
