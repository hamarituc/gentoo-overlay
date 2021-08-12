# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN="${PN/lib/}"

inherit cmake udev user

DESCRIPTION="INDI Astronomical Control Protocol library"
HOMEPAGE="http://www.indilib.org/"
SRC_URI="https://github.com/${PN}/${MY_PN}/archive/v${PV}.tar.gz -> ${PN}-${PV}.tar.gz"

LICENSE="BSD GPL-2+ LGPL-2+ LGPL-2.1+"
SLOT="0/1"
KEYWORDS="~amd64 ~x86"
IUSE="ogg test drivers qt5 websocket"

RDEPEND="
	sci-libs/cfitsio:=
	sci-libs/fftw:3.0=
	sci-libs/libnova:=
	sci-libs/gsl:=
	sys-libs/zlib
	virtual/jpeg:0
	virtual/libusb:0
	net-misc/curl
	qt5? ( dev-qt/qtnetwork:5 )
	ogg? (
		media-libs/libogg
		media-libs/libtheora
	)
	websocket? ( dev-libs/boost:= )
"
DEPEND="${RDEPEND}
	kernel_linux? ( sys-kernel/linux-headers )
	drivers? ( sci-libs/indilib-drivers )
	test? (	>=dev-cpp/gtest-1.8.0 )
	websocket? ( dev-cpp/websocketpp )
"

RESTRICT="!test? ( test )"

DOCS=( AUTHORS ChangeLog README )

S=${WORKDIR}/${MY_PN}-${PV}

src_configure() {
	local mycmakeargs=(
		-DUDEVRULES_INSTALL_DIR=$(get_udevdir)/rules.d
		-DINDI_BUILD_UNITTESTS=$(usex test)
		-DINDI_BUILD_QT5_CLIENT=$(usex qt5)
		$(cmake_use_find_package ogg OggTheora)
		-DINDI_BUILD_WEBSOCKET=$(usex websocket)
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	newinitd "${FILESDIR}/indiserver.sh" indiserver
	newconfd "${FILESDIR}/indiserver.conf" indiserver
}

src_test() {
	BUILD_DIR="${BUILD_DIR}"/test cmake_src_test
}

pkg_postinst() {
	enewgroup indiserver
	enewuser indiserver -1 -1 -1 "usb,uucp,video,indiserver"
	elog "You can use init script in /etc/init.d/indiserver to start"
	elog "indiserver automatically."
	elog "Configuration is in /etc/conf.d/indiserver."
}
