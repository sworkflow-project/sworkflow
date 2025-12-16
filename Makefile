#
# SPDX-FileCopyrightText: 2019 Saalim Quadri <danascape@gmail.com>
# SPDX-License-Identifier: GPL-3.0-or-later
#

check-scripts:
	while read -r script; do shellcheck --exclude=SC1090,SC1091 $$script; done < tests/files

execute-shfmt:
	while read -r script; do shfmt -ln=bash -fn -ci -sr -w $$script; done < tests/files

.PHONY: check-scripts
