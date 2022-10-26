# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="More than 60 spinners for terminal"
HOMEPAGE="https://github.com/manrajgrover/py-spinners"

if [[ ${PV} = "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/manrajgrover/py-spinners.git"
else
	COMMIT="2592e59c4b409f85588042ec61a965610d4cd70e"
	SRC_URI="https://github.com/manrajgrover/py-spinners/archive/${COMMIT}.tar.gz -> ${P}.gh.tar.gz"
	S="${WORKDIR}/${PN}-${COMMIT}"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"

distutils_enable_tests pytest
