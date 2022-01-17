# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="RICOH Camera USB SDK for C++"
HOMEPAGE="http://indilib.org"
SRC_URI="https://github.com/indilib/indi-3rdparty/archive/v${PV}.tar.gz -> indilib-3rdparty-${PV}.tar.gz"

LICENSE="RICOH"
KEYWORDS="~amd64 ~x86"

SLOT="0/1"

DEPEND=""

RDEPEND="${DEPEND}"

S="${WORKDIR}/indi-3rdparty-${PV}/${PN}"
