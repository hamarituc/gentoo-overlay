# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

DESCRIPTION="XmlRpc library used by fldigi, flrig, flnet, flmsg, flarq, flamp, fllog"
HOMEPAGE="http://www.w1hkj.com/downloads/flxmlrpc/README.txt"
SRC_URI="mirror://sourceforge/fldigi/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND=""

DEPEND="${RDEPEND}
	virtual/pkgconfig"

DOCS=( AUTHORS ChangeLog INSTALL README )
