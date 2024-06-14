# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit desktop

DESCRIPTION="A software reverse engineering framework"
HOMEPAGE="https://ghidra-sre.org/"

SRC_URI="https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_${PV}_build/ghidra_${PV}_PUBLIC_20240614.zip"

S="${WORKDIR}/ghidra_${PV}_PUBLIC"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE="doc"

RDEPEND="
	!dev-util/ghidra
	virtual/jre:17
"
DEPEND="
	${RDEPEND}
	app-arch/unzip
"

src_compile()
{
	:
}

src_install()
{
	# remove unnecessary files
	find -type f \( -name "*.bat" -or -name "*.zip" -or -name "*.gz" \) -delete || die

	# icon
	doicon docs/GhidraClass/Beginner/Images/GhidraLogo64.png

	# install docs
	if use doc; then
		pushd docs || die
		dodoc -r *
		popd || die
	fi

	# don't install docs into runtime path
	rm -r docs || die

	# install package
	insinto /usr/share/ghidra
	doins -r *

	for f in `find -type f -executable`; do
		chmod +x "${D}/usr/share/ghidra/${f}" || die
	done

	# executable
	dosym ../share/ghidra/ghidraRun /usr/bin/ghidra

	# desktop entry
	make_desktop_entry ghidra "Ghidra" /usr/share/pixmaps/GhidraLogo64.png "Utility"
}
