# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Metapackage containing all 3rdparty drivers for INDI library"
HOMEPAGE="http://www.indilib.org/"
SRC_URI=""

if [[ ${PV} != "9999" ]]; then
	KEYWORDS="amd64 ~x86"
fi

LICENSE="metapackage"
SLOT="0/1"

IUSE_INDILIB_DRIVERS="
	aagcloudwatcher-ng
	ahp-gt
	ahp-xc
	aok
	apogee
	armadillo
	asi
	asi-power
	astroasis
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
	rolloffino
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

REQUIRED_USE="
	indilib_drivers_asi-power? ( arm )
	indilib_drivers_astroasis? ( amd64 )
	indilib_drivers_qhy? ( amd64 )
	indilib_drivers_rpi-gpio? ( arm )
	indilib_drivers_rpicam? ( arm )
	indilib_drivers_sbig? ( amd64 )
	indilib_drivers_toupbase? ( amd64 )
"

RDEPEND="
	indilib_drivers_aagcloudwatcher-ng? ( ~sci-libs/indilib-driver-aagcloudwatcher-ng-${PV} )
	indilib_drivers_ahp-gt? ( ~sci-libs/indilib-driver-eqmod-${PV}[indilib_drivers_ahp-gt] )
	indilib_drivers_ahp-xc? ( ~sci-libs/indilib-driver-ahp-xc-${PV} )
	indilib_drivers_aok? ( ~sci-libs/indilib-driver-aok-${PV} )
	indilib_drivers_apogee? ( ~sci-libs/indilib-driver-apogee-${PV} )
	indilib_drivers_armadillo? ( ~sci-libs/indilib-driver-armadillo-platypus-${PV} )
	indilib_drivers_asi? ( ~sci-libs/indilib-driver-asi-${PV} )
	indilib_drivers_asi-power? (
		arm? ( ~sci-libs/indilib-driver-asi-power-${PV} )
	)
	indilib_drivers_astroasis? (
		amd64? ( ~sci-libs/indilib-driver-astroasis-${PV} )
	)
	indilib_drivers_astrolink4? ( ~sci-libs/indilib-driver-astrolink4-${PV} )
	indilib_drivers_astromechfoc? ( ~sci-libs/indilib-driver-astromechfoc-${PV} )
	indilib_drivers_atik? ( ~sci-libs/indilib-driver-atik-${PV} )
	indilib_drivers_avalon? ( ~sci-libs/indilib-driver-avalon-${PV} )
	indilib_drivers_beefocus? ( ~sci-libs/indilib-driver-beefocus-${PV} )
	indilib_drivers_bresserexos2? ( ~sci-libs/indilib-driver-bresserexos2-${PV} )
	indilib_drivers_celestronaux? ( ~sci-libs/indilib-driver-celestronaux-${PV} )
	indilib_drivers_dreamfocuser? ( ~sci-libs/indilib-driver-dreamfocuser-${PV} )
	indilib_drivers_dsi? ( ~sci-libs/indilib-driver-dsi-${PV} )
	indilib_drivers_duino? ( ~sci-libs/indilib-driver-duino-${PV} )
	indilib_drivers_eqmod? ( ~sci-libs/indilib-driver-eqmod-${PV} )
	indilib_drivers_ffmv? ( ~sci-libs/indilib-driver-ffmv-${PV} )
	indilib_drivers_fishcamp? ( ~sci-libs/indilib-driver-fishcamp-${PV} )
	indilib_drivers_fli? ( ~sci-libs/indilib-driver-fli-${PV} )
	indilib_drivers_gige? ( ~sci-libs/indilib-driver-gige-${PV} )
	indilib_drivers_gphoto? ( ~sci-libs/indilib-driver-gphoto-${PV} )
	indilib_drivers_gpsd? ( ~sci-libs/indilib-driver-gpsd-${PV} )
	indilib_drivers_gpsnmea? ( ~sci-libs/indilib-driver-gpsnmea-${PV} )
	indilib_drivers_inovaplx? ( ~sci-libs/indilib-driver-inovaplx-${PV} )
	indilib_drivers_libcamera? ( ~sci-libs/indilib-driver-libcamera-${PV} )
	indilib_drivers_limesdr? ( ~sci-libs/indilib-driver-limesdr-${PV} )
	indilib_drivers_maxdomeii? ( ~sci-libs/indilib-driver-maxdomeii-${PV} )
	indilib_drivers_mgen? ( ~sci-libs/indilib-driver-mgen-${PV} )
	indilib_drivers_mi? ( ~sci-libs/indilib-driver-mi-${PV} )
	indilib_drivers_nexdome? ( ~sci-libs/indilib-driver-nexdome-${PV} )
	indilib_drivers_nightscape? ( ~sci-libs/indilib-driver-nightscape-${PV} )
	indilib_drivers_nut? ( ~sci-libs/indilib-driver-nut-${PV} )
	indilib_drivers_orion-ssg3? ( ~sci-libs/indilib-driver-orion-ssg3-${PV} )
	indilib_drivers_pentax? ( ~sci-libs/indilib-driver-pentax-${PV} )
	indilib_drivers_playerone? ( ~sci-libs/indilib-driver-playerone-${PV} )
	indilib_drivers_qhy?
	(
		amd64? ( ~sci-libs/indilib-driver-qhy-${PV} )
	)
	indilib_drivers_qsi? ( ~sci-libs/indilib-driver-qsi-${PV} )
	indilib_drivers_rolloffino? ( ~sci-libs/indilib-driver-rolloffino-${PV} )
	indilib_drivers_rpi-gpio? (
		arm? ( ~sci-libs/indilib-driver-rpi-gpio-${PV} )
	)
	indilib_drivers_rpicam? (
		arm? ( ~sci-libs/indilib-driver-rpicam-${PV} )
	)
	indilib_drivers_rtklib? ( ~sci-libs/indilib-driver-rtklib-${PV} )
	indilib_drivers_sbig?
	(
		amd64? ( ~sci-libs/indilib-driver-sbig-${PV} )
	)
	indilib_drivers_shelyak? ( ~sci-libs/indilib-driver-shelyak-${PV} )
	indilib_drivers_spectracyber? ( ~sci-libs/indilib-driver-spectracyber-${PV} )
	indilib_drivers_starbook? ( ~sci-libs/indilib-driver-starbook-${PV} )
	indilib_drivers_starbook-ten? ( ~sci-libs/indilib-driver-starbook-ten-${PV} )
	indilib_drivers_svbony? ( ~sci-libs/indilib-driver-svbony-${PV} )
	indilib_drivers_sx? ( ~sci-libs/indilib-driver-sx-${PV} )
	indilib_drivers_talon6? ( ~sci-libs/indilib-driver-talon6-${PV} )
	indilib_drivers_toupbase? (
		amd64? ( ~sci-libs/indilib-driver-toupbase-${PV} )
	)
	indilib_drivers_webcam? ( ~sci-libs/indilib-driver-webcam-${PV} )
	indilib_drivers_weewx-json? ( ~sci-libs/indilib-driver-weewx-json-${PV} )
"
