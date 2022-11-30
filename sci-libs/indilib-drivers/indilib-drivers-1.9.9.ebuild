# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Metapackage containing all 3rdparty drivers for INDI library"
HOMEPAGE="http://www.indilib.org/"
SRC_URI=""

if [[ ${PV} != "9999" ]]; then
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="metapackage"
SLOT="0/1"

IUSE_INDILIB_DRIVERS="
	aagcloudwatcher-ng
	ahp-xc
	aok
	apogee
	armadillo
	asi
	asi-power
	astrolink4
	astromechfoc
	atik
	avalon
	beefocus
	bresserexos2
	celestronaux
	dreamfocuser
	dsi
	duino
	eqmod
	ffmv
	fishcamp
	fli
	gige
	gphoto
	gpsd
	gpsnmea
	inovaplx
	libcamera
	limesdr
	maxdomeii
	mgen
	mi
	nexdome
	nightscape
	nut
	orion-ssg3
	pentax
	playerone
	qhy
	qsi
	rpi-gpio
	rpicam
	rtklib
	sbig
	shelyak
	spectracyber
	starbook
	starbook-ten
	svbony
	sx
	talon6
	toupbase
	webcam
	weewx-json
"

use_indilib_drivers=$(printf ' indilib_drivers_%s' ${IUSE_INDILIB_DRIVERS})
IUSE="${use_indilib_drivers}"

RDEPEND="
	indilib_drivers_aagcloudwatcher-ng? ( sci-libs/indilib-driver-aagcloudwatcher-ng )
	indilib_drivers_ahp-xc? ( sci-libs/indilib-driver-ahp-xc )
	indilib_drivers_aok? ( sci-libs/indilib-driver-aok )
	indilib_drivers_apogee? ( sci-libs/indilib-driver-apogee )
	indilib_drivers_armadillo? ( sci-libs/indilib-driver-armadillo-platypus )
	indilib_drivers_asi? ( sci-libs/indilib-driver-asi )
	indilib_drivers_asi-power? ( sci-libs/indilib-driver-asi-power )
	indilib_drivers_astrolink4? ( sci-libs/indilib-driver-astrolink4 )
	indilib_drivers_astromechfoc? ( sci-libs/indilib-driver-astromechfoc )
	indilib_drivers_atik? ( sci-libs/indilib-driver-atik )
	indilib_drivers_avalon? ( sci-libs/indilib-driver-avalon )
	indilib_drivers_beefocus? ( sci-libs/indilib-driver-beefocus )
	indilib_drivers_bresserexos2? ( sci-libs/indilib-driver-bresserexos2 )
	indilib_drivers_celestronaux? ( sci-libs/indilib-driver-celestronaux )
	indilib_drivers_dreamfocuser? ( sci-libs/indilib-driver-dreamfocuser )
	indilib_drivers_dsi? ( sci-libs/indilib-driver-dsi )
	indilib_drivers_duino? ( sci-libs/indilib-driver-duino )
	indilib_drivers_eqmod? ( sci-libs/indilib-driver-eqmod )
	indilib_drivers_ffmv? ( sci-libs/indilib-driver-ffmv )
	indilib_drivers_fishcamp? ( sci-libs/indilib-driver-fishcamp )
	indilib_drivers_fli? ( sci-libs/indilib-driver-fli )
	indilib_drivers_gige? ( sci-libs/indilib-driver-gige )
	indilib_drivers_gphoto? ( sci-libs/indilib-driver-gphoto )
	indilib_drivers_gpsd? ( sci-libs/indilib-driver-gpsd )
	indilib_drivers_gpsnmea? ( sci-libs/indilib-driver-gpsnmea )
	indilib_drivers_inovaplx? ( sci-libs/indilib-driver-inovaplx )
	indilib_drivers_libcamera? ( sci-libs/indilib-driver-libcamera )
	indilib_drivers_limesdr? ( sci-libs/indilib-driver-limesdr )
	indilib_drivers_maxdomeii? ( sci-libs/indilib-driver-maxdomeii )
	indilib_drivers_mgen? ( sci-libs/indilib-driver-mgen )
	indilib_drivers_mi? ( sci-libs/indilib-driver-mi )
	indilib_drivers_nexdome? ( sci-libs/indilib-driver-nexdome )
	indilib_drivers_nightscape? ( sci-libs/indilib-driver-nightscape )
	indilib_drivers_nut? ( sci-libs/indilib-driver-nut )
	indilib_drivers_orion-ssg3? ( sci-libs/indilib-driver-orion-ssg3 )
	indilib_drivers_pentax? ( sci-libs/indilib-driver-pentax )
	indilib_drivers_playerone? ( sci-libs/indilib-driver-playerone )
	indilib_drivers_qhy? ( sci-libs/indilib-driver-qhy )
	indilib_drivers_qsi? ( sci-libs/indilib-driver-qsi )
	indilib_drivers_rpi-gpio? ( sci-libs/indilib-driver-rpi-gpio )
	indilib_drivers_rpicam? ( sci-libs/indilib-driver-rpicam )
	indilib_drivers_rtklib? ( sci-libs/indilib-driver-rtklib )
	indilib_drivers_sbig? ( sci-libs/indilib-driver-sbig )
	indilib_drivers_shelyak? ( sci-libs/indilib-driver-shelyak )
	indilib_drivers_spectracyber? ( sci-libs/indilib-driver-spectracyber )
	indilib_drivers_starbook? ( sci-libs/indilib-driver-starbook )
	indilib_drivers_starbook-ten? ( sci-libs/indilib-driver-starbook-ten )
	indilib_drivers_svbony? ( sci-libs/indilib-driver-svbony )
	indilib_drivers_sx? ( sci-libs/indilib-driver-sx )
	indilib_drivers_talon6? ( sci-libs/indilib-driver-talon6 )
	indilib_drivers_toupbase? ( sci-libs/indilib-driver-toupbase )
	indilib_drivers_webcam? ( sci-libs/indilib-driver-webcam )
	indilib_drivers_weewx-json? ( sci-libs/indilib-driver-weewx-json )
"
