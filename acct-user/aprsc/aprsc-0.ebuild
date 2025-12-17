# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

DESCRIPTION="User for media-radio/aprsc"

ACCT_USER_GROUPS=( "aprsc" )
ACCT_USER_ID="-1"

acct-user_add_deps
