# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="Amateur Radio Logging Program"
HOMEPAGE="http://www.w1hkj.com/fllog-help/index.html"
SRC_URI="https://downloads.sourceforge.net/fldigi/${P}.tar.gz"
#SRC_URI="https://github.com/w1hkj/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"

RDEPEND="
	x11-libs/fltk:=
	x11-libs/libX11:=
	x11-misc/xdg-utils
"

DEPEND="${RDEPEND}
	virtual/pkgconfig"

DOCS=( AUTHORS ChangeLog INSTALL README )

src_prepare() {
	default

	# GitHub Tarball comes without build scripts.
	eautoreconf
}
