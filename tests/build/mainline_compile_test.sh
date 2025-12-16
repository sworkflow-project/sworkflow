#!/usr/bin/env bash

#
# Copyright (C) 2019 Saalim Quadri <danascape@gmail.com>
# SPDX-License-Identifier: GPL-3.0-or-later
#

clone_kernel()
{
	git clone --depth 1 -b master https://github.com/torvalds/linux linux
}

compile_kernel()
{
	cd linux || exit 1
	sw b mainline
}

clone_kernel
compile_kernel
