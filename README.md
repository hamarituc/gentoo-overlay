Personal Gentoo Overlay of `hamari`
===================================

This Gentoo Portage Overlays contains a selection of packages meeting my
personal interests.


Amateur Radio :radio:
---------------------

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


Computer Forensics, Reverse engineering :mag:
---------------------------------------------

### iaito

It's a graphical frontend for radare2, which is available in the main gentoo
portage tree.
