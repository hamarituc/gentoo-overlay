# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CMAKE_MAKEFILE_GENERATOR="emake"

inherit cmake

DESCRIPTION="a cross-platform SDR software with the aim of being bloat free and simple to use"
HOMEPAGE="https://github.com/AlexandreRouma/SDRPlusPlus"

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/AlexandreRouma/SDRPlusPlus.git"
else
	SRC_URI="https://github.com/AlexandreRouma/SDRPlusPlus/archive/${PV}.tar.gz -> ${P}.tar.gz"
	S="${WORKDIR}/SDRPlusPlus-${PV}"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3"
SLOT="0"

IUSE="airspy airspyhf +audio badgesdr bladerf discord hackrf limesdr m17 plutosdr portaudio +rtlsdr sdrplay soapysdr spyserver usrp"

DEPEND="
	media-libs/glew
	media-libs/glfw
	sci-libs/fftw
	sci-libs/volk
	airspy? ( net-wireless/airspy )
	airspyhf? ( net-wireless/airspyhf )
	audio? ( media-libs/rtaudio )
	badgesdr? ( dev-libs/libusb )
	bladerf? ( net-wireless/bladerf )
	hackrf? ( net-libs/libhackrf )
	limesdr? ( net-wireless/limesuite )
	m17? ( media-libs/codec2 )
	plutosdr? (
		net-libs/libiio
		net-libs/libad9361-iio
	)
	portaudio? ( media-libs/portaudio )
	rtlsdr? ( net-wireless/rtl-sdr )
	sdrplay? ( net-wireless/sdrplay )
	soapysdr? ( net-wireless/soapysdr )
	usrp? ( net-wireless/uhd )
"
#RDEPEND="
#	${DEPEND}
#	falcon9? ( media-video/ffmpeg )
#"

PATCHES=(
	"${FILESDIR}/${PN}-plugins-prefix.patch"
	"${FILESDIR}/${P}-portaudio_sink.patch"
	"${FILESDIR}/${P}-installdirs.patch"
)

src_configure() {
	local mycmakeargs=(
		-DOPT_BUILD_AIRSPY_SOURCE=$(usex airspy)
		-DOPT_BUILD_AIRSPYHF_SOURCE=$(usex airspyhf)
		-DOPT_BUILD_AUDIO_SOURCE=$(usex audio)
		-DOPT_BUILD_BADGESDR_SOURCE=$(usex badgesdr)
		-DOPT_BUILD_BLADERF_SOURCE=$(usex bladerf)
		-DOPT_BUILD_FILE_SOURCE=ON
		-DOPT_BUILD_FOBOSSDR_SOURCE=OFF
		-DOPT_BUILD_HACKRF_SOURCE=$(usex hackrf)
		-DOPT_BUILD_HAROGIC_SOURCE=OFF
		-DOPT_BUILD_HERMES_SOURCE=ON
		-DOPT_BUILD_KCSDR_SOURCE=OFF
		-DOPT_BUILD_LIMESDR_SOURCE=$(usex limesdr)
		-DOPT_BUILD_NETWORK_SOURCE=ON
		-DOPT_BUILD_PERSEUS_SOURCE=OFF
		-DOPT_BUILD_PLUTOSDR_SOURCE=$(usex plutosdr)
		-DOPT_BUILD_RFNM_SOURCE=OFF
		-DOPT_BUILD_RFSPACE_SOURCE=ON
		-DOPT_BUILD_RTL_SDR_SOURCE=$(usex rtlsdr)
		-DOPT_BUILD_RTL_TCP_SOURCE=ON
		-DOPT_BUILD_SDRPP_SERVER_SOURCE=ON
		-DOPT_BUILD_SDRPLAY_SOURCE=$(usex sdrplay)
		-DOPT_BUILD_SOAPY_SOURCE=$(usex soapysdr)
		-DOPT_BUILD_SPECTRAN_SOURCE=OFF
		-DOPT_BUILD_SPECTRAN_HTTP_SOURCE=ON
		-DOPT_BUILD_SPYSERVER_SOURCE=$(usex spyserver)
		-DOPT_BUILD_USRP_SOURCE=$(usex usrp)
		-DOPT_BUILD_AUDIO_SINK=$(usex audio)
		-DOPT_BUILD_NETWORK_SINK=ON
		-DOPT_BUILD_PORTAUDIO_SINK=$(usex portaudio)
		#-DOPT_BUILD_ATV_DECODER=ON
		#-DOPT_BUILD_DAB_DECODER=ON
		#-DOPT_BUILD_FALCON9_DECODER=$(usex falcon9)
		#-DOPT_BUILD_KG_SSTV_DECODER=ON
		-DOPT_BUILD_M17_DECODER=$(usex m17)
		-DOPT_BUILD_METEOR_DEMODULATOR=ON
		-DOPT_BUILD_PAGER_DECODER=ON
		-DOPT_BUILD_RADIO=ON
		-DOPT_BUILD_RYFI_DECODER=ON
		-DOPT_BUILD_VOR_RECEIVER=ON
		#-DOPT_BUILD_WEATHER_SAT_DECODER=ON
		-DOPT_BUILD_DISCORD_PRESENCE=$(usex discord)
		-DOPT_BUILD_FREQUENCY_MANAGER=ON
		-DOPT_BUILD_IQ_EXPORTER=ON
		-DOPT_BUILD_RECORDER=ON
		-DOPT_BUILD_RIGCTL_CLIENT=ON
		-DOPT_BUILD_RIGCTL_SERVER=ON
		-DOPT_BUILD_SCANNER=ON
		-DOPT_BUILD_SCHEDULER=ON
	)

	cmake_src_configure
}
