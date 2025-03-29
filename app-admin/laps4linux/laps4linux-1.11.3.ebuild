# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..13} )
DISTUTILS_USE_PEP517=setuptools
DISTUTILS_SINGLE_IMPL=1

inherit distutils-r1

MY_PN="LAPS4LINUX"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Local Administrator Password Solution (LAPS) - implementation for Linux"
HOMEPAGE="https://github.com/schorschii/LAPS4LINUX"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/schorschii/LAPS4LINUX.git"
else
	SRC_URI="https://github.com/schorschii/LAPS4LINUX/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
	S="${WORKDIR}/${MY_P}"
fi

LICENSE="GPL-3+"
SLOT="0"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/cryptography-3.1.0[${PYTHON_USEDEP}]
		>=dev-python/dnspython-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/dpapi-ng-0.2.0[${PYTHON_USEDEP}]
		dev-python/gssapi[${PYTHON_USEDEP}]
		>=dev-python/ldap3-2.9.1[${PYTHON_USEDEP}]
		dev-python/pycryptodome[${PYTHON_USEDEP}]
		dev-python/pyqt5[${PYTHON_USEDEP}]
	')
"
DEPEND="${RDEPEND}"

RESTRICT="test"

wrap_python() {
	local BUILD_DIR="${S}/laps-client"
	pushd "laps-client" >/dev/null || die
	distutils-r1_${1} "$@"
	popd >/dev/null

	local BUILD_DIR="${S}/laps-runner"
	pushd "laps-runner" >/dev/null || die
	distutils-r1_${1} "$@"
	popd >/dev/null
}

src_prepare() {
	sed -i -e "s/laps4linux_client/laps_client/g" laps-client/setup.py || die
	sed -i -e "s/laps4linux_runner/laps_runner/g" laps-runner/setup.py || die

	wrap_python ${FUNCNAME}
}

src_configure() {
	wrap_python ${FUNCNAME}
}

src_compile() {
	wrap_python ${FUNCNAME}
}

src_install() {
	wrap_python ${FUNCNAME}
}
