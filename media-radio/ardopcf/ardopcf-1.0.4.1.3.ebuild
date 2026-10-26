# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN=ardop

DESCRIPTION="Implementation of the Amateur Radio Digital Open Protocol (ARDOP)"
HOMEPAGE="https://github.com/pflarue/ardop"
SRC_URI="https://github.com/pflarue/ardop/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${MY_PN}-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

DEPEND="
	dev-libs/hidapi:=
	media-libs/alsa-lib:=
"
RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}/${PN}-fixes.patch"
)

src_install()
{
	dobin ardopcf

	rm docs/*_[wW]indows* || die
	dodoc docs/*.md
}
