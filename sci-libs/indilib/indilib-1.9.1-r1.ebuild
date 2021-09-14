# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake udev

DESCRIPTION="INDI Astronomical Control Protocol library"
HOMEPAGE="https://www.indilib.org/"
SRC_URI="https://github.com/${PN}/${PN/lib/}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${P/lib/}"

LICENSE="BSD GPL-2+ LGPL-2+ LGPL-2.1+"
SLOT="0/1"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE="drivers ogg qt5 rtlsdr test websocket"

RDEPEND="
	acct-group/indiserver
	acct-user/indiserver
	net-misc/curl
	sci-libs/cfitsio:=
	sci-libs/fftw:3.0=
	sci-libs/gsl:=
	sci-libs/libnova:=
	sys-libs/zlib
	virtual/jpeg:0
	virtual/libusb:0
	ogg? (
		media-libs/libogg
		media-libs/libtheora
	)
	qt5? ( dev-qt/qtnetwork:5 )
	rtlsdr? ( net-wireless/rtl-sdr )
	websocket? ( dev-libs/boost:= )
"
DEPEND="${RDEPEND}
	kernel_linux? ( sys-kernel/linux-headers )
	test? ( >=dev-cpp/gtest-1.8.0 )
	websocket? ( dev-cpp/websocketpp )
"
PDEPEND="
	drivers? ( sci-libs/indilib-drivers )
"

PATCHES=(
	"${FILESDIR}/${P}-fix-include.patch"
)

DOCS=( AUTHORS ChangeLog README )

src_configure() {
	local mycmakeargs=(
		-DINDI_BUILD_QT5_CLIENT=$(usex qt5)
		-DUDEVRULES_INSTALL_DIR="${EPREFIX}$(get_udevdir)"/rules.d
		$(cmake_use_find_package ogg OggTheora)
		$(cmake_use_find_package rtlsdr RTLSDR)
		-DINDI_BUILD_UNITTESTS=$(usex test)
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
	elog "You can use init script in /etc/init.d/indiserver to start"
	elog "indiserver automatically."
	elog "Configuration is in /etc/conf.d/indiserver."
}
