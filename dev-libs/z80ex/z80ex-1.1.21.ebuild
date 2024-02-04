# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs

DESCRIPTION="ZiLOG Z80 CPU emulation library"
HOMEPAGE="https://sourceforge.net/projects/z80ex/"
SRC_URI="https://downloads.sourceforge.net/project/${PN}/${PN}/${PV}/${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
SUBSLOT="1"
KEYWORDS="~amd64"

PATCHES=(
	"${FILESDIR}/${P}-toolchain.patch"
)

src_compile() {
	emake CC=$(tc-getCC) LINKER=$(tc-getCC) shared
}

src_install() {
	for l in libz80ex libz80ex_dasm; do
		ln -s "${l}.so.${PV}" "lib/${l}.so.${SUBSLOT}" || die
		ln -s "${l}.so.${SUBSLOT}" "lib/${l}.so" || die
	done

	dolib.so lib/*.so.*
	dolib.so lib/*.so

	mkdir include/z80ex || die
	mv include/*.h include/z80ex || die
	doheader -r include/z80ex
}
