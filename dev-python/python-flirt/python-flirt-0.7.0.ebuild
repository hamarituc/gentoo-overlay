# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )
DISTUTILS_USE_PEP517=setuptools

CRATES="
	addr2line-0.17.0
	adler-1.0.2
	adler32-1.2.0
	aho-corasick-0.5.3
	aho-corasick-0.7.19
	android_system_properties-0.1.5
	ansi_term-0.12.1
	anyhow-1.0.64
	atty-0.2.14
	autocfg-1.1.0
	backtrace-0.3.66
	better-panic-0.3.0
	bitflags-0.8.2
	bitflags-1.3.2
	bitvec-1.0.1
	bstr-0.2.17
	build-helper-0.1.1
	bumpalo-3.11.0
	byteorder-1.4.3
	cast-0.3.0
	cc-1.0.73
	cfg-if-0.1.10
	cfg-if-1.0.0
	chrono-0.4.22
	clap-2.34.0
	clap-3.2.20
	clap_lex-0.2.4
	cmake-0.1.48
	console-0.15.1
	console_error_panic_hook-0.1.7
	core-foundation-sys-0.8.3
	criterion-0.3.6
	criterion-plot-0.4.5
	crossbeam-channel-0.5.6
	crossbeam-deque-0.8.2
	crossbeam-epoch-0.9.10
	crossbeam-utils-0.8.11
	csv-1.1.6
	csv-core-0.1.10
	dynasm-1.2.3
	dynasmrt-1.2.3
	either-1.8.0
	encode_unicode-0.3.6
	fern-0.6.1
	funty-2.0.0
	gcc-0.3.55
	gimli-0.26.2
	goblin-0.5.4
	half-1.8.2
	hashbrown-0.12.3
	hermit-abi-0.1.19
	hex-0.4.3
	hexyl-0.9.0
	iana-time-zone-0.1.47
	indexmap-1.9.1
	indoc-0.3.6
	indoc-impl-0.3.6
	inflate-0.4.5
	instant-0.1.12
	itertools-0.10.3
	itoa-0.4.8
	itoa-1.0.3
	js-sys-0.3.59
	kernel32-sys-0.2.2
	lazy_static-1.4.0
	libc-0.2.132
	libunicorn-sys-0.8.0
	lock_api-0.4.8
	log-0.4.17
	memchr-0.1.11
	memchr-2.5.0
	memmap2-0.5.7
	memoffset-0.6.5
	memory_units-0.4.0
	minimal-lexical-0.2.1
	miniz_oxide-0.5.4
	nom-7.1.1
	num-integer-0.1.45
	num-traits-0.2.15
	num_cpus-1.13.1
	object-0.29.0
	once_cell-1.14.0
	oorandom-11.1.3
	os_str_bytes-6.3.0
	os_type-0.6.0
	parking_lot-0.11.2
	parking_lot_core-0.8.5
	paste-0.1.18
	paste-impl-0.1.18
	pkg-config-0.3.25
	plain-0.2.3
	plotters-0.3.3
	plotters-backend-0.3.4
	plotters-svg-0.3.3
	proc-macro-error-1.0.4
	proc-macro-error-attr-1.0.4
	proc-macro-hack-0.5.19
	proc-macro2-1.0.43
	pyo3-0.15.2
	pyo3-build-config-0.15.2
	pyo3-macros-0.15.2
	pyo3-macros-backend-0.15.2
	quote-1.0.21
	radium-0.7.0
	rayon-1.5.3
	rayon-core-1.9.3
	redox_syscall-0.2.16
	regex-0.1.80
	regex-1.6.0
	regex-automata-0.1.10
	regex-syntax-0.3.9
	regex-syntax-0.6.27
	rustc-demangle-0.1.21
	ryu-1.0.11
	same-file-1.0.6
	scopeguard-1.1.0
	scroll-0.11.0
	scroll_derive-0.11.0
	semver-0.6.0
	semver-parser-0.7.0
	serde-1.0.144
	serde_cbor-0.11.2
	serde_derive-1.0.144
	serde_json-1.0.85
	smallvec-1.9.0
	smol_str-0.1.23
	strsim-0.8.0
	strsim-0.10.0
	syn-1.0.99
	tap-1.0.1
	term_size-0.3.2
	termcolor-1.1.3
	terminal_size-0.1.17
	textwrap-0.11.0
	textwrap-0.15.0
	thiserror-1.0.34
	thiserror-impl-1.0.34
	thread-id-2.0.0
	thread_local-0.2.7
	time-0.1.44
	tinytemplate-1.2.1
	unicode-ident-1.0.3
	unicode-width-0.1.9
	unicorn-0.8.0
	unindent-0.1.10
	utf8-ranges-0.1.3
	version_check-0.9.4
	walkdir-2.3.2
	wasi-0.10.0+wasi-snapshot-preview1
	wasm-bindgen-0.2.82
	wasm-bindgen-backend-0.2.82
	wasm-bindgen-macro-0.2.82
	wasm-bindgen-macro-support-0.2.82
	wasm-bindgen-shared-0.2.82
	web-sys-0.3.59
	wee_alloc-0.4.5
	widestring-1.0.2
	winapi-0.2.8
	winapi-0.3.9
	winapi-build-0.1.1
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
	wyz-0.5.0
"

#inherit cargo distutils-r1
inherit cargo

DESCRIPTION="A Python library for parsing, compiling, and matching FLIRT signatures"
HOMEPAGE="https://github.com/williballenthin/lancelot/"
SRC_URI="
	https://github.com/williballenthin/lancelot/archive/refs/tags/v${PV}.tar.gz
	$(cargo_crate_uris)
"
S="${WORKDIR}/lancelot-${PV}/pyflirt"

SLOT="0"
LICENSE="(MIT 0BSD Apache 2.0 Apache-2.0 Apache-2.0) Apache-2.0-with-LLVM-exceptions BSD Boost-1.0 GPL-2 MIT MPL-2.0 Unicode-DFS-2016 Unlicense ZLIB"
KEYWORDS="~alpha amd64 arm arm64 hppa ~ia64 ~loong ~m68k ~mips ppc ppc64 ~riscv ~s390 sparc x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~sparc-solaris"

#BDEPEND="
#	dev-python/setuptools-rust[${PYTHON_USEDEP}]
#"

#RDEPEND="
#	$(python_gen_cond_dep '
#		>=dev-python/cffi-1.1:=[${PYTHON_USEDEP}]
#	' 'python*')
#"

# Rust
QA_FLAGS_IGNORED="usr/lib.*/py.*/site-packages/python-flirt/_flirt.*.so"

#distutils_enable_tests pytest
