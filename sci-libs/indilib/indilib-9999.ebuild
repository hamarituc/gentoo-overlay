# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake flag-o-matic udev

DESCRIPTION="INDI Astronomical Control Protocol library"
HOMEPAGE="https://www.indilib.org/"

if [[ ${PV} == "9999" ]]; then
	EGIT_REPO_URI="https://github.com/indilib/indi.git"
	inherit git-r3
else
	SRC_URI="https://github.com/indilib/indi/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
	S="${WORKDIR}/indi-${PV}"
fi

LICENSE="BSD GPL-2+ LGPL-2+ LGPL-2.1+"
SLOT="0/1"
IUSE="ogg qt5 rtlsdr static-libs test"

RESTRICT="!test? ( test )"

RDEPEND="
	acct-group/indiserver
	acct-user/indiserver
	dev-cpp/cpp-httplib:=
	dev-cpp/nlohmann_json:=
	dev-libs/libev:=
	media-libs/libjpeg-turbo:=
	net-misc/curl
	sci-libs/cfitsio:=
	sci-libs/fftw:3.0=
	sci-libs/gsl:=
	sci-libs/libnova:=
	sys-libs/zlib:=
	virtual/libusb:1
	virtual/udev
	ogg? (
		media-libs/libogg
		media-libs/libtheora
	)
	qt5? (
		dev-qt/qtcore:5
		dev-qt/qtnetwork:5
	)
	rtlsdr? ( net-wireless/rtl-sdr )
"
DEPEND="
	${RDEPEND}
	kernel_linux? ( sys-kernel/linux-headers )
	test? ( >=dev-cpp/gtest-1.8.0 )
"

DOCS=( AUTHORS ChangeLog README )

src_configure() {
	# -Werror=odr
	# https://bugs.gentoo.org/878525
	# https://github.com/indilib/indi/issues/2023
	filter-lto

	local mycmakeargs=(
		-DINDI_SYSTEM_HTTPLIB=ON
		-DINDI_SYSTEM_JSONLIB=ON
		-DINDI_BUILD_QT5_CLIENT=$(usex qt5)
		-DINDI_BUILD_SHARED=ON
		-DINDI_BUILD_STATIC=$(usex static-libs)
		-DINDI_BUILD_XISF=OFF # not packaged
		-DUDEVRULES_INSTALL_DIR="${EPREFIX}$(get_udevdir)"/rules.d
		$(cmake_use_find_package ogg OggTheora)
		$(cmake_use_find_package rtlsdr RTLSDR)
		-DINDI_BUILD_UNITTESTS=$(usex test)
		-DINDI_BUILD_INTEGTESTS=$(usex test)
	)

	cmake_src_configure
}

src_install() {
	cmake_src_install
	newinitd "${FILESDIR}/indiserver.sh" indiserver
	newconfd "${FILESDIR}/indiserver.conf" indiserver
}

src_test() {
	# Unit tests
	BUILD_DIR="${BUILD_DIR}"/test cmake_src_test

	# Integration tests
	# They fail in parallel because they try to bind to the same port more
	# than once.
	BUILD_DIR="${BUILD_DIR}"/integs cmake_src_test -j1
}

pkg_postinst() {
	udev_reload

	elog "You can use init script in /etc/init.d/indiserver to start"
	elog "indiserver automatically."
	elog "Configuration is in /etc/conf.d/indiserver."
}

pkg_postrm() {
	udev_reload
}
