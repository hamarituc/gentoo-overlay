# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1

DESCRIPTION="Python bindings to libpostal"
HOMEPAGE="
	https://github.com/openvenues/pypostal
	https://pypi.org/project/pypostal/
"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/openvenues/pypostal.git"
else
	SRC_URI="https://github.com/openvenues/pypostal/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"

DOCS=( README.md )

RDEPEND="
	dev-libs/libpostal:=
"
