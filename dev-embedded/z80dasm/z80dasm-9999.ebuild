# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="z80dasm is a disassembler for the Zilog Z80 microprocessor and compatibles"
HOMEPAGE="https://www.tablix.org/~avian/blog/articles/z80dasm/"

if [[ ${PV} == "9999" ]]; then
	EGIT_REPO_URI="https://www.tablix.org/~avian/git/z80dasm.git"
	inherit autotools git-r3
else
	SRC_URI="https://www.tablix.org/~avian/z80dasm/${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-2+"
SLOT="0"

src_configure()
{
	if [[ ${PV} == "9999" ]]; then
		eautoreconf
	fi

	default
}
