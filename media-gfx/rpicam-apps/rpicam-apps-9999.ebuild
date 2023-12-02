# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="libcamera-based applications to drive the cameras on a Raspberry Pi platform"
HOMEPAGE="https://github.com/raspberrypi/rpicam-apps"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/raspberrypi/rpicam-apps.git"
else
	SRC_URI="https://github.com/raspberrypi/rpicam-apps/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="BSD-2"
SLOT="0"

IUSE="drm egl ffmpeg opencv qt5"

DEPEND="
	dev-libs/boost:=
	media-libs/libcamera:=
	media-libs/libexif:=
	media-libs/libjpeg-turbo:=
	media-libs/libpng:=
	media-libs/tiff:=
	drm? ( x11-libs/libdrm:= )
	egl? ( media-libs/libepoxy:= )
	ffmpeg? ( media-video/ffmpeg:= )
	opencv? ( media-libs/opencv:= )
	qt5? (
		dev-qt/qtcore:5
		dev-qt/qtwidgets:5
	)
"
RDEPEND="${DEPEND}"
BDEPEND="
	virtual/pkgconfig
"

src_configure() {
	local emesonargs=(
		$(meson_feature drm)
		$(meson_feature ffmpeg libav)
		$(meson_feature opencv)
		$(meson_feature qt5 qt)
	)
	meson_src_configure
}
