# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )
inherit distutils-r1

DESCRIPTION="Identify capabilities in executable files"
HOMEPAGE="https://github.com/mandiant/capa"
SRC_URI="https://github.com/mandiant/capa/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

# TODO:
#   ida-settings
#   smda
RDEPEND="
	>=dev-python/tqdm-4.64.0[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
	>=dev-python/tabulate-0.8.9[${PYTHON_USEDEP}]
	>=dev-python/colorama-0.4.5[${PYTHON_USEDEP}]
	>=dev-python/termcolor-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/wcwidth-0.2.5[${PYTHON_USEDEP}]
	>=dev-python/networkx-2.5.1[${PYTHON_USEDEP}]
	>=dev-python/ruamel-yaml-0.17.21[${PYTHON_USEDEP}]
	>=dev-python/pefile-2022.5.30[${PYTHON_USEDEP}]
	>=dev-python/pyelftools-0.29[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.9.2[${PYTHON_USEDEP}]
	>=dev-python/halo-0.0.31[${PYTHON_USEDEP}]
	>=dev-python/dnfile-0.12.0[${PYTHON_USEDEP}]
	>=dev-python/dncil-1.0.1[${PYTHON_USEDEP}]
	>=dev-python/vivisect-1.0.8[${PYTHON_USEDEP}]
	>=dev-python/viv-utils-0.7.5[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
