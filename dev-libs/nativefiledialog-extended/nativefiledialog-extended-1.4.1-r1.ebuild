# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="File dialog library with C and C++ bindings, based on nativefiledialog"
HOMEPAGE="https://github.com/btzy/nativefiledialog-extended"
SRC_URI="https://github.com/btzy/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0/${PV}"
KEYWORDS="amd64"
IUSE="X +desktop-portal test wayland"

DEPEND="
	desktop-portal? ( sys-apps/dbus )
	!desktop-portal? (
		dev-libs/glib:2
		x11-libs/gtk+:3[X=,wayland=]
	)
"
RDEPEND="
	${DEPEND}
	desktop-portal? ( sys-apps/xdg-desktop-portal )
"
BDEPEND="
	virtual/pkgconfig
"

RESTRICT="!test? ( test )"

src_configure() {
	local mycmakeargs=(
		-DNFD_PORTAL="$(usex desktop-portal)"
		-DNFD_X11=$(usex X)
		-DNFD_WAYLAND=OFF
		-DNFD_BUILD_TESTS=$(usex test)
	)

	cmake_src_configure
}
