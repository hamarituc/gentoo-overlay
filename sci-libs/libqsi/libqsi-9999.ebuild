# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake git-r3 eutils

DESCRIPTION="Driver for the Quantum Scientific Imaging CCDs & Filter Wheels"
HOMEPAGE="http://indilib.org"
EGIT_REPO_URI="https://github.com/indilib/indi-3rdparty.git"
EGIT_CHECKOUT_DIR="${WORKDIR}/${P}"

LICENSE="qsi"
KEYWORDS=""

SLOT="0/1"

DEPEND="dev-embedded/libftdi:1
	~sci-libs/indilib-9999"

RDEPEND="${DEPEND}"

S="${EGIT_CHECKOUT_DIR}/${PN}"
