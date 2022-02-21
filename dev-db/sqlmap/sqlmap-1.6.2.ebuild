# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..10} )
PYTHON_REQ_USE="sqlite"

inherit bash-completion-r1 python-single-r1 wrapper

DESCRIPTION="An automatic SQL injection and database takeover tool"
HOMEPAGE="https://github.com/sqlmapproject/sqlmap"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/sqlmapproject/sqlmap"
else
	SRC_URI="https://github.com/sqlmapproject/sqlmap/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="amd64 ~arm64 x86"
fi

LICENSE="GPL-2"
SLOT=0
IUSE="doc"

RDEPEND="${PYTHON_DEPS}"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"


src_prepare() {
	mv doc/ "${T}"/doc || die

	default
}

src_install () {
	dodoc -r \
		README.md \
		$(use doc && echo "${T}/doc/*")

	dodir "/usr/share/${PN}/"
	cp -R * "${ED}/usr/share/${PN}/" || die
	python_optimize "${ED}/usr/share/${PN}"

	make_wrapper "${PN}" \
		"python3 /usr/share/${PN}/sqlmap.py"

	newbashcomp "${FILESDIR}"/sqlmap.bash-completion sqlmap
}
