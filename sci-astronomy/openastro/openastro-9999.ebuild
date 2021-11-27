# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools git-r3

DESCRIPTION="Open Astro Project"
HOMEPAGE="https://www.openastroproject.org"
EGIT_REPO_URI="https://github.com/openastroproject/openastro"

LICENSE="GPL-3"
SLOT="0"

IUSE="asi atik gige gphoto2 toupbase qhy v4l"

DEPEND="
	app-arch/bzip2
	app-arch/lzma
	dev-embedded/libftdi
	>=dev-libs/hidapi-0.8.0
	>=dev-libs/libusb-1.0.21
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
	>=media-libs/libdc1394-2.2.4
	media-libs/libpng
	media-libs/libraw
	>=media-libs/libuvc-0.0.5
	>=media-libs/tiff-4
	media-video/ffmpeg
	sci-libs/cfitsio
	sys-libs/zlib
	virtual/jpeg
	virtual/libudev
	gphoto2? ( media-libs/libgphoto2 )
	v4l? ( media-libs/libv4l )
	gige? ( =media-video/aravis-0.6* )
	asi? ( sci-libs/libasi )
	atik? ( sci-libs/libatik )
	toupbase?
	(
		sci-libs/libtoupcam
		sci-libs/libaltaircam
		sci-libs/libstarshootg
		sci-libs/libnncam
		sci-libs/libmallincam
	)
	qhy? ( sci-libs/libqhy )
"
RDEPEND="${DEPEND}"
BDEPEND=""


src_prepare()
{
	default
	eautoreconf
}


src_configure()
{
	econf
}
