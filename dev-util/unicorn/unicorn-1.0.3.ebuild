# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PV=${PV/_/-}

DISTUTILS_OPTIONAL=1
PYTHON_COMPAT=( python3_{9..10} )
inherit cmake multilib distutils-r1

DESCRIPTION="A lightweight multi-platform, multi-architecture CPU emulator framework"
HOMEPAGE="http://www.unicorn-engine.org"

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/unicorn-engine/unicorn"
else
	SRC_URI="https://github.com/unicorn-engine/unicorn/archive/${MY_PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="amd64 x86"
fi

LICENSE="GPL-2"
SLOT="0"

IUSE_UNICORN_TARGETS="x86 arm aarch64 mips sparc m68k"

use_unicorn_targets=$(printf ' unicorn_targets_%s' ${IUSE_UNICORN_TARGETS})
IUSE="python ${use_unicorn_targets} static-libs"

REQUIRED_USE="|| ( ${use_unicorn_targets} )
	python? ( ${PYTHON_REQUIRED_USE} )"

DEPEND="dev-libs/glib:2
	virtual/pkgconfig
	${PYTHON_DEPS}"
RDEPEND="python? ( ${PYTHON_DEPS} )"

S="${WORKDIR}/${PN}-${MY_PV}"

wrap_python() {
	if use python; then
		# src_prepare
		# do not compile C extensions
		export LIBUNICORN_PATH=1

		pushd bindings/python >/dev/null || die
		distutils-r1_${1} "$@"
		popd >/dev/null
	fi
}

src_prepare() {
	# build from sources
	rm -r bindings/python/prebuilt || die "failed to remove prebuild"
	cmake_src_prepare
	wrap_python ${FUNCNAME}
}

src_configure(){
	local target
	for target in ${IUSE_UNICORN_TARGETS} ; do
		if use "unicorn_targets_${target}"; then
			unicorn_targets+="${target} "
		fi
	done

	local mycmakeargs=(
		-DBUILD_SHARED_LIBS=OFF
		-DUNICORN_BUILD_SHARED="$(usex static-libs OFF ON)"
		-DUNICORN_ARCH="${unicorn_targets}"
	)
	cmake_src_configure
	wrap_python ${FUNCNAME}
}

src_compile() {
	cmake_src_compile
	wrap_python ${FUNCNAME}
}

src_install() {
	cmake_src_install

	wrap_python ${FUNCNAME}
}
