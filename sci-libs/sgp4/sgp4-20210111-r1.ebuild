# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

COMMIT="ca9d4d97af4ee62461de6f13e0c85d1dc6000040"

DESCRIPTION="Simplified perturbations models"
HOMEPAGE="https://github.com/dnwrnr/sgp4"
SRC_URI="https://github.com/dnwrnr/sgp4/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}/${PN}-libdir.patch"
)

S="${WORKDIR}/${PN}-${COMMIT}"
