# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="An Observation Geometry System for Space Science Missions"
HOMEPAGE="https://github.com/tudat-team/cspice-cmake"

if [[ ${PV} == "9999" ]]; then
	EGIT_REPO_URI="https://github.com/tudat-team/cspice-cmake.git"
	inherit git-r3
else
	CSPICE_COMMIT=e44da83b8a7a420fdddf02d2e3accebd0ab86e5e
	SRC_URI="https://github.com/tudat-team/cspice-cmake/archive/${CSPICE_COMMIT}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
	S="${WORKDIR}/cspice-cmake-${CSPICE_COMMIT}"
fi

LICENSE="all-rights-reserved"
SLOT="0"

src_configure()
{
	local mycmakeargs=(
		-DCSPICE_BUILD_STATIC_LIBRARY=OFF
	)

	cmake_src_configure
}
