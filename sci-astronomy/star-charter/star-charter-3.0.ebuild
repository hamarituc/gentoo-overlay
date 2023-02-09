# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A command-line tool for producing vector-graphics charts of the night sky"
HOMEPAGE="https://github.com/dcf21/star-charter"

if [[ ${PV} = "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/dcf21/star-charter.git"
else
	SRC_URI="https://github.com/dcf21/star-charter/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="amd64 x86"
fi

LICENSE="GPL-3+"
SLOT="0"
IUSE="examples"

DEPEND="
	sci-libs/gsl:=
	sys-libs/zlib:=
	x11-libs/cairo:=
"
RDEPEND="${DEPEND}"

src_install() {
	dobin "${BUILD_DIR}/starcharter"

	dodoc README.md

	insinto "/usr/share/${PN}"
	doins -r data

	if use examples; then
		doins -r examples
	fi
}
