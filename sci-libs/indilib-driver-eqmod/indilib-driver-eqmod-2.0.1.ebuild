# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="INDI driver for mounts compliant to the SkyWatcher Protocol"
HOMEPAGE="http://indilib.org"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/indilib/indi-3rdparty.git"
	EGIT_CHECKOUT_DIR="${WORKDIR}/${P}"
	MY_S="${EGIT_CHECKOUT_DIR}"
else
	SRC_URI="https://github.com/indilib/indi-3rdparty/archive/v${PV}.tar.gz -> indilib-3rdparty-${PV}.tar.gz"
	KEYWORDS="amd64 x86"
	MY_S="${WORKDIR}/indi-3rdparty-${PV}"
fi

LICENSE="GPL-3"
SLOT="0/1"
IUSE="indilib_drivers_ahp-gt"

DEPEND="
	~sci-libs/indilib-${PV}
	indilib_drivers_ahp-gt? ( ~sci-libs/libahp-gt-${PV} )
"
RDEPEND="${DEPEND}"

S="${MY_S}/indi-${PN##*-driver-}"

src_configure() {
	local mycmakeargs=(
		-DWITH_AHP_GT="$(usex indilib_drivers_ahp-gt)"
	)

	cmake_src_configure
}
