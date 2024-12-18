# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="Numerical antenna analysis program"
HOMEPAGE="https://github.com/KJ7LNW/nec2c"

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/KJ7LNW/nec2c.git"
else
	SRC_URI="https://github.com/KJ7LNW/nec2c/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="amd64 x86"
fi

LICENSE="GPL-3+"
SLOT="0"

src_prepare() {
	eapply_user
	eautoreconf
}
