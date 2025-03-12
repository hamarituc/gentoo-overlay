# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="XmlRpc library used by fldigi, flrig, flnet, flmsg, flarq, flamp, fllog"
HOMEPAGE="http://www.w1hkj.com/downloads/flxmlrpc/README.txt"
SRC_URI="https://downloads.sourceforge.net/fldigi/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND="${RDEPEND}
	virtual/pkgconfig"

DOCS=( AUTHORS ChangeLog INSTALL README )
