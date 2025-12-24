# sworkflow

Streamlined Linux Kernel Compilation Tool

sworkflow (sw) is an automated kernel compilation tool designed to streamline the process of compiling the Linux kernel and significantly reduce the overhead involved in setting up the development environment.

## Features

- Device-specific build configurations
- Cross-compiler management for ARM64/ARM32/x86
- Clang/LLVM build support
- DTBO image generation
- AnyKernel3 packaging integration
- Interactive config generation

## Installation

### From Debian Package (Recommended)

Download the latest `.deb` from [Releases](https://github.com/sworkflow-project/sworkflow/releases):

```bash
sudo dpkg -i sworkflow_*.deb
sudo apt-get install -f  # Install dependencies if needed
```

### From Source (User Install)

Installs to `~/.local/` - no root required:

```bash
git clone https://github.com/sworkflow-project/sworkflow.git
cd sworkflow
make install
```

Ensure `~/.local/bin` is in your PATH:

```bash
export PATH="$HOME/.local/bin:$PATH"
```

### From Source (System-wide)

Installs to `/usr/`:

```bash
git clone https://github.com/sworkflow-project/sworkflow.git
cd sworkflow
sudo make install
```

### Uninstall

```bash
make uninstall        # Remove user installation
sudo make uninstall   # Remove system installation
```

## Dependencies

**Required:**
- bash (>= 4.0)
- python3
- git
- make

**Recommended (for kernel building):**
- build-essential
- bc, flex, bison
- libssl-dev, libelf-dev

**Optional:**
- clang (for LLVM builds)
- device-tree-compiler (for DTBO)

## Usage

```bash
sw <command> [device]
```

### Commands

| Command | Description |
|---------|-------------|
| `sw build <device>` | Build kernel for specified device |
| `sw init` | Generate new device configuration |
| `sw help` | Display help message |
| `sw version` | Display version |

### Examples

Build kernel for a device:

```bash
cd /path/to/kernel-source
sw build mainline
```

Generate a new device config:

```bash
sw init
```

### Man Page

After installation, view the full manual:

```bash
man sw
```

## Configuration

Device configurations are stored as shell scripts named `sworkflow.<device>.config`.

**Search order:**
1. `/etc/sworkflow/` (system installation)
2. `~/.local/sw/configs/` (user installation)
3. Current directory
4. `./configs/` subdirectory

### Configuration Variables

| Variable | Description |
|----------|-------------|
| `device_arch` | Target architecture (arm64, x86_64) |
| `kernel_defconfig` | Kernel defconfig file |
| `cross_compile` | Cross-compiler prefix |
| `cross_compile_arm32` | 32-bit ARM cross-compiler |
| `use_clang` | Use Clang/LLVM (set to 1) |
| `do_modules` | Install kernel modules |
| `create_dtbo` | Create DTBO image |
| `do_anykernel` | Package with AnyKernel3 |

See `configs/sworkflow_template.config` for all options.

## Building Debian Package

```bash
sudo apt-get install devscripts debhelper shellcheck
dpkg-buildpackage -us -uc -b
```

The package will be created in the parent directory.

## Development

```bash
make check-scripts  # Run shellcheck
make execute-shfmt  # Format scripts
make test           # Run all tests
make help           # Show all targets
```

## Project Structure

```
sworkflow/
├── sw                 # Main executable
├── src/               # Source modules
├── configs/           # Device configurations
├── utils/             # Python utilities (mkdtboimg.py)
├── man/               # Man pages
├── debian/            # Debian packaging
├── tests/             # Test scripts
└── Makefile           # Build system
```

## License

GPL-3.0-or-later

Copyright (c) 2019 Saalim Quadri

## Contributing

Contributions are welcome! Please check [issues](https://github.com/sworkflow-project/issues/issues) for a good starting point.

## Links

- [Documentation](https://github.com/sworkflow-project/Documentation)
- [Issues](https://github.com/sworkflow-project/issues/issues)
- [Releases](https://github.com/sworkflow-project/sworkflow/releases)
