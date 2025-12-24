#!/usr/bin/env bash

#
# SPDX-FileCopyrightText: 2019 Saalim Quadri <danascape@gmail.com>
# SPDX-License-Identifier: GPL-3.0-or-later
#

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

echo "Running ShellCheck"
while read -r script; do
	echo "Checking: $script"
	shellcheck --exclude=SC1090,SC1091 "$PROJECT_ROOT/$script"
done < "$SCRIPT_DIR/files"

echo ""
echo "All tests passed"
