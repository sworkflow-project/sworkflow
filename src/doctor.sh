#!/usr/bin/env bash

#
# Copyright (C) 2019 Saalim Quadri <danascape@gmail.com>
# SPDX-License-Identifier: GPL-3.0-or-later
#

. "$SW_SRC_DIR"/src/sw_functions.sh --source-only

# Find config file for a device
# Search order: 1) SW_CONFIG_DIR 2) Current directory 3) ./configs/
find_config()
{
	local device="$1"
	local config_file="sworkflow.${device}.config"

	if [[ -n "$SW_CONFIG_DIR" && -f "$SW_CONFIG_DIR/$config_file" ]]; then
		echo "$SW_CONFIG_DIR/$config_file"
	elif [[ -f "$(pwd)/$config_file" ]]; then
		echo "$(pwd)/$config_file"
	elif [[ -f "$(pwd)/configs/$config_file" ]]; then
		echo "$(pwd)/configs/$config_file"
	fi
}

# List all available configs (first found wins)
list_available_configs()
{
	local all_configs=""
	local search_dirs=()

	[[ -n "$SW_CONFIG_DIR" && -d "$SW_CONFIG_DIR" ]] && search_dirs+=("$SW_CONFIG_DIR")
	[[ -d "$(pwd)" ]] && search_dirs+=("$(pwd)")
	[[ -d "$(pwd)/configs" ]] && search_dirs+=("$(pwd)/configs")

	for dir in "${search_dirs[@]}"; do
		while IFS= read -r -d '' file; do
			all_configs+="$file"$'\n'
		done < <(find "$dir" -maxdepth 1 -name 'sworkflow.*.config' -print0 2> /dev/null | sort -z)
	done

	echo -n "$all_configs" | awk -F/ '{
		file = $NF
		gsub(/^sworkflow\./, "", file)
		gsub(/\.config$/, "", file)
		if (!seen[file]++) print $0
	}'
}

extract_device_name()
{
	local config_path="$1"
	local filename
	filename=$(basename "$config_path")
	filename="${filename#sworkflow.}"
	filename="${filename%.config}"
	echo "$filename"
}

display_config()
{
	local config_path="$1"
	local device="$2"

	log_info "============================================"
	log_info "Device: $device"
	log_info "Config: $config_path"
	log_info "============================================"

	(
		. "$config_path"

		echo ""
		echo "Architecture:"
		# shellcheck disable=SC2154
		echo "  device_arch=$device_arch"
		[[ -n "$kernel_arch" ]] && echo "  kernel_arch=$kernel_arch"

		echo ""
		echo "Defconfig:"
		# shellcheck disable=SC2154
		echo "  kernel_defconfig=$kernel_defconfig"

		echo ""
		echo "Compiler:"
		[[ -n "$cross_compile" ]] && echo "  cross_compile=$cross_compile"
		[[ -n "$cross_compile_arm32" ]] && echo "  cross_compile_arm32=$cross_compile_arm32"
		[[ -n "$use_clang" ]] && echo "  use_clang=$use_clang"

		echo ""
		echo "Build Options:"
		[[ -n "$build_silent" ]] && echo "  build_silent=$build_silent"
		[[ -n "$build_clean" ]] && echo "  build_clean=$build_clean"
		[[ -n "$do_modules" ]] && echo "  do_modules=$do_modules"
		[[ -n "$create_dist" ]] && echo "  create_dist=$create_dist"
		[[ -n "$kernel_image_name" ]] && echo "  kernel_image_name=$kernel_image_name"

		if [[ -n "$create_dtbo" ]]; then
			echo ""
			echo "DTBO:"
			echo "  create_dtbo=$create_dtbo"
			[[ -n "$dtbo_page_size" ]] && echo "  dtbo_page_size=$dtbo_page_size"
			[[ -n "$dtbo_arch_path" ]] && echo "  dtbo_arch_path=$dtbo_arch_path"
		fi

		if [[ -n "$do_anykernel" ]]; then
			echo ""
			echo "AnyKernel3:"
			echo "  do_anykernel=$do_anykernel"
			[[ -n "$anykernel_branch" ]] && echo "  anykernel_branch=$anykernel_branch"
		fi
	)

	echo ""
}

sworkflow_doctor()
{
	local device="$1"

	echo ""
	log_info "sworkflow doctor"
	log_info "================"
	echo ""

	log_info "Config search paths:"
	echo "  1. $SW_CONFIG_DIR/"
	echo "  2. $(pwd)/"
	echo "  3. $(pwd)/configs/"
	echo ""

	if is_kernel_root "$PWD"; then
		log_info "Kernel tree: Yes"
	else
		log_warnings "Kernel tree: No (not in a kernel source directory)"
	fi
	echo ""

	if [[ -n "$device" ]]; then
		local config_path
		config_path=$(find_config "$device")

		if [[ -n "$config_path" ]]; then
			display_config "$config_path" "$device"
		else
			log_error "error: No config found for device: $device"
			echo ""
			log_info "Available configs:"
			list_available_configs | while read -r cfg; do
				[[ -n "$cfg" ]] && echo "  - $(extract_device_name "$cfg") ($cfg)"
			done
		fi
	else
		log_info "Available configs:"
		local configs_output
		configs_output=$(list_available_configs)

		if [[ -z "$configs_output" ]]; then
			echo "  (none found)"
		else
			while read -r cfg; do
				if [[ -n "$cfg" ]]; then
					local dev
					dev=$(extract_device_name "$cfg")
					echo "  - $dev ($cfg)"
				fi
			done <<< "$configs_output"
		fi

		echo ""
		log_info "Run 'sw doctor <device>' to see detailed config for a specific device."
	fi
}
