# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools udev

DESCRIPTION="Open Astro Project"
HOMEPAGE="https://www.openastroproject.org"

if [[ ${PV} = "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/openastroproject/openastro"
else
	SRC_URI="https://github.com/openastroproject/openastro/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="GPL-3"
SLOT="0"

IUSE_INDILIB_DRIVERS="asi atik gige qhy toupbase"
use_indilib_drivers=$(printf ' indilib_drivers_%s' ${IUSE_INDILIB_DRIVERS})
IUSE="gphoto2 v4l ${use_indilib_drivers}"

DEPEND="
	app-arch/bzip2
	app-arch/lzma
	dev-embedded/libftdi:=
	>=dev-libs/hidapi-0.8.0:=
	>=dev-libs/libusb-1.0.21:=
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtwidgets:5
	>=media-libs/libdc1394-2.2.4:=
	media-libs/libpng:=
	media-libs/libraw:=
	>=media-libs/libuvc-0.0.5:=
	>=media-libs/tiff-4:=
	media-video/ffmpeg:=
	sci-libs/cfitsio:=
	sys-libs/zlib:=
	media-libs/libjpeg-turbo:=
	virtual/libudev:=
	gphoto2? ( media-libs/libgphoto2:= )
	indilib_drivers_asi? ( sci-libs/libasi:= )
	indilib_drivers_atik? ( sci-libs/libatik:= )
	indilib_drivers_gige? ( =media-video/aravis-0.6*:= )
	indilib_drivers_qhy? ( sci-libs/libqhy:= )
	indilib_drivers_toupbase?
	(
		sci-libs/libtoupcam:=
		sci-libs/libaltaircam:=
		sci-libs/libstarshootg:=
		sci-libs/libnncam:=
		sci-libs/libmallincam:=
	)
	v4l? ( media-libs/libv4l:= )
"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	eautoreconf
}

pkg_postinst() {
	udev_reload
}

pkg_postrm() {
	udev_reload
}
