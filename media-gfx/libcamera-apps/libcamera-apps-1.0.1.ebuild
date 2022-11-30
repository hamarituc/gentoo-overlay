# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="libcamera-based apps"
HOMEPAGE="https://github.com/raspberrypi/libcamera-apps"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="git@github.com:raspberrypi/libcamera-apps.git"
else
	SRC_URI="https://github.com/raspberrypi/libcamera-apps/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="BSD-2"
SLOT="0"

IUSE="drm egl ffmpeg opencv qt5 X"

DEPEND="
	dev-libs/boost:=
	media-libs/libcamera:=
	media-libs/libexif:=
	media-libs/libpng:=
	media-libs/tiff:=
	virtual/jpeg:=
	drm? ( x11-libs/libdrm:= )
	egl? ( media-libs/libepoxy:= )
	ffmpeg? ( media-video/ffmpeg:= )
	opencv? ( media-libs/opencv:= )
	qt5? (
		dev-qt/qtcore:5
		dev-qt/qtwidgets:5
	)
	X? ( x11-libs/libX11:= )
"
RDEPEND="${DEPEND}"
BDEPEND="
	virtual/pkgconfig
"

src_configure() {
	local mycmakeargs=(
		-DENABLE_DRM="$(usex drm)"
		-DENABLE_LIBAV="$(usex ffmpeg)"
		-DENABLE_OPENCV="$(usex opencv)"
		-DENABLE_QT="$(usex qt5)"
		-DENABLE_X11="$(usex X)"
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
}
