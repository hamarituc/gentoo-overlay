# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )
inherit distutils-r1

DESCRIPTION="Advanced binary emulation framework"
HOMEPAGE="https://qiling.io/"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/qilingframework/${PN}.git"
else
	SRC_URI="https://github.com/qilingframework/qiling/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE="examples"

RDEPEND="
	${PYTHON_DEPS}
	>=dev-libs/capstone-4.0.1[python,${PYTHON_USEDEP}]
	>=dev-libs/keystone-0.9.2[python,${PYTHON_USEDEP}]
	>=dev-util/unicorn-2.0.0_rc7[python,${PYTHON_USEDEP}]
	>=dev-python/gevent-20.9.0[${PYTHON_USEDEP}]
	>=dev-python/multiprocess-0.70.12.2[${PYTHON_USEDEP}]
	>=dev-python/pefile-2022.5.30[${PYTHON_USEDEP}]
	>=dev-python/pyelftools-0.28[${PYTHON_USEDEP}]
	>=dev-python/python-registry-1.3.1[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
"

python_install_all() {
	distutils-r1_python_install_all

	if use examples; then
		insinto /usr/share/${PN}
		doins -r ${S}/examples
	fi
}
