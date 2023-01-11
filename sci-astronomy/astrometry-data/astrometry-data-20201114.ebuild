# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Astrometry.net index files"
HOMEPAGE="http://data.astrometry.net/4100/ http://data.astrometry.net/4200/"
SRC_URI="
	astrometry_index_4107? ( http://data.astrometry.net/4100/index-4107.fits -> astrometry-data-index-4107.fits )
	astrometry_index_4108? ( http://data.astrometry.net/4100/index-4108.fits -> astrometry-data-index-4108.fits )
	astrometry_index_4109? ( http://data.astrometry.net/4100/index-4109.fits -> astrometry-data-index-4109.fits )
	astrometry_index_4110? ( http://data.astrometry.net/4100/index-4110.fits -> astrometry-data-index-4110.fits )
	astrometry_index_4111? ( http://data.astrometry.net/4100/index-4111.fits -> astrometry-data-index-4111.fits )
	astrometry_index_4112? ( http://data.astrometry.net/4100/index-4112.fits -> astrometry-data-index-4112.fits )
	astrometry_index_4113? ( http://data.astrometry.net/4100/index-4113.fits -> astrometry-data-index-4113.fits )
	astrometry_index_4114? ( http://data.astrometry.net/4100/index-4114.fits -> astrometry-data-index-4114.fits )
	astrometry_index_4115? ( http://data.astrometry.net/4100/index-4115.fits -> astrometry-data-index-4115.fits )
	astrometry_index_4116? ( http://data.astrometry.net/4100/index-4116.fits -> astrometry-data-index-4116.fits )
	astrometry_index_4117? ( http://data.astrometry.net/4100/index-4117.fits -> astrometry-data-index-4117.fits )
	astrometry_index_4118? ( http://data.astrometry.net/4100/index-4118.fits -> astrometry-data-index-4118.fits )
	astrometry_index_4119? ( http://data.astrometry.net/4100/index-4119.fits -> astrometry-data-index-4119.fits )
	astrometry_index_4200?
	(
		http://data.astrometry.net/4200/index-4200-00.fits -> astrometry-data-index-4200-00.fits
		http://data.astrometry.net/4200/index-4200-01.fits -> astrometry-data-index-4200-01.fits
		http://data.astrometry.net/4200/index-4200-02.fits -> astrometry-data-index-4200-02.fits
		http://data.astrometry.net/4200/index-4200-03.fits -> astrometry-data-index-4200-03.fits
		http://data.astrometry.net/4200/index-4200-04.fits -> astrometry-data-index-4200-04.fits
		http://data.astrometry.net/4200/index-4200-05.fits -> astrometry-data-index-4200-05.fits
		http://data.astrometry.net/4200/index-4200-06.fits -> astrometry-data-index-4200-06.fits
		http://data.astrometry.net/4200/index-4200-07.fits -> astrometry-data-index-4200-07.fits
		http://data.astrometry.net/4200/index-4200-08.fits -> astrometry-data-index-4200-08.fits
		http://data.astrometry.net/4200/index-4200-09.fits -> astrometry-data-index-4200-09.fits
		http://data.astrometry.net/4200/index-4200-10.fits -> astrometry-data-index-4200-10.fits
		http://data.astrometry.net/4200/index-4200-11.fits -> astrometry-data-index-4200-11.fits
		http://data.astrometry.net/4200/index-4200-12.fits -> astrometry-data-index-4200-12.fits
		http://data.astrometry.net/4200/index-4200-13.fits -> astrometry-data-index-4200-13.fits
		http://data.astrometry.net/4200/index-4200-14.fits -> astrometry-data-index-4200-14.fits
		http://data.astrometry.net/4200/index-4200-15.fits -> astrometry-data-index-4200-15.fits
		http://data.astrometry.net/4200/index-4200-16.fits -> astrometry-data-index-4200-16.fits
		http://data.astrometry.net/4200/index-4200-17.fits -> astrometry-data-index-4200-17.fits
		http://data.astrometry.net/4200/index-4200-18.fits -> astrometry-data-index-4200-18.fits
		http://data.astrometry.net/4200/index-4200-19.fits -> astrometry-data-index-4200-19.fits
		http://data.astrometry.net/4200/index-4200-20.fits -> astrometry-data-index-4200-20.fits
		http://data.astrometry.net/4200/index-4200-21.fits -> astrometry-data-index-4200-21.fits
		http://data.astrometry.net/4200/index-4200-22.fits -> astrometry-data-index-4200-22.fits
		http://data.astrometry.net/4200/index-4200-23.fits -> astrometry-data-index-4200-23.fits
		http://data.astrometry.net/4200/index-4200-24.fits -> astrometry-data-index-4200-24.fits
		http://data.astrometry.net/4200/index-4200-25.fits -> astrometry-data-index-4200-25.fits
		http://data.astrometry.net/4200/index-4200-26.fits -> astrometry-data-index-4200-26.fits
		http://data.astrometry.net/4200/index-4200-27.fits -> astrometry-data-index-4200-27.fits
		http://data.astrometry.net/4200/index-4200-28.fits -> astrometry-data-index-4200-28.fits
		http://data.astrometry.net/4200/index-4200-29.fits -> astrometry-data-index-4200-29.fits
		http://data.astrometry.net/4200/index-4200-30.fits -> astrometry-data-index-4200-30.fits
		http://data.astrometry.net/4200/index-4200-31.fits -> astrometry-data-index-4200-31.fits
		http://data.astrometry.net/4200/index-4200-32.fits -> astrometry-data-index-4200-32.fits
		http://data.astrometry.net/4200/index-4200-33.fits -> astrometry-data-index-4200-33.fits
		http://data.astrometry.net/4200/index-4200-34.fits -> astrometry-data-index-4200-34.fits
		http://data.astrometry.net/4200/index-4200-35.fits -> astrometry-data-index-4200-35.fits
		http://data.astrometry.net/4200/index-4200-36.fits -> astrometry-data-index-4200-36.fits
		http://data.astrometry.net/4200/index-4200-37.fits -> astrometry-data-index-4200-37.fits
		http://data.astrometry.net/4200/index-4200-38.fits -> astrometry-data-index-4200-38.fits
		http://data.astrometry.net/4200/index-4200-39.fits -> astrometry-data-index-4200-39.fits
		http://data.astrometry.net/4200/index-4200-40.fits -> astrometry-data-index-4200-40.fits
		http://data.astrometry.net/4200/index-4200-41.fits -> astrometry-data-index-4200-41.fits
		http://data.astrometry.net/4200/index-4200-42.fits -> astrometry-data-index-4200-42.fits
		http://data.astrometry.net/4200/index-4200-43.fits -> astrometry-data-index-4200-43.fits
		http://data.astrometry.net/4200/index-4200-44.fits -> astrometry-data-index-4200-44.fits
		http://data.astrometry.net/4200/index-4200-45.fits -> astrometry-data-index-4200-45.fits
		http://data.astrometry.net/4200/index-4200-46.fits -> astrometry-data-index-4200-46.fits
		http://data.astrometry.net/4200/index-4200-47.fits -> astrometry-data-index-4200-47.fits
	)
	astrometry_index_4201?
	(
		http://data.astrometry.net/4200/index-4201-00.fits -> astrometry-data-index-4201-00.fits
		http://data.astrometry.net/4200/index-4201-01.fits -> astrometry-data-index-4201-01.fits
		http://data.astrometry.net/4200/index-4201-02.fits -> astrometry-data-index-4201-02.fits
		http://data.astrometry.net/4200/index-4201-03.fits -> astrometry-data-index-4201-03.fits
		http://data.astrometry.net/4200/index-4201-04.fits -> astrometry-data-index-4201-04.fits
		http://data.astrometry.net/4200/index-4201-05.fits -> astrometry-data-index-4201-05.fits
		http://data.astrometry.net/4200/index-4201-06.fits -> astrometry-data-index-4201-06.fits
		http://data.astrometry.net/4200/index-4201-07.fits -> astrometry-data-index-4201-07.fits
		http://data.astrometry.net/4200/index-4201-08.fits -> astrometry-data-index-4201-08.fits
		http://data.astrometry.net/4200/index-4201-09.fits -> astrometry-data-index-4201-09.fits
		http://data.astrometry.net/4200/index-4201-10.fits -> astrometry-data-index-4201-10.fits
		http://data.astrometry.net/4200/index-4201-11.fits -> astrometry-data-index-4201-11.fits
		http://data.astrometry.net/4200/index-4201-12.fits -> astrometry-data-index-4201-12.fits
		http://data.astrometry.net/4200/index-4201-13.fits -> astrometry-data-index-4201-13.fits
		http://data.astrometry.net/4200/index-4201-14.fits -> astrometry-data-index-4201-14.fits
		http://data.astrometry.net/4200/index-4201-15.fits -> astrometry-data-index-4201-15.fits
		http://data.astrometry.net/4200/index-4201-16.fits -> astrometry-data-index-4201-16.fits
		http://data.astrometry.net/4200/index-4201-17.fits -> astrometry-data-index-4201-17.fits
		http://data.astrometry.net/4200/index-4201-18.fits -> astrometry-data-index-4201-18.fits
		http://data.astrometry.net/4200/index-4201-19.fits -> astrometry-data-index-4201-19.fits
		http://data.astrometry.net/4200/index-4201-20.fits -> astrometry-data-index-4201-20.fits
		http://data.astrometry.net/4200/index-4201-21.fits -> astrometry-data-index-4201-21.fits
		http://data.astrometry.net/4200/index-4201-22.fits -> astrometry-data-index-4201-22.fits
		http://data.astrometry.net/4200/index-4201-23.fits -> astrometry-data-index-4201-23.fits
		http://data.astrometry.net/4200/index-4201-24.fits -> astrometry-data-index-4201-24.fits
		http://data.astrometry.net/4200/index-4201-25.fits -> astrometry-data-index-4201-25.fits
		http://data.astrometry.net/4200/index-4201-26.fits -> astrometry-data-index-4201-26.fits
		http://data.astrometry.net/4200/index-4201-27.fits -> astrometry-data-index-4201-27.fits
		http://data.astrometry.net/4200/index-4201-28.fits -> astrometry-data-index-4201-28.fits
		http://data.astrometry.net/4200/index-4201-29.fits -> astrometry-data-index-4201-29.fits
		http://data.astrometry.net/4200/index-4201-30.fits -> astrometry-data-index-4201-30.fits
		http://data.astrometry.net/4200/index-4201-31.fits -> astrometry-data-index-4201-31.fits
		http://data.astrometry.net/4200/index-4201-32.fits -> astrometry-data-index-4201-32.fits
		http://data.astrometry.net/4200/index-4201-33.fits -> astrometry-data-index-4201-33.fits
		http://data.astrometry.net/4200/index-4201-34.fits -> astrometry-data-index-4201-34.fits
		http://data.astrometry.net/4200/index-4201-35.fits -> astrometry-data-index-4201-35.fits
		http://data.astrometry.net/4200/index-4201-36.fits -> astrometry-data-index-4201-36.fits
		http://data.astrometry.net/4200/index-4201-37.fits -> astrometry-data-index-4201-37.fits
		http://data.astrometry.net/4200/index-4201-38.fits -> astrometry-data-index-4201-38.fits
		http://data.astrometry.net/4200/index-4201-39.fits -> astrometry-data-index-4201-39.fits
		http://data.astrometry.net/4200/index-4201-40.fits -> astrometry-data-index-4201-40.fits
		http://data.astrometry.net/4200/index-4201-41.fits -> astrometry-data-index-4201-41.fits
		http://data.astrometry.net/4200/index-4201-42.fits -> astrometry-data-index-4201-42.fits
		http://data.astrometry.net/4200/index-4201-43.fits -> astrometry-data-index-4201-43.fits
		http://data.astrometry.net/4200/index-4201-44.fits -> astrometry-data-index-4201-44.fits
		http://data.astrometry.net/4200/index-4201-45.fits -> astrometry-data-index-4201-45.fits
		http://data.astrometry.net/4200/index-4201-46.fits -> astrometry-data-index-4201-46.fits
		http://data.astrometry.net/4200/index-4201-47.fits -> astrometry-data-index-4201-47.fits
	)
	astrometry_index_4202?
	(
		http://data.astrometry.net/4200/index-4202-00.fits -> astrometry-data-index-4202-00.fits
		http://data.astrometry.net/4200/index-4202-01.fits -> astrometry-data-index-4202-01.fits
		http://data.astrometry.net/4200/index-4202-02.fits -> astrometry-data-index-4202-02.fits
		http://data.astrometry.net/4200/index-4202-03.fits -> astrometry-data-index-4202-03.fits
		http://data.astrometry.net/4200/index-4202-04.fits -> astrometry-data-index-4202-04.fits
		http://data.astrometry.net/4200/index-4202-05.fits -> astrometry-data-index-4202-05.fits
		http://data.astrometry.net/4200/index-4202-06.fits -> astrometry-data-index-4202-06.fits
		http://data.astrometry.net/4200/index-4202-07.fits -> astrometry-data-index-4202-07.fits
		http://data.astrometry.net/4200/index-4202-08.fits -> astrometry-data-index-4202-08.fits
		http://data.astrometry.net/4200/index-4202-09.fits -> astrometry-data-index-4202-09.fits
		http://data.astrometry.net/4200/index-4202-10.fits -> astrometry-data-index-4202-10.fits
		http://data.astrometry.net/4200/index-4202-11.fits -> astrometry-data-index-4202-11.fits
		http://data.astrometry.net/4200/index-4202-12.fits -> astrometry-data-index-4202-12.fits
		http://data.astrometry.net/4200/index-4202-13.fits -> astrometry-data-index-4202-13.fits
		http://data.astrometry.net/4200/index-4202-14.fits -> astrometry-data-index-4202-14.fits
		http://data.astrometry.net/4200/index-4202-15.fits -> astrometry-data-index-4202-15.fits
		http://data.astrometry.net/4200/index-4202-16.fits -> astrometry-data-index-4202-16.fits
		http://data.astrometry.net/4200/index-4202-17.fits -> astrometry-data-index-4202-17.fits
		http://data.astrometry.net/4200/index-4202-18.fits -> astrometry-data-index-4202-18.fits
		http://data.astrometry.net/4200/index-4202-19.fits -> astrometry-data-index-4202-19.fits
		http://data.astrometry.net/4200/index-4202-20.fits -> astrometry-data-index-4202-20.fits
		http://data.astrometry.net/4200/index-4202-21.fits -> astrometry-data-index-4202-21.fits
		http://data.astrometry.net/4200/index-4202-22.fits -> astrometry-data-index-4202-22.fits
		http://data.astrometry.net/4200/index-4202-23.fits -> astrometry-data-index-4202-23.fits
		http://data.astrometry.net/4200/index-4202-24.fits -> astrometry-data-index-4202-24.fits
		http://data.astrometry.net/4200/index-4202-25.fits -> astrometry-data-index-4202-25.fits
		http://data.astrometry.net/4200/index-4202-26.fits -> astrometry-data-index-4202-26.fits
		http://data.astrometry.net/4200/index-4202-27.fits -> astrometry-data-index-4202-27.fits
		http://data.astrometry.net/4200/index-4202-28.fits -> astrometry-data-index-4202-28.fits
		http://data.astrometry.net/4200/index-4202-29.fits -> astrometry-data-index-4202-29.fits
		http://data.astrometry.net/4200/index-4202-30.fits -> astrometry-data-index-4202-30.fits
		http://data.astrometry.net/4200/index-4202-31.fits -> astrometry-data-index-4202-31.fits
		http://data.astrometry.net/4200/index-4202-32.fits -> astrometry-data-index-4202-32.fits
		http://data.astrometry.net/4200/index-4202-33.fits -> astrometry-data-index-4202-33.fits
		http://data.astrometry.net/4200/index-4202-34.fits -> astrometry-data-index-4202-34.fits
		http://data.astrometry.net/4200/index-4202-35.fits -> astrometry-data-index-4202-35.fits
		http://data.astrometry.net/4200/index-4202-36.fits -> astrometry-data-index-4202-36.fits
		http://data.astrometry.net/4200/index-4202-37.fits -> astrometry-data-index-4202-37.fits
		http://data.astrometry.net/4200/index-4202-38.fits -> astrometry-data-index-4202-38.fits
		http://data.astrometry.net/4200/index-4202-39.fits -> astrometry-data-index-4202-39.fits
		http://data.astrometry.net/4200/index-4202-40.fits -> astrometry-data-index-4202-40.fits
		http://data.astrometry.net/4200/index-4202-41.fits -> astrometry-data-index-4202-41.fits
		http://data.astrometry.net/4200/index-4202-42.fits -> astrometry-data-index-4202-42.fits
		http://data.astrometry.net/4200/index-4202-43.fits -> astrometry-data-index-4202-43.fits
		http://data.astrometry.net/4200/index-4202-44.fits -> astrometry-data-index-4202-44.fits
		http://data.astrometry.net/4200/index-4202-45.fits -> astrometry-data-index-4202-45.fits
		http://data.astrometry.net/4200/index-4202-46.fits -> astrometry-data-index-4202-46.fits
		http://data.astrometry.net/4200/index-4202-47.fits -> astrometry-data-index-4202-47.fits
	)
	astrometry_index_4203?
	(
		http://data.astrometry.net/4200/index-4203-00.fits -> astrometry-data-index-4203-00.fits
		http://data.astrometry.net/4200/index-4203-01.fits -> astrometry-data-index-4203-01.fits
		http://data.astrometry.net/4200/index-4203-02.fits -> astrometry-data-index-4203-02.fits
		http://data.astrometry.net/4200/index-4203-03.fits -> astrometry-data-index-4203-03.fits
		http://data.astrometry.net/4200/index-4203-04.fits -> astrometry-data-index-4203-04.fits
		http://data.astrometry.net/4200/index-4203-05.fits -> astrometry-data-index-4203-05.fits
		http://data.astrometry.net/4200/index-4203-06.fits -> astrometry-data-index-4203-06.fits
		http://data.astrometry.net/4200/index-4203-07.fits -> astrometry-data-index-4203-07.fits
		http://data.astrometry.net/4200/index-4203-08.fits -> astrometry-data-index-4203-08.fits
		http://data.astrometry.net/4200/index-4203-09.fits -> astrometry-data-index-4203-09.fits
		http://data.astrometry.net/4200/index-4203-10.fits -> astrometry-data-index-4203-10.fits
		http://data.astrometry.net/4200/index-4203-11.fits -> astrometry-data-index-4203-11.fits
		http://data.astrometry.net/4200/index-4203-12.fits -> astrometry-data-index-4203-12.fits
		http://data.astrometry.net/4200/index-4203-13.fits -> astrometry-data-index-4203-13.fits
		http://data.astrometry.net/4200/index-4203-14.fits -> astrometry-data-index-4203-14.fits
		http://data.astrometry.net/4200/index-4203-15.fits -> astrometry-data-index-4203-15.fits
		http://data.astrometry.net/4200/index-4203-16.fits -> astrometry-data-index-4203-16.fits
		http://data.astrometry.net/4200/index-4203-17.fits -> astrometry-data-index-4203-17.fits
		http://data.astrometry.net/4200/index-4203-18.fits -> astrometry-data-index-4203-18.fits
		http://data.astrometry.net/4200/index-4203-19.fits -> astrometry-data-index-4203-19.fits
		http://data.astrometry.net/4200/index-4203-20.fits -> astrometry-data-index-4203-20.fits
		http://data.astrometry.net/4200/index-4203-21.fits -> astrometry-data-index-4203-21.fits
		http://data.astrometry.net/4200/index-4203-22.fits -> astrometry-data-index-4203-22.fits
		http://data.astrometry.net/4200/index-4203-23.fits -> astrometry-data-index-4203-23.fits
		http://data.astrometry.net/4200/index-4203-24.fits -> astrometry-data-index-4203-24.fits
		http://data.astrometry.net/4200/index-4203-25.fits -> astrometry-data-index-4203-25.fits
		http://data.astrometry.net/4200/index-4203-26.fits -> astrometry-data-index-4203-26.fits
		http://data.astrometry.net/4200/index-4203-27.fits -> astrometry-data-index-4203-27.fits
		http://data.astrometry.net/4200/index-4203-28.fits -> astrometry-data-index-4203-28.fits
		http://data.astrometry.net/4200/index-4203-29.fits -> astrometry-data-index-4203-29.fits
		http://data.astrometry.net/4200/index-4203-30.fits -> astrometry-data-index-4203-30.fits
		http://data.astrometry.net/4200/index-4203-31.fits -> astrometry-data-index-4203-31.fits
		http://data.astrometry.net/4200/index-4203-32.fits -> astrometry-data-index-4203-32.fits
		http://data.astrometry.net/4200/index-4203-33.fits -> astrometry-data-index-4203-33.fits
		http://data.astrometry.net/4200/index-4203-34.fits -> astrometry-data-index-4203-34.fits
		http://data.astrometry.net/4200/index-4203-35.fits -> astrometry-data-index-4203-35.fits
		http://data.astrometry.net/4200/index-4203-36.fits -> astrometry-data-index-4203-36.fits
		http://data.astrometry.net/4200/index-4203-37.fits -> astrometry-data-index-4203-37.fits
		http://data.astrometry.net/4200/index-4203-38.fits -> astrometry-data-index-4203-38.fits
		http://data.astrometry.net/4200/index-4203-39.fits -> astrometry-data-index-4203-39.fits
		http://data.astrometry.net/4200/index-4203-40.fits -> astrometry-data-index-4203-40.fits
		http://data.astrometry.net/4200/index-4203-41.fits -> astrometry-data-index-4203-41.fits
		http://data.astrometry.net/4200/index-4203-42.fits -> astrometry-data-index-4203-42.fits
		http://data.astrometry.net/4200/index-4203-43.fits -> astrometry-data-index-4203-43.fits
		http://data.astrometry.net/4200/index-4203-44.fits -> astrometry-data-index-4203-44.fits
		http://data.astrometry.net/4200/index-4203-45.fits -> astrometry-data-index-4203-45.fits
		http://data.astrometry.net/4200/index-4203-46.fits -> astrometry-data-index-4203-46.fits
		http://data.astrometry.net/4200/index-4203-47.fits -> astrometry-data-index-4203-47.fits
	)
	astrometry_index_4204?
	(
		http://data.astrometry.net/4200/index-4204-00.fits -> astrometry-data-index-4204-00.fits
		http://data.astrometry.net/4200/index-4204-01.fits -> astrometry-data-index-4204-01.fits
		http://data.astrometry.net/4200/index-4204-02.fits -> astrometry-data-index-4204-02.fits
		http://data.astrometry.net/4200/index-4204-03.fits -> astrometry-data-index-4204-03.fits
		http://data.astrometry.net/4200/index-4204-04.fits -> astrometry-data-index-4204-04.fits
		http://data.astrometry.net/4200/index-4204-05.fits -> astrometry-data-index-4204-05.fits
		http://data.astrometry.net/4200/index-4204-06.fits -> astrometry-data-index-4204-06.fits
		http://data.astrometry.net/4200/index-4204-07.fits -> astrometry-data-index-4204-07.fits
		http://data.astrometry.net/4200/index-4204-08.fits -> astrometry-data-index-4204-08.fits
		http://data.astrometry.net/4200/index-4204-09.fits -> astrometry-data-index-4204-09.fits
		http://data.astrometry.net/4200/index-4204-10.fits -> astrometry-data-index-4204-10.fits
		http://data.astrometry.net/4200/index-4204-11.fits -> astrometry-data-index-4204-11.fits
		http://data.astrometry.net/4200/index-4204-12.fits -> astrometry-data-index-4204-12.fits
		http://data.astrometry.net/4200/index-4204-13.fits -> astrometry-data-index-4204-13.fits
		http://data.astrometry.net/4200/index-4204-14.fits -> astrometry-data-index-4204-14.fits
		http://data.astrometry.net/4200/index-4204-15.fits -> astrometry-data-index-4204-15.fits
		http://data.astrometry.net/4200/index-4204-16.fits -> astrometry-data-index-4204-16.fits
		http://data.astrometry.net/4200/index-4204-17.fits -> astrometry-data-index-4204-17.fits
		http://data.astrometry.net/4200/index-4204-18.fits -> astrometry-data-index-4204-18.fits
		http://data.astrometry.net/4200/index-4204-19.fits -> astrometry-data-index-4204-19.fits
		http://data.astrometry.net/4200/index-4204-20.fits -> astrometry-data-index-4204-20.fits
		http://data.astrometry.net/4200/index-4204-21.fits -> astrometry-data-index-4204-21.fits
		http://data.astrometry.net/4200/index-4204-22.fits -> astrometry-data-index-4204-22.fits
		http://data.astrometry.net/4200/index-4204-23.fits -> astrometry-data-index-4204-23.fits
		http://data.astrometry.net/4200/index-4204-24.fits -> astrometry-data-index-4204-24.fits
		http://data.astrometry.net/4200/index-4204-25.fits -> astrometry-data-index-4204-25.fits
		http://data.astrometry.net/4200/index-4204-26.fits -> astrometry-data-index-4204-26.fits
		http://data.astrometry.net/4200/index-4204-27.fits -> astrometry-data-index-4204-27.fits
		http://data.astrometry.net/4200/index-4204-28.fits -> astrometry-data-index-4204-28.fits
		http://data.astrometry.net/4200/index-4204-29.fits -> astrometry-data-index-4204-29.fits
		http://data.astrometry.net/4200/index-4204-30.fits -> astrometry-data-index-4204-30.fits
		http://data.astrometry.net/4200/index-4204-31.fits -> astrometry-data-index-4204-31.fits
		http://data.astrometry.net/4200/index-4204-32.fits -> astrometry-data-index-4204-32.fits
		http://data.astrometry.net/4200/index-4204-33.fits -> astrometry-data-index-4204-33.fits
		http://data.astrometry.net/4200/index-4204-34.fits -> astrometry-data-index-4204-34.fits
		http://data.astrometry.net/4200/index-4204-35.fits -> astrometry-data-index-4204-35.fits
		http://data.astrometry.net/4200/index-4204-36.fits -> astrometry-data-index-4204-36.fits
		http://data.astrometry.net/4200/index-4204-37.fits -> astrometry-data-index-4204-37.fits
		http://data.astrometry.net/4200/index-4204-38.fits -> astrometry-data-index-4204-38.fits
		http://data.astrometry.net/4200/index-4204-39.fits -> astrometry-data-index-4204-39.fits
		http://data.astrometry.net/4200/index-4204-40.fits -> astrometry-data-index-4204-40.fits
		http://data.astrometry.net/4200/index-4204-41.fits -> astrometry-data-index-4204-41.fits
		http://data.astrometry.net/4200/index-4204-42.fits -> astrometry-data-index-4204-42.fits
		http://data.astrometry.net/4200/index-4204-43.fits -> astrometry-data-index-4204-43.fits
		http://data.astrometry.net/4200/index-4204-44.fits -> astrometry-data-index-4204-44.fits
		http://data.astrometry.net/4200/index-4204-45.fits -> astrometry-data-index-4204-45.fits
		http://data.astrometry.net/4200/index-4204-46.fits -> astrometry-data-index-4204-46.fits
		http://data.astrometry.net/4200/index-4204-47.fits -> astrometry-data-index-4204-47.fits
	)
	astrometry_index_4205?
	(
		http://data.astrometry.net/4200/index-4205-00.fits -> astrometry-data-index-4205-00.fits
		http://data.astrometry.net/4200/index-4205-01.fits -> astrometry-data-index-4205-01.fits
		http://data.astrometry.net/4200/index-4205-02.fits -> astrometry-data-index-4205-02.fits
		http://data.astrometry.net/4200/index-4205-03.fits -> astrometry-data-index-4205-03.fits
		http://data.astrometry.net/4200/index-4205-04.fits -> astrometry-data-index-4205-04.fits
		http://data.astrometry.net/4200/index-4205-05.fits -> astrometry-data-index-4205-05.fits
		http://data.astrometry.net/4200/index-4205-06.fits -> astrometry-data-index-4205-06.fits
		http://data.astrometry.net/4200/index-4205-07.fits -> astrometry-data-index-4205-07.fits
		http://data.astrometry.net/4200/index-4205-08.fits -> astrometry-data-index-4205-08.fits
		http://data.astrometry.net/4200/index-4205-09.fits -> astrometry-data-index-4205-09.fits
		http://data.astrometry.net/4200/index-4205-10.fits -> astrometry-data-index-4205-10.fits
		http://data.astrometry.net/4200/index-4205-11.fits -> astrometry-data-index-4205-11.fits
	)
	astrometry_index_4206?
	(
		http://data.astrometry.net/4200/index-4206-00.fits -> astrometry-data-index-4206-00.fits
		http://data.astrometry.net/4200/index-4206-01.fits -> astrometry-data-index-4206-01.fits
		http://data.astrometry.net/4200/index-4206-02.fits -> astrometry-data-index-4206-02.fits
		http://data.astrometry.net/4200/index-4206-03.fits -> astrometry-data-index-4206-03.fits
		http://data.astrometry.net/4200/index-4206-04.fits -> astrometry-data-index-4206-04.fits
		http://data.astrometry.net/4200/index-4206-05.fits -> astrometry-data-index-4206-05.fits
		http://data.astrometry.net/4200/index-4206-06.fits -> astrometry-data-index-4206-06.fits
		http://data.astrometry.net/4200/index-4206-07.fits -> astrometry-data-index-4206-07.fits
		http://data.astrometry.net/4200/index-4206-08.fits -> astrometry-data-index-4206-08.fits
		http://data.astrometry.net/4200/index-4206-09.fits -> astrometry-data-index-4206-09.fits
		http://data.astrometry.net/4200/index-4206-10.fits -> astrometry-data-index-4206-10.fits
		http://data.astrometry.net/4200/index-4206-11.fits -> astrometry-data-index-4206-11.fits
	)
	astrometry_index_4207?
	(
		http://data.astrometry.net/4200/index-4207-00.fits -> astrometry-data-index-4207-00.fits
		http://data.astrometry.net/4200/index-4207-01.fits -> astrometry-data-index-4207-01.fits
		http://data.astrometry.net/4200/index-4207-02.fits -> astrometry-data-index-4207-02.fits
		http://data.astrometry.net/4200/index-4207-03.fits -> astrometry-data-index-4207-03.fits
		http://data.astrometry.net/4200/index-4207-04.fits -> astrometry-data-index-4207-04.fits
		http://data.astrometry.net/4200/index-4207-05.fits -> astrometry-data-index-4207-05.fits
		http://data.astrometry.net/4200/index-4207-06.fits -> astrometry-data-index-4207-06.fits
		http://data.astrometry.net/4200/index-4207-07.fits -> astrometry-data-index-4207-07.fits
		http://data.astrometry.net/4200/index-4207-08.fits -> astrometry-data-index-4207-08.fits
		http://data.astrometry.net/4200/index-4207-09.fits -> astrometry-data-index-4207-09.fits
		http://data.astrometry.net/4200/index-4207-10.fits -> astrometry-data-index-4207-10.fits
		http://data.astrometry.net/4200/index-4207-11.fits -> astrometry-data-index-4207-11.fits
	)
	astrometry_index_4208? ( http://data.astrometry.net/4200/index-4208.fits -> astrometry-data-index-4208.fits )
	astrometry_index_4209? ( http://data.astrometry.net/4200/index-4209.fits -> astrometry-data-index-4209.fits )
	astrometry_index_4210? ( http://data.astrometry.net/4200/index-4210.fits -> astrometry-data-index-4210.fits )
	astrometry_index_4211? ( http://data.astrometry.net/4200/index-4211.fits -> astrometry-data-index-4211.fits )
	astrometry_index_4212? ( http://data.astrometry.net/4200/index-4212.fits -> astrometry-data-index-4212.fits )
	astrometry_index_4213? ( http://data.astrometry.net/4200/index-4213.fits -> astrometry-data-index-4213.fits )
	astrometry_index_4214? ( http://data.astrometry.net/4200/index-4214.fits -> astrometry-data-index-4214.fits )
	astrometry_index_4215? ( http://data.astrometry.net/4200/index-4215.fits -> astrometry-data-index-4215.fits )
	astrometry_index_4216? ( http://data.astrometry.net/4200/index-4216.fits -> astrometry-data-index-4216.fits )
	astrometry_index_4217? ( http://data.astrometry.net/4200/index-4217.fits -> astrometry-data-index-4217.fits )
	astrometry_index_4218? ( http://data.astrometry.net/4200/index-4218.fits -> astrometry-data-index-4218.fits )
	astrometry_index_4219? ( http://data.astrometry.net/4200/index-4219.fits -> astrometry-data-index-4219.fits )
	astrometry_index_5200?
	(
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5200-00.fits -> astrometry-data-index-5200-00.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5200-01.fits -> astrometry-data-index-5200-01.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5200-02.fits -> astrometry-data-index-5200-02.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5200-03.fits -> astrometry-data-index-5200-03.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5200-04.fits -> astrometry-data-index-5200-04.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5200-05.fits -> astrometry-data-index-5200-05.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5200-06.fits -> astrometry-data-index-5200-06.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5200-07.fits -> astrometry-data-index-5200-07.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5200-08.fits -> astrometry-data-index-5200-08.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5200-09.fits -> astrometry-data-index-5200-09.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5200-10.fits -> astrometry-data-index-5200-10.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5200-11.fits -> astrometry-data-index-5200-11.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5200-12.fits -> astrometry-data-index-5200-12.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5200-13.fits -> astrometry-data-index-5200-13.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5200-14.fits -> astrometry-data-index-5200-14.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5200-15.fits -> astrometry-data-index-5200-15.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5200-16.fits -> astrometry-data-index-5200-16.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5200-17.fits -> astrometry-data-index-5200-17.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5200-18.fits -> astrometry-data-index-5200-18.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5200-19.fits -> astrometry-data-index-5200-19.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5200-20.fits -> astrometry-data-index-5200-20.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5200-21.fits -> astrometry-data-index-5200-21.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5200-22.fits -> astrometry-data-index-5200-22.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5200-23.fits -> astrometry-data-index-5200-23.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5200-24.fits -> astrometry-data-index-5200-24.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5200-25.fits -> astrometry-data-index-5200-25.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5200-26.fits -> astrometry-data-index-5200-26.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5200-27.fits -> astrometry-data-index-5200-27.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5200-28.fits -> astrometry-data-index-5200-28.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5200-29.fits -> astrometry-data-index-5200-29.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5200-30.fits -> astrometry-data-index-5200-30.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5200-31.fits -> astrometry-data-index-5200-31.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5200-32.fits -> astrometry-data-index-5200-32.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5200-33.fits -> astrometry-data-index-5200-33.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5200-34.fits -> astrometry-data-index-5200-34.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5200-35.fits -> astrometry-data-index-5200-35.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5200-36.fits -> astrometry-data-index-5200-36.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5200-37.fits -> astrometry-data-index-5200-37.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5200-38.fits -> astrometry-data-index-5200-38.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5200-39.fits -> astrometry-data-index-5200-39.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5200-40.fits -> astrometry-data-index-5200-40.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5200-41.fits -> astrometry-data-index-5200-41.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5200-42.fits -> astrometry-data-index-5200-42.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5200-43.fits -> astrometry-data-index-5200-43.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5200-44.fits -> astrometry-data-index-5200-44.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5200-45.fits -> astrometry-data-index-5200-45.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5200-46.fits -> astrometry-data-index-5200-46.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5200-47.fits -> astrometry-data-index-5200-47.fits
	)
	astrometry_index_5201?
	(
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5201-00.fits -> astrometry-data-index-5201-00.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5201-01.fits -> astrometry-data-index-5201-01.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5201-02.fits -> astrometry-data-index-5201-02.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5201-03.fits -> astrometry-data-index-5201-03.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5201-04.fits -> astrometry-data-index-5201-04.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5201-05.fits -> astrometry-data-index-5201-05.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5201-06.fits -> astrometry-data-index-5201-06.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5201-07.fits -> astrometry-data-index-5201-07.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5201-08.fits -> astrometry-data-index-5201-08.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5201-09.fits -> astrometry-data-index-5201-09.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5201-10.fits -> astrometry-data-index-5201-10.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5201-11.fits -> astrometry-data-index-5201-11.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5201-12.fits -> astrometry-data-index-5201-12.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5201-13.fits -> astrometry-data-index-5201-13.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5201-14.fits -> astrometry-data-index-5201-14.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5201-15.fits -> astrometry-data-index-5201-15.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5201-16.fits -> astrometry-data-index-5201-16.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5201-17.fits -> astrometry-data-index-5201-17.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5201-18.fits -> astrometry-data-index-5201-18.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5201-19.fits -> astrometry-data-index-5201-19.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5201-20.fits -> astrometry-data-index-5201-20.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5201-21.fits -> astrometry-data-index-5201-21.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5201-22.fits -> astrometry-data-index-5201-22.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5201-23.fits -> astrometry-data-index-5201-23.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5201-24.fits -> astrometry-data-index-5201-24.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5201-25.fits -> astrometry-data-index-5201-25.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5201-26.fits -> astrometry-data-index-5201-26.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5201-27.fits -> astrometry-data-index-5201-27.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5201-28.fits -> astrometry-data-index-5201-28.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5201-29.fits -> astrometry-data-index-5201-29.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5201-30.fits -> astrometry-data-index-5201-30.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5201-31.fits -> astrometry-data-index-5201-31.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5201-32.fits -> astrometry-data-index-5201-32.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5201-33.fits -> astrometry-data-index-5201-33.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5201-34.fits -> astrometry-data-index-5201-34.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5201-35.fits -> astrometry-data-index-5201-35.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5201-36.fits -> astrometry-data-index-5201-36.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5201-37.fits -> astrometry-data-index-5201-37.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5201-38.fits -> astrometry-data-index-5201-38.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5201-39.fits -> astrometry-data-index-5201-39.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5201-40.fits -> astrometry-data-index-5201-40.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5201-41.fits -> astrometry-data-index-5201-41.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5201-42.fits -> astrometry-data-index-5201-42.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5201-43.fits -> astrometry-data-index-5201-43.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5201-44.fits -> astrometry-data-index-5201-44.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5201-45.fits -> astrometry-data-index-5201-45.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5201-46.fits -> astrometry-data-index-5201-46.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5201-47.fits -> astrometry-data-index-5201-47.fits
	)
	astrometry_index_5202?
	(
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5202-00.fits -> astrometry-data-index-5202-00.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5202-01.fits -> astrometry-data-index-5202-01.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5202-02.fits -> astrometry-data-index-5202-02.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5202-03.fits -> astrometry-data-index-5202-03.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5202-04.fits -> astrometry-data-index-5202-04.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5202-05.fits -> astrometry-data-index-5202-05.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5202-06.fits -> astrometry-data-index-5202-06.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5202-07.fits -> astrometry-data-index-5202-07.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5202-08.fits -> astrometry-data-index-5202-08.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5202-09.fits -> astrometry-data-index-5202-09.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5202-10.fits -> astrometry-data-index-5202-10.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5202-11.fits -> astrometry-data-index-5202-11.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5202-12.fits -> astrometry-data-index-5202-12.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5202-13.fits -> astrometry-data-index-5202-13.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5202-14.fits -> astrometry-data-index-5202-14.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5202-15.fits -> astrometry-data-index-5202-15.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5202-16.fits -> astrometry-data-index-5202-16.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5202-17.fits -> astrometry-data-index-5202-17.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5202-18.fits -> astrometry-data-index-5202-18.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5202-19.fits -> astrometry-data-index-5202-19.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5202-20.fits -> astrometry-data-index-5202-20.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5202-21.fits -> astrometry-data-index-5202-21.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5202-22.fits -> astrometry-data-index-5202-22.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5202-23.fits -> astrometry-data-index-5202-23.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5202-24.fits -> astrometry-data-index-5202-24.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5202-25.fits -> astrometry-data-index-5202-25.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5202-26.fits -> astrometry-data-index-5202-26.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5202-27.fits -> astrometry-data-index-5202-27.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5202-28.fits -> astrometry-data-index-5202-28.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5202-29.fits -> astrometry-data-index-5202-29.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5202-30.fits -> astrometry-data-index-5202-30.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5202-31.fits -> astrometry-data-index-5202-31.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5202-32.fits -> astrometry-data-index-5202-32.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5202-33.fits -> astrometry-data-index-5202-33.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5202-34.fits -> astrometry-data-index-5202-34.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5202-35.fits -> astrometry-data-index-5202-35.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5202-36.fits -> astrometry-data-index-5202-36.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5202-37.fits -> astrometry-data-index-5202-37.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5202-38.fits -> astrometry-data-index-5202-38.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5202-39.fits -> astrometry-data-index-5202-39.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5202-40.fits -> astrometry-data-index-5202-40.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5202-41.fits -> astrometry-data-index-5202-41.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5202-42.fits -> astrometry-data-index-5202-42.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5202-43.fits -> astrometry-data-index-5202-43.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5202-44.fits -> astrometry-data-index-5202-44.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5202-45.fits -> astrometry-data-index-5202-45.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5202-46.fits -> astrometry-data-index-5202-46.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5202-47.fits -> astrometry-data-index-5202-47.fits
	)
	astrometry_index_5203?
	(
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5203-00.fits -> astrometry-data-index-5203-00.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5203-01.fits -> astrometry-data-index-5203-01.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5203-02.fits -> astrometry-data-index-5203-02.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5203-03.fits -> astrometry-data-index-5203-03.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5203-04.fits -> astrometry-data-index-5203-04.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5203-05.fits -> astrometry-data-index-5203-05.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5203-06.fits -> astrometry-data-index-5203-06.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5203-07.fits -> astrometry-data-index-5203-07.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5203-08.fits -> astrometry-data-index-5203-08.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5203-09.fits -> astrometry-data-index-5203-09.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5203-10.fits -> astrometry-data-index-5203-10.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5203-11.fits -> astrometry-data-index-5203-11.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5203-12.fits -> astrometry-data-index-5203-12.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5203-13.fits -> astrometry-data-index-5203-13.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5203-14.fits -> astrometry-data-index-5203-14.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5203-15.fits -> astrometry-data-index-5203-15.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5203-16.fits -> astrometry-data-index-5203-16.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5203-17.fits -> astrometry-data-index-5203-17.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5203-18.fits -> astrometry-data-index-5203-18.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5203-19.fits -> astrometry-data-index-5203-19.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5203-20.fits -> astrometry-data-index-5203-20.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5203-21.fits -> astrometry-data-index-5203-21.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5203-22.fits -> astrometry-data-index-5203-22.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5203-23.fits -> astrometry-data-index-5203-23.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5203-24.fits -> astrometry-data-index-5203-24.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5203-25.fits -> astrometry-data-index-5203-25.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5203-26.fits -> astrometry-data-index-5203-26.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5203-27.fits -> astrometry-data-index-5203-27.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5203-28.fits -> astrometry-data-index-5203-28.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5203-29.fits -> astrometry-data-index-5203-29.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5203-30.fits -> astrometry-data-index-5203-30.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5203-31.fits -> astrometry-data-index-5203-31.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5203-32.fits -> astrometry-data-index-5203-32.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5203-33.fits -> astrometry-data-index-5203-33.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5203-34.fits -> astrometry-data-index-5203-34.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5203-35.fits -> astrometry-data-index-5203-35.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5203-36.fits -> astrometry-data-index-5203-36.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5203-37.fits -> astrometry-data-index-5203-37.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5203-38.fits -> astrometry-data-index-5203-38.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5203-39.fits -> astrometry-data-index-5203-39.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5203-40.fits -> astrometry-data-index-5203-40.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5203-41.fits -> astrometry-data-index-5203-41.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5203-42.fits -> astrometry-data-index-5203-42.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5203-43.fits -> astrometry-data-index-5203-43.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5203-44.fits -> astrometry-data-index-5203-44.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5203-45.fits -> astrometry-data-index-5203-45.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5203-46.fits -> astrometry-data-index-5203-46.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5203-47.fits -> astrometry-data-index-5203-47.fits
	)
	astrometry_index_5204?
	(
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5204-00.fits -> astrometry-data-index-5204-00.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5204-01.fits -> astrometry-data-index-5204-01.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5204-02.fits -> astrometry-data-index-5204-02.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5204-03.fits -> astrometry-data-index-5204-03.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5204-04.fits -> astrometry-data-index-5204-04.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5204-05.fits -> astrometry-data-index-5204-05.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5204-06.fits -> astrometry-data-index-5204-06.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5204-07.fits -> astrometry-data-index-5204-07.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5204-08.fits -> astrometry-data-index-5204-08.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5204-09.fits -> astrometry-data-index-5204-09.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5204-10.fits -> astrometry-data-index-5204-10.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5204-11.fits -> astrometry-data-index-5204-11.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5204-12.fits -> astrometry-data-index-5204-12.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5204-13.fits -> astrometry-data-index-5204-13.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5204-14.fits -> astrometry-data-index-5204-14.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5204-15.fits -> astrometry-data-index-5204-15.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5204-16.fits -> astrometry-data-index-5204-16.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5204-17.fits -> astrometry-data-index-5204-17.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5204-18.fits -> astrometry-data-index-5204-18.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5204-19.fits -> astrometry-data-index-5204-19.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5204-20.fits -> astrometry-data-index-5204-20.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5204-21.fits -> astrometry-data-index-5204-21.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5204-22.fits -> astrometry-data-index-5204-22.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5204-23.fits -> astrometry-data-index-5204-23.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5204-24.fits -> astrometry-data-index-5204-24.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5204-25.fits -> astrometry-data-index-5204-25.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5204-26.fits -> astrometry-data-index-5204-26.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5204-27.fits -> astrometry-data-index-5204-27.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5204-28.fits -> astrometry-data-index-5204-28.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5204-29.fits -> astrometry-data-index-5204-29.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5204-30.fits -> astrometry-data-index-5204-30.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5204-31.fits -> astrometry-data-index-5204-31.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5204-32.fits -> astrometry-data-index-5204-32.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5204-33.fits -> astrometry-data-index-5204-33.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5204-34.fits -> astrometry-data-index-5204-34.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5204-35.fits -> astrometry-data-index-5204-35.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5204-36.fits -> astrometry-data-index-5204-36.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5204-37.fits -> astrometry-data-index-5204-37.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5204-38.fits -> astrometry-data-index-5204-38.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5204-39.fits -> astrometry-data-index-5204-39.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5204-40.fits -> astrometry-data-index-5204-40.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5204-41.fits -> astrometry-data-index-5204-41.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5204-42.fits -> astrometry-data-index-5204-42.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5204-43.fits -> astrometry-data-index-5204-43.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5204-44.fits -> astrometry-data-index-5204-44.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5204-45.fits -> astrometry-data-index-5204-45.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5204-46.fits -> astrometry-data-index-5204-46.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5204-47.fits -> astrometry-data-index-5204-47.fits
	)
	astrometry_index_5205?
	(
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5205-00.fits -> astrometry-data-index-5205-00.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5205-01.fits -> astrometry-data-index-5205-01.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5205-02.fits -> astrometry-data-index-5205-02.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5205-03.fits -> astrometry-data-index-5205-03.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5205-04.fits -> astrometry-data-index-5205-04.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5205-05.fits -> astrometry-data-index-5205-05.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5205-06.fits -> astrometry-data-index-5205-06.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5205-07.fits -> astrometry-data-index-5205-07.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5205-08.fits -> astrometry-data-index-5205-08.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5205-09.fits -> astrometry-data-index-5205-09.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5205-10.fits -> astrometry-data-index-5205-10.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5205-11.fits -> astrometry-data-index-5205-11.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5205-12.fits -> astrometry-data-index-5205-12.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5205-13.fits -> astrometry-data-index-5205-13.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5205-14.fits -> astrometry-data-index-5205-14.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5205-15.fits -> astrometry-data-index-5205-15.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5205-16.fits -> astrometry-data-index-5205-16.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5205-17.fits -> astrometry-data-index-5205-17.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5205-18.fits -> astrometry-data-index-5205-18.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5205-19.fits -> astrometry-data-index-5205-19.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5205-20.fits -> astrometry-data-index-5205-20.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5205-21.fits -> astrometry-data-index-5205-21.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5205-22.fits -> astrometry-data-index-5205-22.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5205-23.fits -> astrometry-data-index-5205-23.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5205-24.fits -> astrometry-data-index-5205-24.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5205-25.fits -> astrometry-data-index-5205-25.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5205-26.fits -> astrometry-data-index-5205-26.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5205-27.fits -> astrometry-data-index-5205-27.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5205-28.fits -> astrometry-data-index-5205-28.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5205-29.fits -> astrometry-data-index-5205-29.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5205-30.fits -> astrometry-data-index-5205-30.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5205-31.fits -> astrometry-data-index-5205-31.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5205-32.fits -> astrometry-data-index-5205-32.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5205-33.fits -> astrometry-data-index-5205-33.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5205-34.fits -> astrometry-data-index-5205-34.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5205-35.fits -> astrometry-data-index-5205-35.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5205-36.fits -> astrometry-data-index-5205-36.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5205-37.fits -> astrometry-data-index-5205-37.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5205-38.fits -> astrometry-data-index-5205-38.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5205-39.fits -> astrometry-data-index-5205-39.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5205-40.fits -> astrometry-data-index-5205-40.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5205-41.fits -> astrometry-data-index-5205-41.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5205-42.fits -> astrometry-data-index-5205-42.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5205-43.fits -> astrometry-data-index-5205-43.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5205-44.fits -> astrometry-data-index-5205-44.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5205-45.fits -> astrometry-data-index-5205-45.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5205-46.fits -> astrometry-data-index-5205-46.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5205-47.fits -> astrometry-data-index-5205-47.fits
	)
	astrometry_index_5206?
	(
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5206-00.fits -> astrometry-data-index-5206-00.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5206-01.fits -> astrometry-data-index-5206-01.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5206-02.fits -> astrometry-data-index-5206-02.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5206-03.fits -> astrometry-data-index-5206-03.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5206-04.fits -> astrometry-data-index-5206-04.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5206-05.fits -> astrometry-data-index-5206-05.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5206-06.fits -> astrometry-data-index-5206-06.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5206-07.fits -> astrometry-data-index-5206-07.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5206-08.fits -> astrometry-data-index-5206-08.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5206-09.fits -> astrometry-data-index-5206-09.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5206-10.fits -> astrometry-data-index-5206-10.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5206-11.fits -> astrometry-data-index-5206-11.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5206-12.fits -> astrometry-data-index-5206-12.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5206-13.fits -> astrometry-data-index-5206-13.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5206-14.fits -> astrometry-data-index-5206-14.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5206-15.fits -> astrometry-data-index-5206-15.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5206-16.fits -> astrometry-data-index-5206-16.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5206-17.fits -> astrometry-data-index-5206-17.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5206-18.fits -> astrometry-data-index-5206-18.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5206-19.fits -> astrometry-data-index-5206-19.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5206-20.fits -> astrometry-data-index-5206-20.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5206-21.fits -> astrometry-data-index-5206-21.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5206-22.fits -> astrometry-data-index-5206-22.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5206-23.fits -> astrometry-data-index-5206-23.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5206-24.fits -> astrometry-data-index-5206-24.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5206-25.fits -> astrometry-data-index-5206-25.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5206-26.fits -> astrometry-data-index-5206-26.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5206-27.fits -> astrometry-data-index-5206-27.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5206-28.fits -> astrometry-data-index-5206-28.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5206-29.fits -> astrometry-data-index-5206-29.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5206-30.fits -> astrometry-data-index-5206-30.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5206-31.fits -> astrometry-data-index-5206-31.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5206-32.fits -> astrometry-data-index-5206-32.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5206-33.fits -> astrometry-data-index-5206-33.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5206-34.fits -> astrometry-data-index-5206-34.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5206-35.fits -> astrometry-data-index-5206-35.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5206-36.fits -> astrometry-data-index-5206-36.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5206-37.fits -> astrometry-data-index-5206-37.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5206-38.fits -> astrometry-data-index-5206-38.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5206-39.fits -> astrometry-data-index-5206-39.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5206-40.fits -> astrometry-data-index-5206-40.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5206-41.fits -> astrometry-data-index-5206-41.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5206-42.fits -> astrometry-data-index-5206-42.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5206-43.fits -> astrometry-data-index-5206-43.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5206-44.fits -> astrometry-data-index-5206-44.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5206-45.fits -> astrometry-data-index-5206-45.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5206-46.fits -> astrometry-data-index-5206-46.fits
		https://portal.nersc.gov/project/cosmo/temp/dstn/index-5200/LITE/index-5206-47.fits -> astrometry-data-index-5206-47.fits
	)
"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE_ASTROMETRY_INDEX="
	4107 4108 4109 4110 4111 4112 4113 4114 4115 4116 4117 4118 4119
	4200 4201 4202 4203 4204 4205 4206 4207 4208 4209 4210 4211 4212 4213 4214 4215 4216 4217 4218 4219
	5200 5201 5202 5203 5204 5205 5206
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
	insinto /usr/share/astrometry
	cd "${DISTDIR}" || die
	for i in astrometry-data-index-*.fits; do
		mv ${i} ${i#astrometry-data-} || die
	done
	doins index-*.fits
}
