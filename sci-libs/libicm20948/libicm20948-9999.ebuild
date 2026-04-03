# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Driver for InvenSense ICM20948 9-axis IMU"
HOMEPAGE="https://github.com/knro/libicm20948"

inherit cmake

GIT_COMMIT="e448d4053fce4c07dcf3156862dfe6eb901f1a3b"

if [[ ${PV} == 9999 ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/knro/libicm20948.git"
else
	SRC_URI="https://github.com/knro/libicm20948/archive/${GIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"
	KEYWORDS="amd64 x86"
	S="${WORKDIR}/${PN}-${GIT_COMMIT}"
fi

LICENSE="MIT"
SLOT="0"

DEPEND="
	dev-libs/libgpiod:=
"
RDEPEND="${DEPEND}"
BDEPEND="
	virtual/pkgconfig
"
