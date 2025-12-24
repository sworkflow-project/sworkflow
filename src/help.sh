#!/usr/bin/env bash

#
# Copyright (C) 2019 Saalim Quadri <danascape@gmail.com>
# SPDX-License-Identifier: GPL-3.0-or-later
#

sworkflow_help()
{
	echo "Usage: sw [options]"

	echo -e "\nCommands\n" \
		"\tbuild,b - Build Kernel\n" \
		"\tdoctor,d - Show current config for kernel source\n" \
		"\tinit,i - Generate sworkflow config\n" \
		"\thelp,h - Print this help message\n" \
		"\tversion,v - Print version\n"
}
