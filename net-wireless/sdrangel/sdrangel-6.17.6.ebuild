# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="SDR Rx/Tx software"
HOMEPAGE="https://github.com/f4exb/sdrangel"
SRC_URI=""

if [[ ${PV} =~ "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/f4exb/sdrangel.git"
else
	SRC_URI="https://github.com/f4exb/sdrangel/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE="airspy bladerf cpu_flags_x86_ssse3 cpu_flags_x86_sse4_1 faad fcd -debug -doc hackrf limesuite plutosdr +qt5 rtlsdr server sgp4 soapy uhd"

# TODO: perseus, xtrx, mirisdr

RDEPEND="
	dev-libs/boost
	dev-libs/cm256cc
	dev-libs/serialDV
	>=dev-qt/qtcore-5.6.0
	>=dev-qt/qtwidgets-5.6.0
	>=dev-qt/qtwebsockets-5.6.0
	>=dev-qt/qtmultimedia-5.6.0[widgets]
	dev-qt/qtserialport
	>=media-libs/codec2-0.9.1
	media-libs/opus
	net-wireless/dsdcc
	sci-libs/fftw:3.0
	virtual/libusb:1
	qt5? (
		dev-qt/qtcharts
		dev-qt/qtdeclarative
		dev-qt/qtgui
		dev-qt/qtlocation
		dev-qt/qtnetwork
		dev-qt/qtpositioning
		dev-qt/qtspeech
		>=dev-qt/qtopengl-5.6.0
	)
	media-libs/opencv
	media-video/ffmpeg
	airspy? ( net-wireless/airspy )
	bladerf? ( net-wireless/bladerf )
	faad? ( media-libs/faad2 )
	hackrf? ( net-libs/libhackrf )
	limesuite? ( net-wireless/limesuite )
	plutosdr? ( net-libs/libiio )
	rtlsdr? ( net-wireless/rtl-sdr )
	sgp4? ( sci-libs/sgp4 )
	soapy? ( net-wireless/soapysdr )
	uhd? ( net-wireless/uhd )
	"

DEPEND="${RDEPEND}
	doc? ( app-doc/doxygen )
	"

PATCHES=(
	"${FILESDIR}/${PN}-boost-barycentric.patch"
)

src_configure() {
	# error: invalid conversion from ‘long int’ to ‘QDebug::Stream*’ [-fpermissive]
	export CFLAGS='-fpermissive'
	export CXXFLAGS='-fpermissive'

	mycmakeargs=(
		-DDEBUG_OUTPUT="$(usex debug)" \
		-DSANITIZE_ADDRESS=OFF \
		-DRX_SAMPLE_24BIT=ON \
		-DBUILD_SERVER="$(usex server)" \
		-DBUILD_GUI="$(usex qt5)" \
		-DBUILD_FORCE_SSSE3="$(usex cpu_flags_x86_ssse3)" \
		-DBUILD_FORCE_SSE41="$(usex cpu_flags_x86_sse4_1)" \
		-DENABLE_AIRSPY="$(usex airspy)" \
		-DENABLE_AIRSPYHF="$(usex airspy)" \
		-DENABLE_BLADERF="$(usex bladerf)" \
		-DENABLE_DOXYGEN="$(usex doc)" \
		-DENABLE_FUNCUBE="$(usex fcd)" \
		-DENABLE_HACKRF="$(usex hackrf)" \
		-DENABLE_IIO="$(usex plutosdr)" \
		-DENABLE_LIMESUITE="$(usex limesuite)" \
		-DENABLE_MIRISDR=OFF \
		-DENABLE_PERSEUS=OFF \
		-DENABLE_SOAPYSDR="$(usex soapy)" \
		-DENABLE_USRP="$(usex uhd)" \
		-DENABLE_XTRX=OFF \
	)
	cmake-utils_src_configure
}
