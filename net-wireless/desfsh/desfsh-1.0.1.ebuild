# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} )

inherit lua-single

DESCRIPTION="An interactive application for accessing Mifare DESFire NFC tags"
HOMEPAGE="https://github.com/hamarituc/desfsh"

if [[ ${PV} == "9999" ]] ; then
    EGIT_REPO_URI="https://github.com/hamarituc/desfsh.git"
    KEYWORDS=""
    inherit git-r3
else
	SRC_URI="https://github.com/hamarituc/desfsh/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="amd64"
fi

LICENSE="GPL-3"
SLOT="0"

REQUIRED_USE="${LUA_REQUIRED_USE}"
DEPEND="${LUA_DEPS}
	dev-libs/libnfc:=
	dev-libs/openssl:=
	net-wireless/libfreefare:=
	sys-libs/ncurses:=
	sys-libs/readline:=
	sys-libs/zlib:=
"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

src_compile()
{
	emake LUAPKG="${ELUA}" all
}

src_install()
{
	dobin desfsh
}
