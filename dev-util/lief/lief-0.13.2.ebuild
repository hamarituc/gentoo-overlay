# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
DISTUTILS_EXT=1
DISTUTILS_OPTIONAL=1
PYTHON_COMPAT=( python3_{10..12} )

inherit cmake distutils-r1

DESCRIPTION="Library to instrument executable formats"
HOMEPAGE="https://lief.quarkslab.com/"
SRC_URI="https://github.com/lief-project/LIEF/archive/${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/LIEF-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86"

IUSE="examples +python static-libs"

REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

RDEPEND="
	python? ( ${PYTHON_DEPS} )
"
BDEPEND="
	python?
	(
		${PYTHON_DEPS}
		${DISTUTILS_DEPS}
	)
"

RESTRICT="test"

wrap_python() {
	if use python; then
		pushd "./api/python" >/dev/null || die
		distutils-r1_${1} "$@"
		popd >/dev/null
	fi
}

src_prepare() {
	#fix multilib
	sed -i "s|CMAKE_INSTALL_LIBDIR \"lib\"|CMAKE_INSTALL_LIBDIR \"$(get_libdir)\"|" CMakeLists.txt || die

	cmake_src_prepare

	wrap_python ${FUNCNAME}
}

src_configure() {
	local FORCE32=NO
	use x86 && FORCE32=YES

	local PYTHON_API=NO
	use python && PYTHON_API=YES

	local mycmakeargs=(
		-DBUILD_SHARED_LIBS="$(usex static-libs OFF ON)"
		-DLIEF_EXAMPLES="$(usex examples ON OFF)"
		-DLIEF_PYTHON_API="${PYTHON_API}"
		-DLIEF_FORCE32="${FORCE32}"
	)

	cmake_src_configure

	wrap_python ${FUNCNAME}
}

src_compile() {
	cmake_src_compile

	wrap_python ${FUNCNAME}
}

src_test() {
	cmake_src_test

	wrap_python ${FUNCNAME}
}

src_install() {
	cmake_src_install

	wrap_python ${FUNCNAME}
}
