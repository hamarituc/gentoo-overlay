# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="Cross platform Winlink client"
HOMEPAGE="https://getpat.io/"
SRC_URI="
	https://github.com/la5nta/pat/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://www.mariohaustein.de/gentoo/distfiles/${P}-deps.tar.xz
"

LICENSE="Apache-2.0 BSD ISC MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-libs/libax25"
RDEPEND="${DEPEND}"

src_compile() {
	set -- go build -tags libax25 ${EGO_PN}
	echo "$@"
	"$@" || die
}

src_install() {
	dobin pat
	dodoc README.md
	doman man/*.1
}
