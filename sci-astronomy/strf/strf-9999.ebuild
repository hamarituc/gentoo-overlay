# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Radio Frequency Satellite Tracking"
HOMEPAGE="https://github.com/cbassa/strf"
EGIT_REPO_URI="https://github.com/cbassa/strf.git"
EGIT_CHECKOUT_DIR="${WORKDIR}/${P}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""

DEPEND="
	sci-libs/fftw:3.0=
	sci-libs/gsl
	sci-libs/pgplot
"
RDEPEND="${DEPEND}"
BDEPEND="virtual/fortran"

src_install() {
	dobin rfdop
	dobin rfedit
	dobin rffft
	dobin rffind
	dobin rffit
	dobin rfplot
	dobin rfpng
}
