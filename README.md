Personal Gentoo Overlay of `hamari`
===================================

This Gentoo Portage Overlays contains a selection of packages meeting my
personal interests.


Amateur Radio :radio:
---------------------

### ARDOP

The Amateur Radio Digital Open Protocol is an ARQ data transmission protocol
used for the Winlink communication system. This ebuild provides different ARDOP
software modems. Only `ardopc` is supported by Winlink.

### CHIRP

CHIRP is a tool to program memory channels and configure settings of amateur
radio devices. CHIRP was dropped from the Gentoo repository due to lacking
Python 3 support. This repo represents the merge of the upstream Python 2
branch as of 2021-08-12 into the upstreams Python 3 branch combined with
patches from [atpage](https://github.com/atpage/chirp). In contains some
further patches by myself. THIS SOFRWARE COMES WITH ABSOLUTELY NOT WARRANTY.

Acknowledgements: The ebuild is based on the [Pentoo](https://www.pentoo.ch/)
  Project. Patches of [atpage](https://github.com/atpage/chirp) are applied.

### CQRLOG

A logging program.

### GPS SDR SIM

Generates GPS baseband signals for various SDR transceivers.

### Fldigi Suite

The Fldigi suite by Dave Freese, W1HKJ is a well known set of handy amateur
radio utilities. Some of these programs are included in the gentoo standard
repository. This repo provides the remaining utilities. The ebuilds from this
repo provide the `xmlrpc` USE flag. But it seems support for this library is
broken, since some tools require a more recent version than publicly available.

### lbgpsdo

This is a small tool I wrote to configure the Leo Bodnar GPSDO.

### Pat

Pat is a Winlink 2000 protocol client.

### SDRangel

A very powerful signal analyzer and synthesizer supporting a wide range of
hardware devices.

Acknowledgement: These ebuild are based on the work of
 * [AlexandreFournier](https://github.com/AlexandreFournier/gentoo-overlay)
 * [Pentoo](https://www.pentoo.ch/).

### Xnecview

Xnecview is a software for visualizing the input and output files of the NEC
antenna simulation software.


Astronomy :telescope:
---------------------

### Astrometry.net

Astrometry.net create astrometrical solutions of astronomical images by
matching star patterns.

Acknowledgement: The ebuild is based on the
  [benzene-overlay](https://github.com/Universebenzene/benzene-overlay)
  overlay.

### Astropy

A feature rich astronomical package for Python.

### INDI

The repo contains a recent version of INDI including all 3rd-party drivers.

Acknowledgement: These ebuilds are based on the work of Ctibor Brančík whose
repo disappeared unfortunately.

### Open Astro Project

This package containts a capture utility for astronomical cameras mainly used
for planetary imaging.

### Skyfield

Skyfield is a python library for various astronomical calculation problems.

### STRF

STRF is a satellite tracking and orbit determination program. Orbit
determination is based on radio measurements.


Computer Forensics, Reverse engineering :mag:
---------------------------------------------

### Ghidra

Citing from https://github.com/NationalSecurityAgency/ghidra:

> Ghidra is a software reverse engineering (SRE) framework created and
> maintained by the National Security Agency Research Directorate. This
> framework includes a suite of full-featured, high-end software analysis tools
> that enable users to analyze compiled code on a variety of platforms
> including Windows, macOS, and Linux. Capabilities include disassembly,
> assembly, decompilation, graphing, and scripting, along with hundreds of
> other features. Ghidra supports a wide variety of processor instruction sets
> and executable formats and can be run in both user-interactive and automated
> modes. Users may also develop their own Ghidra extension components and/or
> scripts using Java or Python.

Acknowledgement: The ebuild is based on the [Pentoo](https://www.pentoo.ch/)
  Project.

### hyx

hyx is a vim-like terminal hex editor.

Acknowledgement: The ebuild is based on the [sft](https://github.com/SFTtech/gentoo-overlay)
  overlay.

### iaito

It's a graphical frontend for radare2, which is available in the main gentoo
portage tree.

### Qiling

Qiling is an advanced binary emulation framework.

### Radare2

Radare2 is a UNIX-like reverse engineering framework and command-line toolset.
This ebuild is based more recent version than found in the gentoo mainline
repo.

### pwntools

Citing from https://github.com/Gallopsled/pwntools:

> Pwntools is a CTF framework and exploit development library. Written in
> Python, it is designed for rapid prototyping and development, and intended to
> make exploit writing as simple as possible.

Acknowledgement: The ebuild is based on the [Pentoo](https://www.pentoo.ch/)
  Project.

### rz-ghidra

rz-ghidra is an integration of the Ghidra decompiler into rizin and cutter.

### Triton

Citing from https://github.com/JonathanSalwan/Triton/:

> Triton is a dynamic binary analysis (DBA) framework. It provides internal
> components like a Dynamic Symbolic Execution (DSE) engine, a dynamic taint
> engine, AST representations of the x86, x86-64, ARM32 and AArch64
> Instructions Set Architecture (ISA), SMT simplification passes, an SMT solver
> interface and, the last but not least, Python bindings. Based on these
> components, you are able to build program analysis tools, automate reverse
> engineering and perform software verification.


Electronic Engineering :electric_plug:
--------------------------------------

### simavr

simavr is an AVR microcontroller simulator. Don't confuse it with simulavr.

### simulavr

simulavr is an AVR microcontroller simulator. Don't confuse it with simavr.


Geographic Data Processing :globe_with_meridians:
-------------------------------------------------

### GDAL-GRASS

GDAL-GRASS is a GDAL-plugin to access GRASS databases. It was part of the
mainline Gentoo repository, but sometimes fell out due to the temporal removal
of `sci-geosciences/grass`.


Miscellaneous :toolbox:
-----------------------

### Desfire Shell

`desfsh` is an interactive untility for accessing Mifare DESFire NFC tags.

### libfreefare

A library on top of `libnfc` for accessing various Mifare NFC tags.

Acknowledgement: The ebuild is based on the [Pentoo](https://www.pentoo.ch/)
  Project.

### net-wireless/proxmark3

Proxmark3 is a RFID/NFC reader, writer, sniffer and emulator.

Acknowledgement: The ebuild is based on the [Pentoo](https://www.pentoo.ch/)
  Project.


Ebuilds made it into `::gentoo` :tada:
======================================

The following ebuilds are now in the Gentoo mainline repository.

 * `app-forensics/volatility3`
 * `app-forensics/yara`
 * `dev-db/sqlmap`
 * `dev-python/filebytes`
 * `dev-python/yara-python`
 * `dev-util/gef`
 * `dev-util/peda`
 * `dev-util/pwndbg`
 * `dev-util/ropper`
 * `dev-util/unicorn`
 * `media-libs/librtprocess`
 * `net-analyzer/termshark`
 * `sci-astronomy/pysiril`
 * `sci-astronomy/siril`
 * `sci-astronomy/sirilic`
