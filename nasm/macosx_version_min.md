# GAS (GNU Assembly)[https://stackoverflow.com/questions/4288921/hello-world-using-x86-assembler-on-mac-0sx]

The code in the question looks like it's for 32-bit Linux using the int $0x80 ABI with args in EBX, ECX, EDX.

x86-64 code on MacOS uses the syscall instruction,  
with arg-passing and  
return value  
similar to what's documented in the x86-64 System V ABI for Linux. 

It's completely different from int $0x80,  
the only similarity being that the call number is passed in EAX/RAX.  

But the call numbers are different  
: https://sigsegv.pl/osx-bsd-syscalls/ ORed with 0x2000000.

Args go in the same registers as for function calls.   
(except R10 instead of RCX.)

See also basic assembly not working on Mac (x86_64+Lion)? and How to get this simple assembly to run?

I think this is a lot neater and more intuitive version of what was suggested in another answer.

OS X uses start, not _start, for the process entry point.

```asm
.data
str:
  .ascii "Hello world!\n"
  len = . - str                  # length = start - end.   . = current position

.text
.globl start
start:
    movl   $0x2000004, %eax
    movl   $1, %edi
    leaq   str(%rip), %rsi  
    movq   $len, %rdx          
    syscall                       # write(1, str, len)

    movl   $0x2000001, %eax 
    movl   $0, %edi
    syscall                       # _exit(0)
    
    
    # $ as hello.s -o hello
    # $ ld -macosx_version_min 10.7.0 hello.o -o hello
    
```

Normally you'd omit the operand-size suffix when a register implies it. And use xor %edi,%edi to zero RDI.

And use mov $len, %edx because you know the size is smaller than 4GB so a more efficient 32-bit zero-extended mov-immediate will work, like you're doing to set RAX to the call number.

Notice the use of a RIP-relative LEA to get the address of static data into a register. x86-64 code on MacOS can't use 32-bit absolute addressing because the base address where your executable will be mapped is above 2^32.

There are no relocation types for 32-bit absolute addresses so you can't use them. (And you want RIP-relative, not 64-bit absolute, even though that's also supported.)
