# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A simple interface to the Winkeyer series of CW code generators"
HOMEPAGE="http://w1hkj.com/flwkey-help/index.html"
SRC_URI="mirror://sourceforge/fldigi/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="xmlrpc"

RDEPEND="
	x11-libs/fltk:=
	x11-libs/libX11:=
	x11-misc/xdg-utils
	xmlrpc? ( media-radio/flxmlrpc )
"

DEPEND="${RDEPEND}
	virtual/pkgconfig"

DOCS=( AUTHORS ChangeLog INSTALL README )

src_configure() {
	econf $(use_with xmlrpc flxmlrpc)
}
