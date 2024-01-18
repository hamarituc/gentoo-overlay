# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Assembler for the Z80 microprcessor"
HOMEPAGE="https://www.nongnu.org/z80asm/"

if [[ ${PV} == "9999" ]]; then
	EGIT_REPO_URI="https://git.savannah.nongnu.org/git/z80asm.git"
	inherit autotools git-r3
else
	SRC_URI="http://download.savannah.nongnu.org/releases/z80asm/z80asm-1.8.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3+"
SLOT="0"

src_configure()
{
	if [[ ${PV} == "9999" ]]; then
		eautoreconf
	fi

	econf --datadir="${EPREFIX}/usr/share/${PN}"
}
