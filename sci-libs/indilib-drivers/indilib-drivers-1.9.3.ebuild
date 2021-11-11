# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Metapackage containing all 3rdparty drivers for INDI library"
HOMEPAGE="http://www.indilib.org/"
SRC_URI=""

LICENSE="metapackage"
SLOT="0/1"
KEYWORDS="~amd64 ~x86"

IUSE_INDILIB_DRIVERS="
	aagcloudwatcherng
	ahpxc
	aok
	apogee
	armadillo
	astrolink4
	astromechfoc
	asi
	asipower
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
	gphoto2
	gpsd
	gpsnmea
	inovaplx
	limesdr
	maxdomeii
	mgen
	mi
	nexdome
	nightscape
	orion-ssg3
	pentax
	playerone
	qhy
	qsi
	rtklib
	sbig
	shelyak
	spectracyber
	starbook
	starbookten
	sv305
	sx
	talon6
	toupbase
	webcam
	"

IUSE="${IUSE_INDILIB_DRIVERS}"

RDEPEND="aagcloudwatcherng? ( sci-libs/indilib-driver-aagcloudwatcher-ng )
	ahpxc? ( sci-libs/indilib-driver-ahp-xc )
	aok? ( sci-libs/indilib-driver-aok )
	apogee? ( sci-libs/indilib-driver-apogee )
	armadillo? ( sci-libs/indilib-driver-armadillo-platypus )
	asi? ( sci-libs/indilib-driver-asi )
	asipower? ( sci-libs/indilib-driver-asi-power )
	astrolink4? ( sci-libs/indilib-driver-astrolink4 )
	astromechfoc? ( sci-libs/indilib-driver-astromechfoc )
	atik? ( sci-libs/indilib-driver-atik )
	avalon? ( sci-libs/indilib-driver-avalon )
	beefocus? ( sci-libs/indilib-driver-beefocus )
	bresserexos2? ( sci-libs/indilib-driver-bresserexos2 )
	celestronaux? ( sci-libs/indilib-driver-celestronaux )
	dreamfocuser? ( sci-libs/indilib-driver-dreamfocuser )
	dsi? ( sci-libs/indilib-driver-dsi )
	duino? ( sci-libs/indilib-driver-duino )
	eqmod? ( sci-libs/indilib-driver-eqmod )
	ffmv? ( sci-libs/indilib-driver-ffmv )
	fishcamp? ( sci-libs/indilib-driver-fishcamp )
	fli? ( sci-libs/indilib-driver-fli )
	gige? ( sci-libs/indilib-driver-gige )
	gphoto2? ( sci-libs/indilib-driver-gphoto )
	gpsd? ( sci-libs/indilib-driver-gpsd )
	gpsnmea? ( sci-libs/indilib-driver-gpsnmea )
	inovaplx? ( sci-libs/indilib-driver-inovaplx )
	limesdr? ( sci-libs/indilib-driver-limesdr )
	maxdomeii? ( sci-libs/indilib-driver-maxdomeii )
	mgen? ( sci-libs/indilib-driver-mgen )
	mi? ( sci-libs/indilib-driver-mi )
	nexdome? ( sci-libs/indilib-driver-nexdome )
	nightscape? ( sci-libs/indilib-driver-nightscape )
	orion-ssg3? ( sci-libs/indilib-driver-orion-ssg3 )
	pentax? ( sci-libs/indilib-driver-pentax )
	playerone? ( sci-libs/indilib-driver-playerone )
	qhy? ( sci-libs/indilib-driver-qhy )
	qsi? ( sci-libs/indilib-driver-qsi )
	rtklib? ( sci-libs/indilib-driver-rtklib )
	sbig? ( sci-libs/indilib-driver-sbig )
	shelyak? ( sci-libs/indilib-driver-shelyak )
	spectracyber? ( sci-libs/indilib-driver-spectracyber )
	starbook? ( sci-libs/indilib-driver-starbook )
	starbookten? ( sci-libs/indilib-driver-starbook-ten )
	sv305? ( sci-libs/indilib-driver-sv305 )
	sx? ( sci-libs/indilib-driver-sx )
	talon6? ( sci-libs/indilib-driver-talon6 )
	toupbase? ( sci-libs/indilib-driver-toupbase )
	webcam? ( sci-libs/indilib-driver-webcam )"
