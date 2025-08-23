# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="The Pololu USB Library"
HOMEPAGE="https://github.com/pololu/libusbp"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/pololu/libusbp.git"
else
	SRC_URI="https://github.com/pololu/libusbp/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"

DEPEND="
	virtual/libudev:=
"
RDEPEND="${DEPEND}"
