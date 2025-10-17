# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="C++ shared library for the BNO08x IMU"
HOMEPAGE="https://github.com/knro/libbno08x"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/knro/libbno08x.git"
else
	COMMIT="2f8d6fc70a7f3fb224a46675c7bb9aecae046459"

	SRC_URI="https://github.com/knro/libbno08x/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="amd64 x86"
	S="${WORKDIR}/${PN}-${COMMIT}"
fi

LICENSE="BSD"
SLOT="0/0"

DEPEND="dev-libs/libgpiod:="
RDEPEND="${DEPEND}"
