# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# TODO
# CREATES=""

inherit cargo

DESCRIPTION="Find vulnerable patterns in binary executables"
HOMEPAGE="https://github.com/fkie-cad/cwe_checker"
SRC_URI="
	https://github.com/fkie-cad/cwe_checker/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
"

LICENSE="LGPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
