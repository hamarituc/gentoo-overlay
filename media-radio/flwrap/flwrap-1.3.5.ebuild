# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

DESCRIPTION="Reliable File Transfer Programm for Amateur Radio Use"
HOMEPAGE="http://www.w1hkj.com/Flwrap/index.html"
SRC_URI="mirror://sourceforge/fldigi/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	x11-libs/fltk:1
	x11-libs/libX11
	x11-misc/xdg-utils
"

DEPEND="${RDEPEND}
	virtual/pkgconfig"

DOCS=( AUTHORS ChangeLog INSTALL README )
