# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="GDAL plugin to access GRASS data"
HOMEPAGE="https://www.gdal.org/"
SRC_URI="https://github.com/OSGeo/gdal-grass/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="postgres"
RDEPEND="
	>=sci-libs/gdal-3.0.0:=
	sci-geosciences/grass:=
"
DEPEND="
	${RDEPEND}
	postgres? ( dev-db/postgresql )
"

# these drivers are copied at install from the already installed GRASS
QA_PREBUILT="/usr/share/gdal/grass/driver/db/*"

src_configure() {
	local grassp=$(best_version sci-geosciences/grass)
	local grasspv=$(echo ${grassp/%-r[0-9]*/} | rev | cut -d - -f 1 | rev)
	local grasspm=$(ver_cut 1-2 ${grasspv})
	local myeconfargs=(
		--with-grass="/usr/$(get_libdir)/grass$(ver_rs 1 '' ${grasspm})"
		--with-gdal="/usr/bin/gdal-config"
		$(use_with postgres postgres-includes "/usr/include/postgresql")
	)
	econf "${myeconfargs[@]}"
}

src_install() {
	#pass the right variables to 'make install' to prevent a sandbox access violation
	emake DESTDIR="${D}" \
		AUTOLOAD_DIR="/usr/$(get_libdir)/gdalplugins" \
		install
}
