#!/usr/bin/env bash

#
# SPDX-FileCopyrightText: 2019 Saalim Quadri <danascape@gmail.com>
# SPDX-License-Identifier: GPL-3.0-or-later
#

# Determine installation paths
# Priority: 1) System install 2) User install 3) Local development
if [[ -f '/usr/bin/sw' && -d '/usr/share/sworkflow' ]]; then
	# System-wide installation (Debian package / make install)
	SW_SRC_DIR="/usr/share/sworkflow"
	SW_CONFIG_DIR="/etc/sworkflow"
elif [[ -d "$HOME/.local/share/sworkflow" ]]; then
	# User installation (XDG compliant)
	SW_SRC_DIR="$HOME/.local/share/sworkflow"
	SW_CONFIG_DIR="$HOME/.config/sworkflow"
elif [[ -d "$HOME/.local/sw" ]]; then
	# Legacy user installation (setup.sh)
	SW_SRC_DIR="$HOME/.local/sw"
	SW_CONFIG_DIR="$HOME/.local/sw/configs"
else
	# Local development (running from source)
	SW_SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
	SW_CONFIG_DIR="$SW_SRC_DIR/configs"
fi

export SW_SRC_DIR
export SW_CONFIG_DIR

sw()
{
	argument="$1"

	case "$argument" in
		build | b)
			(
				. "$SW_SRC_DIR"/src/build.sh --source-only

				kernel_build '' "$@"

			)
			;;
		init | i)
			(
				. "$SW_SRC_DIR"/src/init.sh --source-only

				generate_config
			)
			;;
		help | h)
			(
				. "$SW_SRC_DIR"/src/help.sh --source-only

				sworkflow_help
			)
			;;
		man | m)
			(
				. "$SW_SRC_DIR"/src/help.sh --source-only

				sworkflow_help
			)
			;;
		pack | p)
			(
				. "$SW_SRC_DIR"/src/sw_package.sh --source-only

				kernel_package '' "$@"
			)
			;;
		version | v)
			(
				. "$SW_SRC_DIR"/src/version.sh --source-only

				sworkflow_version
			)
			;;
		*)
			(
				. "$SW_SRC_DIR"/src/help.sh --source-only

				sworkflow_help

			)
			;;

	esac
}

sw "$@"
