# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake udev

DESCRIPTION="INDI driver for the gphoto2 compatible cameras"
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

LICENSE="LGPL-2"
SLOT="0/1"

DEPEND="
	dev-libs/npth:=
	media-libs/libgphoto2:=[jpeg]
	media-libs/libjpeg-turbo:=
	media-libs/libraw:=
	media-libs/tiff:=[cxx]
	sci-libs/cfitsio:0=
	~sci-libs/indilib-${PV}
	virtual/libusb:1
	virtual/udev
"
RDEPEND="${DEPEND}"

pkg_postinst() {
	udev_reload
}

pkg_postrm() {
	udev_reload
}
