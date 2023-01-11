# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs

DESCRIPTION="Visualize heap operations for pwn and debugging"
HOMEPAGE="https://github.com/Arinerron/heaptrace"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/Arinerron/heaptrace.git"
else
	SRC_URI="https://github.com/Arinerron/heaptrace/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="BSD"
SLOT="0"

src_compile() {
	emake CC="$(tc-getCC)" CFLAGS="${CFLAGS}" CCFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}"
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
	einstalldocs
}
