# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit bash-completion-r1 udev

DESCRIPTION="A program for controlling the MiniPRO TL866xx series of chip programmers"
HOMEPAGE="https://gitlab.com/DavidGriffith/minipro/"

if [[ ${PV} == "9999" ]]; then
	EGIT_REPO_URI="https://gitlab.com/DavidGriffith/minipro.git"
	inherit git-r3
else
	SRC_URI="https://gitlab.com/DavidGriffith/minipro/-/archive/${PV}/${P}.tar.bz2"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3+"
SLOT="0"

DEPEND="
	virtual/libusb:=
"
RDEPEND="${DEPEND}"
BDEPEND="
	virtual/pkgconfig
"

PATCHES=(
	"${FILESDIR}/${PN}-flags.patch"
)

src_compile()
{
	export PREFIX="${EPREFIX}/usr"
	export COMPLETIONS_DIR="$(get_bashcompdir)"

	emake
}

src_install()
{
	export DESTDIR="${D}"
	export PREFIX="${EPREFIX}/usr"
	export COMPLETIONS_DIR="$(get_bashcompdir)"

	emake install
}

pkg_postinst()
{
	udev_reload
}

pkg_postrm()
{
	udev_reload
}
