# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Assembler for the Z80 microprcessor"
HOMEPAGE="https://www.nongnu.org/z80asm/"
SRC_URI="http://download.savannah.nongnu.org/releases/z80asm/${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64 x86"

PATCHES=(
	"${FILESDIR}/${PN}-1.8-cc-cflags.patch"
	"${FILESDIR}/${PN}-1.8-test.patch"
)

src_install()
{
	dobin z80asm
	doman z80asm.1
	dodoc ChangeLog TODO
	insinto "/usr/share/${PN}"
	doins -r headers
}
