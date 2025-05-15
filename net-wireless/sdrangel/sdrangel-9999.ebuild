# Copyright 2020-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="SDR Rx/Tx software"
HOMEPAGE="https://github.com/f4exb/sdrangel"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/f4exb/sdrangel.git"
else
	SRC_URI="https://github.com/f4exb/sdrangel/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE="airspy bladerf cpu_flags_x86_sse2 cpu_flags_x86_sse3 cpu_flags_x86_ssse3 cpu_flags_x86_sse4_1 cpu_flags_x86_sse4_2 faad fcd debug doc +gui hackrf limesuite plutosdr qt6 rtlsdr server sgp4 soapy uhd"

# TODO: perseus, xtrx, mirisdr

RDEPEND="
	dev-libs/boost:=
	dev-libs/cm256cc:=
	dev-libs/hidapi:=
	>=dev-libs/serialDV-1.1.5:=
	>=media-libs/codec2-1.0.5:=
	media-libs/flac:=
	media-libs/hamlib:=
	media-libs/opus:=
	media-libs/opencv:=
	media-radio/ggmorse:=
	media-video/ffmpeg:=
	net-libs/libhackrf:=
	net-wireless/dsdcc:=
	sci-libs/fftw:3.0
	sys-libs/zlib:=
	virtual/libusb:1
	qt6? (
		dev-qt/qtbase:6[widgets]
		dev-qt/qtcharts:6
		dev-qt/qtmultimedia:6
		dev-qt/qtpositioning:6
		dev-qt/qtserialport:6
		dev-qt/qtwebsockets:6
		dev-qt/qt5compat:6
		gui? (
			dev-qt/qtbase:6[opengl]
			dev-qt/qtdeclarative:6
			dev-qt/qtlocation:6
			dev-qt/qtsvg:6
			dev-qt/qtspeech:6
			dev-qt/qtscxml:6
			dev-qt/qtwebengine:6[widgets]
		)
	)
	airspy? ( net-wireless/airspy:= )
	bladerf? ( net-wireless/bladerf:= )
	faad? ( media-libs/faad2:= )
	hackrf? ( >=net-libs/libhackrf-2024.02.1:= )
	limesuite? ( net-wireless/limesuite:= )
	plutosdr? ( net-libs/libiio:= )
	rtlsdr? ( >=net-wireless/rtl-sdr-2.0.1:= )
	sgp4? ( sci-libs/sgp4:= )
	soapy? ( net-wireless/soapysdr:= )
	uhd? ( net-wireless/uhd:= )
"

DEPEND="
	${RDEPEND}
	doc? ( app-text/doxygen )
"

src_configure() {
	# error: invalid conversion from ‘long int’ to ‘QDebug::Stream*’ [-fpermissive]
	export CFLAGS='-fpermissive'
	export CXXFLAGS='-fpermissive'

	local mycmakeargs=(
		-DDEBUG_OUTPUT="$(usex debug)" \
		-DBUILD_SHARED_LIBS=ON \
		-DENABLE_EXTERNAL_LIBRARIES=OFF \
		-DSANITIZE_ADDRESS=OFF \
		-DRX_SAMPLE_24BIT=ON \
		-DBUILD_SERVER="$(usex server)" \
		-DBUILD_GUI="$(usex gui)" \
		-DENABLE_AIRSPY="$(usex airspy)" \
		-DENABLE_AIRSPYHF="$(usex airspy)" \
		-DENABLE_BLADERF="$(usex bladerf)" \
		-DENABLE_FUNCUBE="$(usex fcd)" \
		-DENABLE_HACKRF="$(usex hackrf)" \
		-DENABLE_IIO="$(usex plutosdr)" \
		-DENABLE_LIMESUITE="$(usex limesuite)" \
		-DENABLE_MIRISDR=OFF \
		-DENABLE_PERSEUS=OFF \
		-DENABLE_QT6="$(usex qt6)" \
		-DENABLE_SOAPYSDR="$(usex soapy)" \
		-DENABLE_USRP="$(usex uhd)" \
		-DENABLE_XTRX=OFF \
		-DWITH_DOC="$(usex doc)" \
	)

	if use cpu_flags_x86_sse4_2; then
		 arrVar+=(-DARCH_OPT="SSE4_2")
	elif use cpu_flags_x86_sse4_1; then
		 arrVar+=(-DARCH_OPT="SSE4_1")
	elif use cpu_flags_x86_ssse3; then
		 arrVar+=(-DARCH_OPT="SSSE3")
	elif use cpu_flags_x86_sse3; then
		 arrVar+=(-DARCH_OPT="SSE3")
	elif use cpu_flags_x86_sse2; then
		 arrVar+=(-DARCH_OPT="SSE2")
	fi

	cmake_src_configure
}

src_compile() {
	cmake_src_compile

	if use doc; then
		cmake_src_compile dev_docs
		HTML_DOCS=( "${BUILD_DIR}"/dev_docs/. )
	fi
}
