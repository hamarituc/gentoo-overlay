# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="SDK and firmware for the AHP Telescope Controller"
HOMEPAGE="https://github.com/ahp-electronics/libahp-gt"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/ahp-electronics/libahp-gt.git"
else
	SRC_URI="https://github.com/ahp-electronics/libahp-gt/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"

PATCHES=(
	"${FILESDIR}/${P}-return.patch"
)
