# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Astrometry.net index files"
HOMEPAGE="http://data.astrometry.net/4100/ http://data.astrometry.net/4200/"
SRC_URI="
	astrometry_index_4107? ( http://data.astrometry.net/4100/index-4107.fits )
	astrometry_index_4108? ( http://data.astrometry.net/4100/index-4108.fits )
	astrometry_index_4109? ( http://data.astrometry.net/4100/index-4109.fits )
	astrometry_index_4110? ( http://data.astrometry.net/4100/index-4110.fits )
	astrometry_index_4111? ( http://data.astrometry.net/4100/index-4111.fits )
	astrometry_index_4112? ( http://data.astrometry.net/4100/index-4112.fits )
	astrometry_index_4113? ( http://data.astrometry.net/4100/index-4113.fits )
	astrometry_index_4114? ( http://data.astrometry.net/4100/index-4114.fits )
	astrometry_index_4115? ( http://data.astrometry.net/4100/index-4115.fits )
	astrometry_index_4116? ( http://data.astrometry.net/4100/index-4116.fits )
	astrometry_index_4117? ( http://data.astrometry.net/4100/index-4117.fits )
	astrometry_index_4118? ( http://data.astrometry.net/4100/index-4118.fits )
	astrometry_index_4119? ( http://data.astrometry.net/4100/index-4119.fits )
	astrometry_index_4200?
	(
		http://data.astrometry.net/4200/index-4200-00.fits
		http://data.astrometry.net/4200/index-4200-01.fits
		http://data.astrometry.net/4200/index-4200-02.fits
		http://data.astrometry.net/4200/index-4200-03.fits
		http://data.astrometry.net/4200/index-4200-04.fits
		http://data.astrometry.net/4200/index-4200-05.fits
		http://data.astrometry.net/4200/index-4200-06.fits
		http://data.astrometry.net/4200/index-4200-07.fits
		http://data.astrometry.net/4200/index-4200-08.fits
		http://data.astrometry.net/4200/index-4200-09.fits
		http://data.astrometry.net/4200/index-4200-10.fits
		http://data.astrometry.net/4200/index-4200-11.fits
		http://data.astrometry.net/4200/index-4200-12.fits
		http://data.astrometry.net/4200/index-4200-13.fits
		http://data.astrometry.net/4200/index-4200-14.fits
		http://data.astrometry.net/4200/index-4200-15.fits
		http://data.astrometry.net/4200/index-4200-16.fits
		http://data.astrometry.net/4200/index-4200-17.fits
		http://data.astrometry.net/4200/index-4200-18.fits
		http://data.astrometry.net/4200/index-4200-19.fits
		http://data.astrometry.net/4200/index-4200-20.fits
		http://data.astrometry.net/4200/index-4200-21.fits
		http://data.astrometry.net/4200/index-4200-22.fits
		http://data.astrometry.net/4200/index-4200-23.fits
		http://data.astrometry.net/4200/index-4200-24.fits
		http://data.astrometry.net/4200/index-4200-25.fits
		http://data.astrometry.net/4200/index-4200-26.fits
		http://data.astrometry.net/4200/index-4200-27.fits
		http://data.astrometry.net/4200/index-4200-28.fits
		http://data.astrometry.net/4200/index-4200-29.fits
		http://data.astrometry.net/4200/index-4200-30.fits
		http://data.astrometry.net/4200/index-4200-31.fits
		http://data.astrometry.net/4200/index-4200-32.fits
		http://data.astrometry.net/4200/index-4200-33.fits
		http://data.astrometry.net/4200/index-4200-34.fits
		http://data.astrometry.net/4200/index-4200-35.fits
		http://data.astrometry.net/4200/index-4200-36.fits
		http://data.astrometry.net/4200/index-4200-37.fits
		http://data.astrometry.net/4200/index-4200-38.fits
		http://data.astrometry.net/4200/index-4200-39.fits
		http://data.astrometry.net/4200/index-4200-40.fits
		http://data.astrometry.net/4200/index-4200-41.fits
		http://data.astrometry.net/4200/index-4200-42.fits
		http://data.astrometry.net/4200/index-4200-43.fits
		http://data.astrometry.net/4200/index-4200-44.fits
		http://data.astrometry.net/4200/index-4200-45.fits
		http://data.astrometry.net/4200/index-4200-46.fits
		http://data.astrometry.net/4200/index-4200-47.fits
	)
	astrometry_index_4201?
	(
		http://data.astrometry.net/4200/index-4201-00.fits
		http://data.astrometry.net/4200/index-4201-01.fits
		http://data.astrometry.net/4200/index-4201-02.fits
		http://data.astrometry.net/4200/index-4201-03.fits
		http://data.astrometry.net/4200/index-4201-04.fits
		http://data.astrometry.net/4200/index-4201-05.fits
		http://data.astrometry.net/4200/index-4201-06.fits
		http://data.astrometry.net/4200/index-4201-07.fits
		http://data.astrometry.net/4200/index-4201-08.fits
		http://data.astrometry.net/4200/index-4201-09.fits
		http://data.astrometry.net/4200/index-4201-10.fits
		http://data.astrometry.net/4200/index-4201-11.fits
		http://data.astrometry.net/4200/index-4201-12.fits
		http://data.astrometry.net/4200/index-4201-13.fits
		http://data.astrometry.net/4200/index-4201-14.fits
		http://data.astrometry.net/4200/index-4201-15.fits
		http://data.astrometry.net/4200/index-4201-16.fits
		http://data.astrometry.net/4200/index-4201-17.fits
		http://data.astrometry.net/4200/index-4201-18.fits
		http://data.astrometry.net/4200/index-4201-19.fits
		http://data.astrometry.net/4200/index-4201-20.fits
		http://data.astrometry.net/4200/index-4201-21.fits
		http://data.astrometry.net/4200/index-4201-22.fits
		http://data.astrometry.net/4200/index-4201-23.fits
		http://data.astrometry.net/4200/index-4201-24.fits
		http://data.astrometry.net/4200/index-4201-25.fits
		http://data.astrometry.net/4200/index-4201-26.fits
		http://data.astrometry.net/4200/index-4201-27.fits
		http://data.astrometry.net/4200/index-4201-28.fits
		http://data.astrometry.net/4200/index-4201-29.fits
		http://data.astrometry.net/4200/index-4201-30.fits
		http://data.astrometry.net/4200/index-4201-31.fits
		http://data.astrometry.net/4200/index-4201-32.fits
		http://data.astrometry.net/4200/index-4201-33.fits
		http://data.astrometry.net/4200/index-4201-34.fits
		http://data.astrometry.net/4200/index-4201-35.fits
		http://data.astrometry.net/4200/index-4201-36.fits
		http://data.astrometry.net/4200/index-4201-37.fits
		http://data.astrometry.net/4200/index-4201-38.fits
		http://data.astrometry.net/4200/index-4201-39.fits
		http://data.astrometry.net/4200/index-4201-40.fits
		http://data.astrometry.net/4200/index-4201-41.fits
		http://data.astrometry.net/4200/index-4201-42.fits
		http://data.astrometry.net/4200/index-4201-43.fits
		http://data.astrometry.net/4200/index-4201-44.fits
		http://data.astrometry.net/4200/index-4201-45.fits
		http://data.astrometry.net/4200/index-4201-46.fits
		http://data.astrometry.net/4200/index-4201-47.fits
	)
	astrometry_index_4202?
	(
		http://data.astrometry.net/4200/index-4202-00.fits
		http://data.astrometry.net/4200/index-4202-01.fits
		http://data.astrometry.net/4200/index-4202-02.fits
		http://data.astrometry.net/4200/index-4202-03.fits
		http://data.astrometry.net/4200/index-4202-04.fits
		http://data.astrometry.net/4200/index-4202-05.fits
		http://data.astrometry.net/4200/index-4202-06.fits
		http://data.astrometry.net/4200/index-4202-07.fits
		http://data.astrometry.net/4200/index-4202-08.fits
		http://data.astrometry.net/4200/index-4202-09.fits
		http://data.astrometry.net/4200/index-4202-10.fits
		http://data.astrometry.net/4200/index-4202-11.fits
		http://data.astrometry.net/4200/index-4202-12.fits
		http://data.astrometry.net/4200/index-4202-13.fits
		http://data.astrometry.net/4200/index-4202-14.fits
		http://data.astrometry.net/4200/index-4202-15.fits
		http://data.astrometry.net/4200/index-4202-16.fits
		http://data.astrometry.net/4200/index-4202-17.fits
		http://data.astrometry.net/4200/index-4202-18.fits
		http://data.astrometry.net/4200/index-4202-19.fits
		http://data.astrometry.net/4200/index-4202-20.fits
		http://data.astrometry.net/4200/index-4202-21.fits
		http://data.astrometry.net/4200/index-4202-22.fits
		http://data.astrometry.net/4200/index-4202-23.fits
		http://data.astrometry.net/4200/index-4202-24.fits
		http://data.astrometry.net/4200/index-4202-25.fits
		http://data.astrometry.net/4200/index-4202-26.fits
		http://data.astrometry.net/4200/index-4202-27.fits
		http://data.astrometry.net/4200/index-4202-28.fits
		http://data.astrometry.net/4200/index-4202-29.fits
		http://data.astrometry.net/4200/index-4202-30.fits
		http://data.astrometry.net/4200/index-4202-31.fits
		http://data.astrometry.net/4200/index-4202-32.fits
		http://data.astrometry.net/4200/index-4202-33.fits
		http://data.astrometry.net/4200/index-4202-34.fits
		http://data.astrometry.net/4200/index-4202-35.fits
		http://data.astrometry.net/4200/index-4202-36.fits
		http://data.astrometry.net/4200/index-4202-37.fits
		http://data.astrometry.net/4200/index-4202-38.fits
		http://data.astrometry.net/4200/index-4202-39.fits
		http://data.astrometry.net/4200/index-4202-40.fits
		http://data.astrometry.net/4200/index-4202-41.fits
		http://data.astrometry.net/4200/index-4202-42.fits
		http://data.astrometry.net/4200/index-4202-43.fits
		http://data.astrometry.net/4200/index-4202-44.fits
		http://data.astrometry.net/4200/index-4202-45.fits
		http://data.astrometry.net/4200/index-4202-46.fits
		http://data.astrometry.net/4200/index-4202-47.fits
	)
	astrometry_index_4203?
	(
		http://data.astrometry.net/4200/index-4203-00.fits
		http://data.astrometry.net/4200/index-4203-01.fits
		http://data.astrometry.net/4200/index-4203-02.fits
		http://data.astrometry.net/4200/index-4203-03.fits
		http://data.astrometry.net/4200/index-4203-04.fits
		http://data.astrometry.net/4200/index-4203-05.fits
		http://data.astrometry.net/4200/index-4203-06.fits
		http://data.astrometry.net/4200/index-4203-07.fits
		http://data.astrometry.net/4200/index-4203-08.fits
		http://data.astrometry.net/4200/index-4203-09.fits
		http://data.astrometry.net/4200/index-4203-10.fits
		http://data.astrometry.net/4200/index-4203-11.fits
		http://data.astrometry.net/4200/index-4203-12.fits
		http://data.astrometry.net/4200/index-4203-13.fits
		http://data.astrometry.net/4200/index-4203-14.fits
		http://data.astrometry.net/4200/index-4203-15.fits
		http://data.astrometry.net/4200/index-4203-16.fits
		http://data.astrometry.net/4200/index-4203-17.fits
		http://data.astrometry.net/4200/index-4203-18.fits
		http://data.astrometry.net/4200/index-4203-19.fits
		http://data.astrometry.net/4200/index-4203-20.fits
		http://data.astrometry.net/4200/index-4203-21.fits
		http://data.astrometry.net/4200/index-4203-22.fits
		http://data.astrometry.net/4200/index-4203-23.fits
		http://data.astrometry.net/4200/index-4203-24.fits
		http://data.astrometry.net/4200/index-4203-25.fits
		http://data.astrometry.net/4200/index-4203-26.fits
		http://data.astrometry.net/4200/index-4203-27.fits
		http://data.astrometry.net/4200/index-4203-28.fits
		http://data.astrometry.net/4200/index-4203-29.fits
		http://data.astrometry.net/4200/index-4203-30.fits
		http://data.astrometry.net/4200/index-4203-31.fits
		http://data.astrometry.net/4200/index-4203-32.fits
		http://data.astrometry.net/4200/index-4203-33.fits
		http://data.astrometry.net/4200/index-4203-34.fits
		http://data.astrometry.net/4200/index-4203-35.fits
		http://data.astrometry.net/4200/index-4203-36.fits
		http://data.astrometry.net/4200/index-4203-37.fits
		http://data.astrometry.net/4200/index-4203-38.fits
		http://data.astrometry.net/4200/index-4203-39.fits
		http://data.astrometry.net/4200/index-4203-40.fits
		http://data.astrometry.net/4200/index-4203-41.fits
		http://data.astrometry.net/4200/index-4203-42.fits
		http://data.astrometry.net/4200/index-4203-43.fits
		http://data.astrometry.net/4200/index-4203-44.fits
		http://data.astrometry.net/4200/index-4203-45.fits
		http://data.astrometry.net/4200/index-4203-46.fits
		http://data.astrometry.net/4200/index-4203-47.fits
	)
	astrometry_index_4204?
	(
		http://data.astrometry.net/4200/index-4204-00.fits
		http://data.astrometry.net/4200/index-4204-01.fits
		http://data.astrometry.net/4200/index-4204-02.fits
		http://data.astrometry.net/4200/index-4204-03.fits
		http://data.astrometry.net/4200/index-4204-04.fits
		http://data.astrometry.net/4200/index-4204-05.fits
		http://data.astrometry.net/4200/index-4204-06.fits
		http://data.astrometry.net/4200/index-4204-07.fits
		http://data.astrometry.net/4200/index-4204-08.fits
		http://data.astrometry.net/4200/index-4204-09.fits
		http://data.astrometry.net/4200/index-4204-10.fits
		http://data.astrometry.net/4200/index-4204-11.fits
		http://data.astrometry.net/4200/index-4204-12.fits
		http://data.astrometry.net/4200/index-4204-13.fits
		http://data.astrometry.net/4200/index-4204-14.fits
		http://data.astrometry.net/4200/index-4204-15.fits
		http://data.astrometry.net/4200/index-4204-16.fits
		http://data.astrometry.net/4200/index-4204-17.fits
		http://data.astrometry.net/4200/index-4204-18.fits
		http://data.astrometry.net/4200/index-4204-19.fits
		http://data.astrometry.net/4200/index-4204-20.fits
		http://data.astrometry.net/4200/index-4204-21.fits
		http://data.astrometry.net/4200/index-4204-22.fits
		http://data.astrometry.net/4200/index-4204-23.fits
		http://data.astrometry.net/4200/index-4204-24.fits
		http://data.astrometry.net/4200/index-4204-25.fits
		http://data.astrometry.net/4200/index-4204-26.fits
		http://data.astrometry.net/4200/index-4204-27.fits
		http://data.astrometry.net/4200/index-4204-28.fits
		http://data.astrometry.net/4200/index-4204-29.fits
		http://data.astrometry.net/4200/index-4204-30.fits
		http://data.astrometry.net/4200/index-4204-31.fits
		http://data.astrometry.net/4200/index-4204-32.fits
		http://data.astrometry.net/4200/index-4204-33.fits
		http://data.astrometry.net/4200/index-4204-34.fits
		http://data.astrometry.net/4200/index-4204-35.fits
		http://data.astrometry.net/4200/index-4204-36.fits
		http://data.astrometry.net/4200/index-4204-37.fits
		http://data.astrometry.net/4200/index-4204-38.fits
		http://data.astrometry.net/4200/index-4204-39.fits
		http://data.astrometry.net/4200/index-4204-40.fits
		http://data.astrometry.net/4200/index-4204-41.fits
		http://data.astrometry.net/4200/index-4204-42.fits
		http://data.astrometry.net/4200/index-4204-43.fits
		http://data.astrometry.net/4200/index-4204-44.fits
		http://data.astrometry.net/4200/index-4204-45.fits
		http://data.astrometry.net/4200/index-4204-46.fits
		http://data.astrometry.net/4200/index-4204-47.fits
	)
	astrometry_index_4205?
	(
		http://data.astrometry.net/4200/index-4205-00.fits
		http://data.astrometry.net/4200/index-4205-01.fits
		http://data.astrometry.net/4200/index-4205-02.fits
		http://data.astrometry.net/4200/index-4205-03.fits
		http://data.astrometry.net/4200/index-4205-04.fits
		http://data.astrometry.net/4200/index-4205-05.fits
		http://data.astrometry.net/4200/index-4205-06.fits
		http://data.astrometry.net/4200/index-4205-07.fits
		http://data.astrometry.net/4200/index-4205-08.fits
		http://data.astrometry.net/4200/index-4205-09.fits
		http://data.astrometry.net/4200/index-4205-10.fits
		http://data.astrometry.net/4200/index-4205-11.fits
	)
	astrometry_index_4206?
	(
		http://data.astrometry.net/4200/index-4206-00.fits
		http://data.astrometry.net/4200/index-4206-01.fits
		http://data.astrometry.net/4200/index-4206-02.fits
		http://data.astrometry.net/4200/index-4206-03.fits
		http://data.astrometry.net/4200/index-4206-04.fits
		http://data.astrometry.net/4200/index-4206-05.fits
		http://data.astrometry.net/4200/index-4206-06.fits
		http://data.astrometry.net/4200/index-4206-07.fits
		http://data.astrometry.net/4200/index-4206-08.fits
		http://data.astrometry.net/4200/index-4206-09.fits
		http://data.astrometry.net/4200/index-4206-10.fits
		http://data.astrometry.net/4200/index-4206-11.fits
	)
	astrometry_index_4207?
	(
		http://data.astrometry.net/4200/index-4207-00.fits
		http://data.astrometry.net/4200/index-4207-01.fits
		http://data.astrometry.net/4200/index-4207-02.fits
		http://data.astrometry.net/4200/index-4207-03.fits
		http://data.astrometry.net/4200/index-4207-04.fits
		http://data.astrometry.net/4200/index-4207-05.fits
		http://data.astrometry.net/4200/index-4207-06.fits
		http://data.astrometry.net/4200/index-4207-07.fits
		http://data.astrometry.net/4200/index-4207-08.fits
		http://data.astrometry.net/4200/index-4207-09.fits
		http://data.astrometry.net/4200/index-4207-10.fits
		http://data.astrometry.net/4200/index-4207-11.fits
	)
	astrometry_index_4208? ( http://data.astrometry.net/4200/index-4208.fits )
	astrometry_index_4209? ( http://data.astrometry.net/4200/index-4209.fits )
	astrometry_index_4210? ( http://data.astrometry.net/4200/index-4210.fits )
	astrometry_index_4211? ( http://data.astrometry.net/4200/index-4211.fits )
	astrometry_index_4212? ( http://data.astrometry.net/4200/index-4212.fits )
	astrometry_index_4213? ( http://data.astrometry.net/4200/index-4213.fits )
	astrometry_index_4214? ( http://data.astrometry.net/4200/index-4214.fits )
	astrometry_index_4215? ( http://data.astrometry.net/4200/index-4215.fits )
	astrometry_index_4216? ( http://data.astrometry.net/4200/index-4216.fits )
	astrometry_index_4217? ( http://data.astrometry.net/4200/index-4217.fits )
	astrometry_index_4218? ( http://data.astrometry.net/4200/index-4218.fits )
	astrometry_index_4219? ( http://data.astrometry.net/4200/index-4219.fits )
"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86"

IUSE_ASTROMETRY_INDEX="
	4107 4108 4109 4110 4111 4112 4113 4114 4115 4116 4117 4118 4119
	4200 4201 4202 4203 4204 4205 4206 4207 4208 4209 4210 4211 4212 4213 4214 4215 4216 4217 4218 4219
"

use_astrometry_index=$(printf ' astrometry_index_%s' ${IUSE_ASTROMETRY_INDEX})
IUSE="${use_astrometry_index}"

DEPEND="sci-astronomy/astrometry"
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_unpack()
{
	return
}

src_install()
{
	dodir /usr/share/astrometry
	insinto /usr/share/astrometry
	cd ${DISTDIR} || die
	doins index-*.fits
}
