# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="This is the Levenhuk Library SDK for Linux & MacOS"
HOMEPAGE="http://indilib.org"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/indilib/indi-3rdparty.git"
	EGIT_CHECKOUT_DIR="${WORKDIR}/${P}"
	S="${EGIT_CHECKOUT_DIR}/${PN}"
else
	SRC_URI="https://github.com/indilib/indi-3rdparty/archive/v${PV}.tar.gz -> indilib-3rdparty-${PV}.tar.gz"
	KEYWORDS="~amd64 ~arm ~x86"
	S="${WORKDIR}/indi-3rdparty-${PV}/${PN}"
fi

LICENSE="LGPL-2"
SLOT="0/1"

DEPEND=""
RDEPEND="${DEPEND}"
