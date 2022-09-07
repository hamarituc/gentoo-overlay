# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_10 )

inherit distutils-r1 git-r3

DESCRIPTION="A offensive security tool for reconnaissance and vulnerability scanning"
HOMEPAGE="https://github.com/evyatarmeged/Raccoon"
EGIT_REPO_URI="https://github.com/evyatarmeged/Raccoon.git"

LICENSE="MIT"
SLOT="0"

RDEPEND="
	${PYTHON_DEPS}
	dev-python/beautifulsoup4[${PYTHON_USEDEP}]
	dev-python/requests[socks5,${PYTHON_USEDEP}]
	dev-python/dnspython[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]
	dev-python/xmltodict[${PYTHON_USEDEP}]
	dev-python/fake-useragent[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

src_prepare()
{
	default

	sed -e '/    packages=find_packages(exclude="tests"),/d' -i "${S}/setup.py" || die
}
