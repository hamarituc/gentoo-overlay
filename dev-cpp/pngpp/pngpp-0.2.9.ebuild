# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_P=${P/pp/++}

DESCRIPTION="A simple but powerful C++ interface to libpng"
HOMEPAGE="http://www.nongnu.org/pngpp/"
SRC_URI="http://download.savannah.nongnu.org/releases/pngpp/${MY_P}.tar.gz"

S=${WORKDIR}/${MY_P}

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND="media-libs/libpng:0"
RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}"/${PN}-0.2.9-DESTDIR.patch
)

src_install()
{
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install-headers
	einstalldocs

	docinto examples
	dodoc example/*.cpp
	docompress -x "/usr/share/doc/${PF}/examples"
}
