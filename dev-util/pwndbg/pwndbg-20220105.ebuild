# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{9..10} )

inherit python-single-r1 wrapper

DESCRIPTION="A GDB plug-in that makes debugging with GDB suck less"
HOMEPAGE="https://github.com/pwndbg/pwndbg"

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/pwndbg/pwndbg"
else
	MY_PV="${PV:0:4}.${PV:4:2}.${PV:6:2}"
	SRC_URI="https://github.com/pwndbg/pwndbg/archive/${MY_PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="amd64 x86"
	S="${WORKDIR}/${PN}-${MY_PV}"
fi

LICENSE="MIT"
SLOT="0"

CDEPEND="${PYTHON_DEPS}"
RDEPEND="${CDEPEND}
	sys-devel/gdb[python,${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-libs/capstone[python,${PYTHON_MULTI_USEDEP}]
		dev-python/future[${PYTHON_MULTI_USEDEP}]
		dev-python/isort[${PYTHON_MULTI_USEDEP}]
		dev-python/psutil[${PYTHON_MULTI_USEDEP}]
		dev-python/pycparser[${PYTHON_MULTI_USEDEP}]
		dev-python/pyelftools[${PYTHON_MULTI_USEDEP}]
		dev-python/python-ptrace[${PYTHON_MULTI_USEDEP}]
		dev-python/six[${PYTHON_MULTI_USEDEP}]
		dev-python/pygments[${PYTHON_MULTI_USEDEP}]
		dev-util/ropgadget[${PYTHON_MULTI_USEDEP}]
		dev-util/unicorn[python,unicorn_targets_x86(+),${PYTHON_MULTI_USEDEP}]
	')"

DEPEND="${CDEPEND}"

pkg_setup() {
	python-single-r1_pkg_setup
}

src_prepare() {
	if [[ ${PV} != *9999 ]]; then
		sed -e "s/__version__ = '\(.*\)'/__version__ = '${PV}'/" \
			-i pwndbg/version.py || die
	fi

	python_fix_shebang "${S}"
	default
}

src_install() {
	insinto "/usr/share/${PN}"
	doins -r pwndbg/ gdbinit.py # ida_script.py

	python_optimize "${D}/usr/share/${PN}"

	make_wrapper "pwndbg" \
		"gdb -ex \"source /usr/share/${PN}/gdbinit.py\"" || die

	dodoc {README,DEVELOPING,FEATURES}.md
}

pkg_postinst() {
	einfo "\nUsage:"
	einfo "    ~$ pwndbg <program>"
	ewarn "\nWARNING!!!"
	ewarn "Some pwndbg commands only works with libc debug symbols.\n"
	ewarn "See also:"
	ewarn " * https://github.com/pentoo/pentoo-overlay/issues/521#issuecomment-548975884"
	ewarn " * https://sourceware.org/gdb/onlinedocs/gdb/Separate-Debug-Files.html"
	ewarn " * https://wiki.gentoo.org/wiki/Debugging\n"
}
