# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Atmel AVR simulator"
HOMEPAGE="https://github.com/buserror/simavr"

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/buserror/simavr.git"
	KEYWORDS=""
	inherit git-r3
else
	SRC_URI="https://github.com/buserror/simavr/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3"
SLOT="0"

PATCHES="
	${FILESDIR}/${PN}-install.patch
"

src_compile() {
	emake build-simavr
}

src_install() {
	local OBJ="obj-$(gcc -dumpmachine)"

	emake DESTDIR="${D}/usr" install-simavr
	newbin simavr/${OBJ}/run_avr.elf simavr
	dolib.so simavr/${OBJ}/libsimavr.so.1
	dodoc doc/manual/manual.pdf
}
