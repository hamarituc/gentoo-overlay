Personal Gentoo Overlay of `hamari`
===================================

This Gentoo Portage Overlays contains a selection of packages meeting my
personal interests.


Amateur Radio :radio:
---------------------

### CHIRP

CHIRP is a tool to program memory channels and configure settings of amateur
radio devices. CHIRP was dropped from the Gentoo repository due to lacking
Python 3 support. This repo represents the merge of the upstream Python 2
branch as of 2021-08-12 into the upstreams Python 3 branch combined with
patches from [atpage](https://github.com/atpage/chirp). In contains some
further patches by myself. THIS SOFRWARE COMES WITH ABSOLUTELY NOT WARRANTY.

Acknowledgements: The ebuild is on the work of the Pentoo project. Patches of
  [atpage](https://github.com/atpage/chirp) are applied.

### CQRLOG

A logging program.

### Fldigi Suite

The Fldigi suite by Dave Freese, W1HKJ is a well known set of handy amateur
radio utilities. Some of these programs are included in the gentoo standard
repository. This repo provides the remaining utilities. The ebuilds from this
repo provide the `xmlrpc` USE flag. But it seems support for this library is
broken, since some tools require a more recent version than publicly available.

### SDRangel

A very powerful signal analyzer and synthesizer supporting a wide range of
hardware devices.

Acknowledgement: These ebuild are based on the work of
 * [AlexandreFournier](https://github.com/AlexandreFournier/gentoo-overlay)
 * Pentoo

### QSSTV

Although QSSTV is contained in the standard repo it mandatorily requires
pulseaudio. This package allows to substitute pulseaudio with apulse.


Astronomy :telescope:
---------------------

### INDI

The repo contains a recent version of INDI including all 3rd-party drivers.

Acknowledgement: These ebuilds are based on the work of Ctibor Brančík whose
repo disappeared unfortunately.

### Siril

Siril is an astronomical image processing software. This repo also contains
needed dependencies which are not available from the standard repo.

Acknowledgement: These ebuild are based on the work of
 * Ctibor Brančík
 * [SFtech](https://github.com/SFTtech/gentoo-overlay)

### STRF

STRF is a satellite tracking and orbit determination program. Orbit
determination is based on radio measurements.


Computer Forensics, Reverse engineering :mag:
---------------------------------------------

### iaito

It's a graphical frontend for radare2, which is available in the main gentoo
portage tree.
