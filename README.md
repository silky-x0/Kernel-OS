# Kernel-OS
A modern x86 operating system built from scratch using C++ and Assembly.

## Overview
This project aims to create a basic but modern operating system with the following features:
- UEFI-ready bootloader using GRUB
- Protected mode with memory management
- Interrupt handling and device drivers
- User mode with syscalls
- Basic shell interface

## Current Status
- [x] Basic bootloader setup with GRUB multiboot
- [x] Assembly entry point configured
- [x] Initial kernel entry in C++
- [ ] VGA driver implementation
- [ ] GDT and protected mode
- [ ] Interrupt handling

## Building
Requires:
- i686-elf cross-compiler
- GRUB bootloader
- QEMU for testing

Build commands:
```bash
make        # Builds kernel.bin
make install # Installs to /boot (requires sudo)
```

## Project Structure
- `kernel.cpp` - Main kernel implementation
- `loader.s` - Assembly boot code
- `linker.ld` - Kernel linking script
- `Makefile` - Build configuration

## Development Roadmap
See [DEV_PLAN.md](DEV_PLAN.md) for detailed development phases and timeline.

## Collaborators
- Akhilesh ([silky-x0](https://github.com/silky-x0))
- Abdullah Khan ([Aban-01](https://github.com/Aban-01))
- Gaurav Rai ([GauravRai21](https://github.com/GauravRai21))

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

