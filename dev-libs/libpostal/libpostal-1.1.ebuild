# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

# Extract from /usr/bin/libpostal_data
DATA_PV="1.0.0"

DESCRIPTION="Parsing/normalizing street addresses around the world"
HOMEPAGE="https://github.com/openvenues/libpostal"
SRC_URI="
	https://github.com/openvenues/libpostal/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	data?
	(
		https://github.com/openvenues/libpostal/releases/download/v${DATA_PV}/parser.tar.gz -> ${PN}-${DATA_PV}-parser.tar.gz
		https://github.com/openvenues/libpostal/releases/download/v${DATA_PV}/libpostal_data.tar.gz -> ${PN}-${DATA_PV}-libpostal_data.tar.gz
		https://github.com/openvenues/libpostal/releases/download/v${DATA_PV}/language_classifier.tar.gz -> ${PN}-${DATA_PV}-language_classifier.tar.gz
	)
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+data static-libs"

RDEPEND="
	net-misc/curl
"
BDEPEND="
	virtual/pkgconfig
"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf --disable-data-download --enable-static=$(use static-libs)
}

src_install() {
	default

	if ! use static-libs; then
		find "${D}" -name "*.la" -delete || die
	fi

	# Extract from /usr/bin/libpostal_data
	if use data; then
		insinto "/usr/share/${PN}"
		doins -r "${WORKDIR}/address_expansions"
		doins -r "${WORKDIR}/address_parser"
		doins -r "${WORKDIR}/language_classifier"
		doins -r "${WORKDIR}/numex"
		doins -r "${WORKDIR}/transliteration"
		echo "v${DATA_PV}" > "${ED}/usr/share/${PN}/base_data_file_version"
		echo "v${DATA_PV}" > "${ED}/usr/share/${PN}/data_version"
		echo "v${DATA_PV}" > "${ED}/usr/share/${PN}/language_classifier_model_file_version"
		echo "v${DATA_PV}" > "${ED}/usr/share/${PN}/parser_model_file_version"
	fi
}
