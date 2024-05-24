# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Morse code decoding library"
HOMEPAGE="https://ggmorse.ggerganov.com/"

GGMORSE_COMMIT="55b4aad68a5c1191626b3729d28b80de1a45e8ac"

MY_PV="$(ver_cut 1-3)"

if [[ ${PV} == 9999 ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/ggerganov/ggmorse.git"
else
	SRC_URI="https://github.com/ggerganov/ggmorse/archive/${GGMORSE_COMMIT}.tar.gz -> ${P}.gh.tar.gz"
	KEYWORDS="amd64 x86"
	S="${WORKDIR}/${PN}-${GGMORSE_COMMIT}"
fi

LICENSE="MIT"
SLOT="0"
IUSE="test"

RESTRICT="!test? ( test )"

PATCHES=(
	"${FILESDIR}/${PN}-${MY_PV}-installdir.patch"
	"${FILESDIR}/${PN}-${MY_PV}-headers.patch"
	"${FILESDIR}/${PN}-${MY_PV}-sdrangel.patch"
)

src_configure() {
	local mycmakeargs=(
		-DBUILD_SHARED_LIBS_DEFAULT=ON
		# Examples requires bundled imgui library
		-DGGMORSE_BUILD_EXAMPLES=OFF
		-DGGMORSE_BUILD_TESTS="$(usex test)"
		# only relevant when examples are built
		-DGGMORSE_SUPPORT_SDL2=OFF
	)

	cmake_src_configure
}
