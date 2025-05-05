#Assembler Code

#MUlTIBOOT-HEADER setup            #.set is like defining constant in C using define.

.set MAGIC, 0x1badb002             #it is special value required ny multibooti-specification so bootloader like grub
                                   #which we'll be using, can detect and load our kernel 
.set FLAGS, (1<<0 | 1<<1)          #add comment here if u got this
.set CHECKSUM, -(MAGIC + FLAGS)    #here also

.section .multiboot
    .long MAGIC
    .long FLAGS
    .long CHECKSUM


.section .text      #this declares text/code section where executable instructions go.
.extern kernelMain  #it tells assembler that kernelMain is defined outside(another file).
.global loader      #makes loader label visible(externally) to linker or bootloader

loader:                         #entry point 
    mov $kernel_stack, %esp     #created stack pointer(moves address of kernel_stack into esp register)
    push %eax
    push %ebx
    call kernelMain

_stop:         #this makes sure that if ever our kernel stops cpu cant access random memory and halts CPU safely
    cli        #clear interrupt flag-->disable other hardware interference
    hlt        #Halt cpu until it interrupt but see above interrupt are disabled
    jmp _stop  #jmp = jump, loop back to _stop

.section .bss
.space 2*1024*1024; #2 MiB size

kernel_stack:
