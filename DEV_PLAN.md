# x86 OS Development Plan

A phased guide to building a modern x86 OS in C++.

**Key Features**: UEFI-ready, RAII drivers, SYSCALL/SYSRET, multitasking.

## 📅 Timeline
| Phase     |                     | Focus Area          |
|-----------|---------------------|---------------------|
| 1         | Bootloader          | GRUB, Cross-compiler|
| 2         | VGA Driver          | Text output         |
| 3         | GDT                 | Protected mode      |
| 4         | Interrupts          | Keyboard, Timer     |
| 5         | Memory Management   | Paging, Heap        |
| 6         | User Mode           | Syscalls            |
| 7         | Multitasking        | Scheduler, FS       |
| 8         | Shell               | CLI Interface       |

---

## Phase 1: Bootloader & Cross-Compiler Setup (Weeks 1-2)
**Videos**: 1-3  
**Modern Tech**: UEFI-capable GRUB (optional future-proofing)  
**Why**: Establish a reproducible build environment with modern toolchains.

### Tasks:
- Set up `i686-elf-g++` cross-compiler
- Configure GRUB multiboot with `.iso` structure
- Write `kernel_main.cpp` with assembly entry stub

### Resources:
- [OSDev GCC Cross-Compiler Guide](https://wiki.osdev.org/GCC_Cross-Compiler)
- [GRUB Multiboot Spec](https://www.gnu.org/software/grub/manual/multiboot/)

**Deliverable**: QEMU boots to blank screen.

---

## Phase 2: VGA Driver & Debugging (Weeks 3-4)
**Videos**: 4-5  
**Modern Tech**: RAII `VGATerminal` class with ANSI escape codes  
**Why**: Replace C-style VGA code with type-safe C++ and color support.

### Tasks:
- Implement `VGATerminal` with cursor/color management
- Add scrolling and ANSI escape code parser
- Integrate with kernel + QEMU testing harness

### Resources:
- [VGA Hardware in C++ (OSDev)](https://wiki.osdev.org/Text_UI#Printing_Text)

**Milestone**: "Hello OS" in cyan text at top-left corner.

---

## Phase 3: GDT & Protected Mode (Weeks 5-6)
**Videos**: 6-7  
**Modern Tech**: Flat memory model for simpler paging  
**Why**: Segmented memory is obsolete; flat model aligns with modern OS designs.

### Tasks:
- Create `GDTManager` class with descriptors
- Implement assembly linkage (`lgdt`, far jump)
- Validate via QEMU monitor (`info registers`)

### Resources:
- [Modern x86 Memory Segmentation](https://wiki.osdev.org/Segmentation)

---

## Phase 4: Interrupts & Drivers (Weeks 7-9)
**Videos**: 8-11  
**Modern Tech**: Template-based `InterruptManager`  
**Why**: Type-safe interrupt handlers reduce boilerplate.

### Tasks:
- IDT setup with C++ callbacks
- PS/2 keyboard driver (scancode → ASCII)
- Programmable Interval Timer (PIT) driver

### Resources:
- [C++ Interrupt Wrappers (OSDev Forums)](https://forum.osdev.org/viewtopic.php?t=35673)

**Milestone**: Display typed keys + timer tick counter.

---

## Phase 5: Paging & Heap (Weeks 10-12)
**Videos**: 12-15  
**Modern Tech**: 4-level paging (PAE optional)  
**Why**: Future-ready for 64-bit extension.

### Tasks:
- Page Frame Allocator bitmap
- Virtual memory manager (`PageTable` class)
- Heap with block coalescing

### Resources:
- [C++ Memory Management Primer](https://www.learncpp.com/cpp-tutorial/dynamic-memory-allocation-with-new-and-delete/)

---

## Phase 6: User Mode & Syscalls (Weeks 13-14)
**Videos**: 16-19  
**Modern Tech**: `SYSCALL/SYSRET` over legacy interrupts  
**Why**: Faster than `int 0x80` on modern CPUs.

### Tasks:
- TSS setup (Task State Segment)
- Syscall gate in assembly
- Userland test program

### Resources:
- [Intel SYSCALL Documentation](https://www.intel.com/content/www/us/en/developer/articles/technical/advanced-performance-extensions-apx-technology.html)

---

## Phase 7: Multitasking & FS (Weeks 15-16)
**Videos**: 20-28  
**Modern Tech**: FAT16 with RAM disk  
**Why**: Balanced complexity for a learning project.

### Tasks:
- Process Control Block (PCB) class
- Context switching with `jmp_buf`
- File system driver (FAT16 in RAM)

### Resources:
- [FAT16 Specification](https://academy.cba.mit.edu/classes/networking_communications/SD/FAT.pdf)

---

## Phase 8: Shell & Optimization (Weeks 17-18)
**Videos**: 29-34  
**Modern Tech**: POSIX-like shell with pipes  
**Why**: Practical endpoint demonstrating OS capabilities.

### Tasks:
- Shell parser (lex/yacc-style)
- `ls`, `cat`, `memstat` commands
- Profiling with QEMU’s `-d` flags

### Resources:
- [Unix Shell in C++ (GitHub Example)](https://github.com/brenns10/lsh)

---

## Modernization Extras
1. **UEFI Boot**: Replace GRUB with GNU-EFI
2. **Rust Interop**: Use `extern "C"` for hybrid components
3. **ACPI**: Implement sleep/wake states

## Critical Resources
- **Debugging**: [QEMU+GDB Guide](https://wiki.osdev.org/Kernel_Debugging)
- **C++**: [Embedded C++ Guidelines](https://isocpp.org/wiki/faq/cpp-embedded)
- **Hardware**: [Intel SDM Vol. 3](https://www.intel.com/content/www/us/en/developer/articles/technical/intel-sdm.html)
