# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit systemd

DESCRIPTION="APRS-IS server"
HOMEPAGE="https://github.com/hessu/aprsc"
SRC_URI="https://github.com/hessu/aprsc/archive/refs/tags/release/${PV}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/${PN}-release-${PV}/src"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"

DEPEND="
	acct-group/aprsc
	acct-user/aprsc
	dev-libs/libevent:=
	dev-libs/openssl:=
	sys-libs/libcap:=
	virtual/zlib:=
"
RDEPEND="
	${DEPEND}
	dev-perl/JSON-XS
	dev-perl/libwww-perl
"

src_install()
{
	default

	keepdir /opt/aprsc/data
	keepdir /opt/aprsc/logs
	fowners aprsc:aprsc /opt/aprsc/data
	fowners aprsc:aprsc /opt/aprsc/logs

	dodoc "${S}"/../doc/*.md

	newenvd - 99aprsc <<< "CONFIG_PROTECT=\"/opt/aprsc/etc\""

	systemd_dounit "${S}"/debian/*.service
	newinitd "${FILESDIR}/${PN}.init" "${PN}"
	newconfd "${FILESDIR}/${PN}.confd" "${PN}"
}
