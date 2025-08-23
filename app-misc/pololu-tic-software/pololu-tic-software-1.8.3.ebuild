# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Software and drivers for the Pololu Tic Stepper Motor Controller"
HOMEPAGE="https://github.com/pololu/pololu-tic-software"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/pololu/pololu-tic-software.git"
else
	SRC_URI="https://github.com/pololu/pololu-tic-software/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="amd64 x86"
fi

LICENSE="MIT"
SLOT="0"

IUSE="qt5 qt6"

DEPEND="
	dev-libs/libusbp:=
	dev-libs/libyaml:=
	dev-libs/tinyxml2:=
	qt5?
	(
		dev-qt/qtcore:5
		dev-qt/qtgui:5
		dev-qt/qtwidgets:5
	)
	qt6?
	(
		dev-qt/qtbase:6[gui,widgets]
	)
"
RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}/${P}-installdirs.patch"
	"${FILESDIR}/${P}-libyaml.patch"
	"${FILESDIR}/${P}-tinyxml2.patch"
)

src_configure() {
	local mycmakeargs=(
		-DUSE_SYSTEM_LIBTINYXML2="yes"
		-DUSE_SYSTEM_LIBYAML="yes"
	)
	if use qt5 || use qt6; then
		mycmakeargs+=( -DENABLE_GUI="yes" )
	else
		mycmakeargs+=( -DENABLE_GUI="no" )
	fi

	cmake_src_configure
}
