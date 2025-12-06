# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit qmake-utils

DESCRIPTION="Desktop application for updating Flipper Zero firmware via PC"
HOMEPAGE="https://update.flipperzero.one/"

LICENSE="GPL-3+"
SLOT="0"

if [[ "${PV}" == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/flipperdevices/qFlipper.git"
else
	KEYWORDS="amd64 x86"
	SRC_URI="https://github.com/flipperdevices/qFlipper/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
	S="${WORKDIR}/qFlipper-${PV}"
fi

RDEPEND="
	>=dev-libs/nanopb-0.4.5[pb-malloc]
	dev-qt/qtbase:6[gui,network,widgets]
	dev-qt/qtdeclarative:6
	dev-qt/qtserialport:6
	virtual/libusb:1
	virtual/zlib:=
"
DEPEND="${RDEPEND}"

PATCHES=(
	"${FILESDIR}/${PN}-1.3.0_unbundle.patch"
	"${FILESDIR}/${PN}-1.3.0_display_version.patch"
	"${FILESDIR}/${PN}-1.3.3-operator.patch"
)

src_configure() {
	eqmake6 qFlipper.pro \
		PREFIX="${EPREFIX}/usr" \
		-spec linux-g++ \
		CONFIG+=qtquickcompiler \
		DEFINES+=DISABLE_APPLICATION_UPDATES \
		INCLUDEPATH+=/usr/include/nanopb
}

src_compile() {
	emake qmake_all # rebuild Makefiles in subdirs
	emake
}

src_install() {
	emake DESTDIR="${D}" INSTALL_ROOT="${ED}" install
}
