# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="INDI driver for focusers driven by the Pololu Tic controller"
HOMEPAGE="http://indilib.org"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/indilib/indi-3rdparty.git"
	EGIT_CHECKOUT_DIR="${WORKDIR}/${P}"
	MY_S="${EGIT_CHECKOUT_DIR}"
else
	SRC_URI="https://github.com/indilib/indi-3rdparty/archive/v${PV}.tar.gz -> indilib-3rdparty-${PV}.tar.gz"
	KEYWORDS="~amd64 ~x86"
	MY_S="${WORKDIR}/indi-3rdparty-${PV}"
fi

S="${MY_S}/indi-${PN##*-driver-}"

LICENSE="GPL-3"
SLOT="0/1"

IUSE="bluetooth"

DEPEND="
	app-misc/pololu-tic-software:=
	dev-libs/libusbp:=
	~sci-libs/indilib-${PV}
	virtual/libusb:1
	bluetooth? ( net-wireless/bluez:= )
"
RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}/${P}-libusbp.patch"
)

src_prepare() {
	cmake_src_prepare

	# remove bundled libraries
	rm -r pololu-tic-software || die
}

src_configure() {
	local mycmakeargs=(
#		-DWITH_BLUETOOTH="$(usex bluetooth)"
	)

	cmake_src_configure
}
