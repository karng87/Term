# [LEA Load Effective Address](http://www.c-jump.com/CIS77/reference/ISA/index.html)

### Flags affected:
        O D I T S Z A P C  OF: Overflow flag  TF: Trap flag AF: Aux carry  
        F F F F F F F F F  DF: Direction flag SF: Sign flag PF: Parity flag  
            <none>         IF: Interrupt flag ZF: Zero flag CF: Carry flag  
### Legal forms:
        LEA r16,m<any size>  
        LEA r32,m<any size>  
        
#### Examples:
        LEA EBX,[EAX+EDX*4+128]    ;Loads calculated address into EBX  
        LEA BP,MyWordVar           ;Loads offset of MyWordVar to BP  
#### Notes:
    LEA 
        - derives 
                - the offset of the source operand from the start of its segment and 
                - loads that offset into the destination operand. 
                - The destination operand must be a register and 
                - cannot be memory. 
  
                - The source operand 
                - must be a memory operand, but it can be any size. 
    
                - The address stored in the destination operand 
                - is the address of the first byte of the source in memory, and 
                - the size of the source in memory is unimportant.

#### This is a good, clean way 
  - to place the address of a variable 
    - into a register 
      - prior to a procedure or interrupt call.

#### LEA can also be used 
  - to ***perform register math***, 
  - since the address specified in the second operand 
    - is calculated but not accessed. 
    
  - The address can thus be an address for which your program does not have permission to access. 
    - Any math that can be expressed as a valid address calculation 
      - may be done with LEA.

#### This is one of the few places 
  - where NASM does not require a size specifier 
    - before an operand that gives a memory address, again, 
      - because LEA calculates the address 
        - but moves no data to 
        - or from that address.

        r8 = AL AH BL BH CL CH DL DH        r16 = AX BX CX DX BP SP SI DI  
        sr = CS DS SS ES FS GS              r32 = EAX EBX ECX EDX EBP ESP ESI EDI  
        m8 = 8-bit memory data              m16 = 16-bit memory data  
        m32 = 32-bit memory data            i8 = 8-bit immediate data  
        i16 = 16-bit immediate data         i32 = 32-bit immediate data  
        d8 = 8-bit signed displacement      d16 = 16-bit signed displacement  
        d32 = 32-bit unsigned displacement  
