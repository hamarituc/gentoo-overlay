# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit acct-user

DESCRIPTION="User for sci-libs/indilib"

ACCT_USER_GROUPS=( "usb" "uucp" "video" "indiserver" )
ACCT_USER_ID="-1"

acct-user_add_deps
