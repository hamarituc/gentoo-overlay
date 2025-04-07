# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1

DESCRIPTION="An interactive disassembler for x86/ARM/MIPS"
HOMEPAGE="https://github.com/plasma-disassembler/plasma"

if [[ "${PV}" == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/plasma-disassembler/plasma"
	inherit git-r3
else
	MY_COMMIT=432cac6544d5c23b938174da5659a91e7b6c73fb
	SRC_URI="https://github.com/plasma-disassembler/${PN}/archive/${MY_COMMIT}.tar.gz -> ${P}.tar.gz"
	S="${WORKDIR}/plasma-${MY_COMMIT}"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3"
SLOT="0"

DEPEND="
	dev-libs/capstone[python]
	dev-libs/keystone
	dev-python/pyelftools[${PYTHON_USEDEP}]
	dev-python/msgpack[${PYTHON_USEDEP}]
"

RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}/${PN}-remove_pip.patch"
)

RESTRICT="test"
