# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..10} )
inherit distutils-r1

DESCRIPTION="CTF framework and exploit development library"
HOMEPAGE="https://github.com/Gallopsled/pwntools"
SRC_URI="https://github.com/Gallopsled/pwntools/archive/${PV/_beta/beta}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/${PN}-${PV/_beta/beta}"

LICENSE="MIT GPL BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	${PYTHON_DEPS}
	>=dev-libs/capstone-3.0.5[python,${PYTHON_USEDEP}]
	>=dev-util/ROPgadget-5.3[${PYTHON_USEDEP}]
	>=dev-util/unicorn-1.0.2[python,${PYTHON_USEDEP}]
	dev-python/colored-traceback[${PYTHON_USEDEP}]
	>=dev-python/intervaltree-3.0[${PYTHON_USEDEP}]
	>=dev-python/mako-1.0.0[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	>=dev-python/paramiko-1.15.2[${PYTHON_USEDEP}]
	>=dev-python/psutil-3.3.0[${PYTHON_USEDEP}]
	>=dev-python/pyelftools-0.2.4[${PYTHON_USEDEP}]
	>=dev-python/pygments-2.0[${PYTHON_USEDEP}]
	>=dev-python/pyserial-2.7[${PYTHON_USEDEP}]
	dev-python/PySocks[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	>=dev-python/requests-2.0[${PYTHON_USEDEP}]
	dev-python/rpyc[${PYTHON_USEDEP}]
	>=dev-python/six-1.12.0[${PYTHON_USEDEP}]
	dev-python/sortedcontainers[${PYTHON_USEDEP}]
"

PATCHES=(
	"${FILESDIR}/${PN}-4.0.0_do_not_mess_with_docs.patch"
	"${FILESDIR}/${PN}-4.1.0_update_deps.patch"
)
