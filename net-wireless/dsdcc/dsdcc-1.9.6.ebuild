# Copyright 2020-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Digital Speech Decoder (DSD) rewritten as a C++ library"
HOMEPAGE="https://github.com/f4exb/dsdcc"
SRC_URI="https://github.com/f4exb/dsdcc/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="portaudio"

DEPEND="
	dev-libs/serialDV
	media-libs/libsndfile
	media-libs/mbelib
	sci-libs/itpp
	portaudio? ( media-libs/portaudio )
"

RDEPEND="${DEPEND}"
