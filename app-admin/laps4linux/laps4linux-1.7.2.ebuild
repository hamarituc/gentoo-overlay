# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
inherit python-single-r1

MY_PN="LAPS4LINUX"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Local Administrator Password Solution (LAPS) - implementation for Linux"
HOMEPAGE="https://github.com/schorschii/LAPS4LINUX"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/schorschii/LAPS4LINUX.git"
else
	SRC_URI="https://github.com/schorschii/LAPS4LINUX/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
	S="${WORKDIR}/${MY_P}"
fi

LICENSE="GPL-3+"
SLOT="0"
IUSE="gui"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
	$(python_gen_cond_dep '
		dev-python/cryptography[${PYTHON_USEDEP}]
		dev-python/dnspython[${PYTHON_USEDEP}]
		>=dev-python/dpapi-ng-0.2.0[${PYTHON_USEDEP}]
		dev-python/gssapi[${PYTHON_USEDEP}]
		dev-python/ldap3[${PYTHON_USEDEP}]
		gui?
		(
			dev-python/PyQt5[${PYTHON_USEDEP}]
		)
		dev-python/pycryptodome[${PYTHON_USEDEP}]
	')
"
DEPEND="${RDEPEND}"
BDEPEND="${RDEPEND}"

src_install()
{
	python_newscript laps-cli.py laps-cli
	if use gui; then
		python_newscript laps-gui.py laps-gui
	fi
	python_newscript laps-runner.py laps-runner
}
