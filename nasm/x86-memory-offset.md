# [8086 ASSEMBLY LANGUAGE](https://www.cs.uregina.ca/Dept/manuals/Manuals/7Language/7_9_8086/7_9Assembly.html)

### 8086 Registers

#### General Registers - These are the registers that are used for general purposes
	AX       accumulator (16 bit)              
	AH       accumulator high-order byte (8 bit)                              
	AL       accumulator low-order byte (8 bit)   

	BX       accumulator (16 bit)              
	BH       accumulator high-order byte (8 bit)                              
	BL       accumulator low-order byte (8 bit)      

	CX       count and accumulator (16 bit)    
	CH       count high order byte (8 bit)     
	CL       count low order byte (8 bit)      

	DX       data and I/O address (16 bit)     
	DH       data high order byte (8 bit)      
	DL       data low order byte (8 bit)       

#### Segment Registers - These registers are use to calculate 20 bit address from 16 bit registers.
	CS       code segment (16 bit)             
	DS       data segment (16 bit)             
	SS       stack segment (16 bit)            
	ES       extra segment (16 bit)            

#### Index Registers - These registers are used with ___the string instructions___.
	DI       destination index (16 bit)        
	SI       source index (16 bit)             

#### Pointers - These registers are used with the segment register to obtain 20 bit addresses
	SP       stack pointer (16 bit)            
	BP       base pointer (16 bit)             
	IP       instruction pointer (16 bit)      
---

### Interrupt (Trap) Vectors
Dos supplies routines for finding and changing interrupt vectors.

#### BIOS DATA AREA Addresses
	ADDR       SIZE       DESCRIPTION                                                
	40:00      WORD       COM1 PORT ADDRESS                                          
	40:02      WORD       COM2 PORT ADDRESS                                          
	40:04      WORD       COM3 PORT ADDRESS                                          
	40:06      WORD       COM4 PORT ADDRESS                                          
	40:08      WORD       LPT1 PORT ADDRESS                                          
	40:0A      WORD       LPT2 PORT ADDRESS                                          
	40:0C      WORD       LPT3 PORT ADDRESS                                          
	40:0E      WORD       LPT4 PORT ADDRESS                                          
	40:10      WORD       EQUIPMENT FLAG (SEE INT 11)                                
	40:13      WORD       MEMORY SIZE IN KBYTES                                      
	40:17      BYTE       KEYBOARD FLAG BYTE 0 (SEE INT 9)                           
	40:18      BYTE       KEYBOARD FLAG BYTE 1 (SEE INT 9                            
	40:19      BYTE       STORAGE FOR ALTERNATE KEYPAD ENTRY                         
	40:1A      WORD       POINTER TO KEYBOARD BUFFER HEAD                            
	40:1C      WORD       POINTER TO KEYBOARD BUFFER TAIL                            
	40:1E      20BYTES    KEYBOARD BUFFER                                            
	40:3E      BYTE       DRIVE RECALIBRATION STATUS                                 
	40:3F      BYTE       MOTOR STATUS                                               
	40:3E      BYTE       DRIVE RECALIBRATION STATUS                                 
	40:3F      BYTE        MOTOR STATUS                                              
	40:40      BYTE       MOTOR OFF COUNTER (DECR. BY TIMER)                         
	40:41      BYTE       STATUS OF LAST DISKETTE OPERATION                          
	40:42      7 BYTES    NEC STATUS                                                 
	40:49      BYTE       CURRENT CRT MODE                                           
	40:4A      WORD       NUMBER OF COLUMNS ON SCREEN                                
	40:4C      WORD       REGEN BUFFER LENGTH IN BYTES                               
	40:4E      WORD       STARTING OFFSET OF REGEN BUFFER                            
	40:50      8 WORDS    CURSOR POSITION PAGES 1-8                                  
	40:60      BYTE       END LINE FOR CURSOR                                        
	40:61      BYTE       START LINE FOR CURSOR                                      
	40:62      BYTE       CURRENT PAGE BEING DISPLAYED                               
	40:63      WORD       BASE PORT ADDRESS FOR ACTIVE DISPLAY                       
	40:65      BYTE       CURRENT SETTING OF THE 3X8 REGISTER                        
	40:66      BYTE       CURRENT PALETTE SETTING COLOR CARD                         
	40:67      DWORD      TEMP. STORAGE FOR SS:SP DURING SHUTDOWN                    
	40:6C      DWORD      TIMER COUNTER LOW WORD, HIGH WORD                          
	40:70      BYTE       24 HOUR TIMER OVERFLOW                                     
	40:71      BYTE       BIOS BREAK FLAG (BIT 7 = BREAK KEY HIT)                    
	40:72      WORD       RESET FLAG (1234 = SOFT RESET)                             
	40:74      BYTE       STATUS OF LAST HARD DISK OPERATION                         
	40:75      BYTE       NUMBER OF HARD FILES ATTACHED                              
	40:77      BYTE       PORT OFFSET TO CURRENT HF ADAPTER                          
	40:78      4 BYTES    TIMEOUT VALUE FOR LPT1,LPT2,LPT3,LPT4                      
	40:7C      4 BYTES    TIMEOUT VALUE FOR COM1,COM2,COM3,COM4                      
	40:80      WORD       KEYBOARD BUFFER START OFFSET (SEG=40)                      
	40:82      WORD       KEYBOARD BUFFER END OFFSET (SEG=40H)                       
	40:84      BYTE       ROWS ON THE SCREEN (EGA ONLY)                              
	40:85      WORD       BYTES PER CHARACTER (EGA ONLY)                             
	40:87      BYTE       MODE OPTIONS (EGA ONLY)                                    
	40:88      BYTE       FEATURE BIT SWITCHES (EGA ONLY)                            
	40:8B      BYTE       LAST DISKETTE DATA RATE SELECTED                           
	40:8C      BYTE       HARD FILE STATUS RETURNED BY CONTROLLER                    
	40:8D      BYTE       HARD FILE ERROR RETURNED BY CONTROLLER                     
	40:8E      BYTE       HARD FILE INTERRUPT (BIT 7=WORKING INT)                    
	40:90      4 BYTES    MEDIA STATE DRIVE 0,1,2,3                                  
	40:94      2 BYTES    TRACK CURRENTLY SEEKED TO DRIVE 0,1                        
	40:96      BYTE       KEYBOARD FLAG BYTE 3 (SEE INT 9)                           
	40:97      BYTE       KEYBOARD FLAG BYTE 2 (SEE INT 9)                           
	40:98      DWORD      POINTER TO USERS WAIT FLAG                                 
	40:9C      DWORD      USERS TIMEOUT VALUE IN MICROSECONDS                        
	40:A0      BYTE       RTC WAIT FUNCTION IN USE                                   
	40:A1      BYTE       LANA DMA CHANNEL FLAGS                                     
	40:A2      2 BYTES    STATUS LANA 0,1                                            
	40:A4      DWORD      SAVED HARDFILE INTERRUPT VECTOR                            
	40:A8      DWORD      EGA POINTER TO PARAMETER TABLE                             
	40:B4      BYTE       KEYBOARD NMI CONTROL FLAGS (CONVERTIBLE)                   
	40:B5      DWORD      KEYBOARD BREAK PENDING FLAGS (CONVERTIBLE)                 
	40:B9      BYTE       PORT 60 SINGLE BYTE QUEUE (CONVERTIBLE)                    
	40:BA      BYTE       SCAN CODE OF LAST KEY (CONVERTIBLE)                        
	40:BB      BYTE       POINTER TO NMI BUFFER HEAD (CONVERTIBLE)                   
	40:BC      BYTE       POINTER TO NMI BUFFER TAIL (CONVERTIBLE)                   
	40:BD      16BYTES    NMI SCAN CODE BUFFER (CONVERTIBLE)                         
	40:CE      WORD       DAY COUNTER (CONVERTIBLE AND AFTER)                        
	50:00      BYTE       PRINT SCREEN STATUS BYTE                                   


### Memory address calculations
	The 8086 uses a ___20 bit address bus___ 
	but the registers are ___only sixteen bit___. 

	To derive twenty bit addresses from the registers 
	two registers are combined. 

	Every memory reference 
	uses 
	one of the four segment registers 
	plus an offset and/or a base pointer and/or a index register. 

	The segment register is multiplied by sixteen (shifted to the left four bits) 
	and added to the sixteen bit result of the offset calculation.

	The 8086 provides four segment registers for address calculations. 
	Each segment register is assigned a different task. 

	The code segment register is always used with the instruction pointer (also called the program counter) 
	to point to the instruction that is to be executed next. 

	The stack segment register is always used with the stack pointer to point to the last value pushed onto the stack. 

	The extra segment is general purpose segment register. 

##### The data segment register
	is the default register to calculate data operations,  
	this can be over ridden by specifying the segment register.   
	For example  
	mov ax,var1  
	would use the offset var1  
	and the data segment to calculate the memory reference  
	but mov ax,ss:var1 would use the offset var1  
	and the stack segment register to calculate the memory reference.  

##### The offset
	can be calculated in a number of ways.   
	Their are three elements that can make up an offset.  
	
	The first element is a base register, this can be one of the BX of BP registers (the BP register defaults to the stack segment).  
	
	The second element is one of the index register,  
	SI or DI. 
	
	he third element is a displacement.  
	A displacement can be a numerical value or an offset to a label.  
	An offset can contain one to three of these elements, making a total of sixteen possibilities. 

	BX SI  
	or + or + Displacement  

	BP DI  
	(base) (index)  

	 The offset to a label in calculated using the assembler directive OFFSET.   
	This directive   
	makes   
	the assembler   
	calculate the distant from the start of the segment that the label resides in to the label.   

For example
```asm

.DATA

label	DW	?

.CODE

	mov di, OFFSET label	;loads the offset 
				; from the start of the data segment (.DATA) 
				; to the label into di
```
---
### Addressing Examples
#### Register
	mov cs, ax
The contents of the source register is copied into the destination register. 
The source can only be a general purpose register.

#### Immediate
	mov ax, 568

The value 568 is moved to the register. 
Only the general purpose registers can be used.


#### Direct
```asm

.DATA
count 	DW ?
.CODE`
	mov cx, count
```

The value pointed to by the offset (count) 
and 
segment register is loaded into the register. 

Only the general purpose registers can be used.

#### Register indirect
```asm

.DATA
count	DW  DUP(?) # Duplicate UP = DUP(?)

.CODE
	mov ax, [si]

```
The value pointed to by ___the index register___  
and  
the segment register is loaded into the general purpose register.

#### Register indirect with displacement(변위)
	
	mov 	ax, [count+di]

The value pointed to by ___the index register___,  
the offset and the segment register is loaded into the general purpose register.

#### Register indirect with base and index

	mov 	[bp+di], ax
	mov	ax, [bp+di]

The value pointed to by ___the index register and the base register___  
is loaded into the general purpose register.

Note: ___The data segment register___ is used to calculate ___the 20 bit address___  
unless aH segment register is specified.  
ie: 
	mov ax, cs:count 
would use the code segment instead of the data segment.
---

### Flags
	|meaning      |flag  |comments|
	|---|---|---|
	|Overflow     |OF   |Set when their is a carry from the most significant bit(MSB)|                                                     
	|Direction    |DF   |Used with the string instructions to indicate the direction |                                                
	|Interrupt    |IF   |Used to enable/disable interrupts    |                     
	|Sign         |SF   |Set if the last operation resulted in a negative number  | 
	|Zero         |ZF   |Set if last operation resulted in a zero|                  
	|Carry        |CF   |Show carry out or borrow into leftmost bit position |      
	|Parity       |PF   |Set if last operation resulted in an even parity|         
	|Aux Carry    |AF   |Indicates carry or borrow for eight bit operation |        

7.9.1.6.1 Flag register
15 0

X    X    X    X    OF   DF   IF   T    SF   ZF   X    AF   X    PF   X    CF   

7.9.1.7 Instruction Set
7.9.1.7.1 Data Transfer

Instruction  Operation             Example            Comments                     
mov          dest <- src           mov ax, var1                                    
xchg         switch operands       xchg ax,bx                                      
xlat         al <- al + [bx]       xlat EBCDIC                                     
push         sp <- sp +2 [sp]      push ax                                         
             <-src                                                                 
pop          dest <- [sp] sp <-    pop bx                                          
             sp -2                                                                 
lea          load effective        lea dx,MESSAGE     same as: mov dx, OFFSET      
             address                                  MESSAGE                      
lds          ds:dest <- src        lds si,data[bx]    src must be dd dest must     
             +2:src                                   be reg                       
les          es:dest <- src        les di,array       similar to lds               
             +2:src                                                                
lahf         ah <- low byte flags  lahf                                            
sahf         low byte flags <- ah  sahf                                            
pushf        push flags onto       pushf                                           
             stack                                                                 
popf         pops flags from       popf                                            
             stack                                                                 

7.9.1.7.3 Bit Manipulation
Instruction   Operation            Example            Comments                     
not           src <- NOT src       not bl                                          
and           src <- dest AND src  and al,054h                                     
test          dest AND src         test bx,0F7h       Only affects flags           
or            dest <- dest OR src  or flag,040h                                    
xor           dest <- dest XOR     xor flags,97h                                   
              src                                                                  
sal/shl       shift left by count  sal ah,8           or count in CX               
shr           logical shift right  shr bl,1           or count in CX               
sar           shift right by       sar bh,6           or count in CX               
              count                                                                
rol           rotate left by       rol bx,.8          or count in CL               
              count                                                                
ror           rotate right by      rol ax,cl          or count in CL               
              count                                                                
rcl           left by count        rcl dh,1           or count in CL               
rcr           right by count       rcr dl,5           or count in CL               

7.9.1.7.3 Arithmetic
Instruction   Operation            Example            Comments                     
add           dest <- dest+src     add al,077h                                     
adc           dest <- dest+src+CF  adc dx,[si]        add with carry               
inc           dest <- dest +1      inc ax                                          
dec           dest <- dest -1      dec bl                                          
daa           BCD addittion        daa                                             
das           BCD subtration       das                                             
aaa           ACD addition         aaa                                             
aas           ACD subtract         aas                                             
aad           ACD division         aad                                             
aam           ACD multiply         aam                                             
sub           dest <- dest - src   sub vect[di],num                                
sbb           dest <- dest - src   sbb vect[di],num                                
              - CF                                                                 
neg           src <- -src          neg var1                                        
cmp           dest - src           cmp ax,var2                                     
mul           ax <- al * src       mul bl                                          
imul          mul with sign        imul ax                                         
div           ah <- al mod src     div byte ptr num                                
              al <- al div src                                                     
div           dx <- ax mod src     div cx                                          
              ax <- ax div src                                                     
idiv          div with sign        idiv num,demon                                  
cbw           extend sign to ah    cbw                                             
cwd           extend sign to dx    cbw                                             

7.9.1.7.4 Jump
Instruction   Operation            Example                 Comments                
jl            jump less than       (SF xor OF) = 1                                 
jle           less than or equal   ((SF xor OF) or ZF) =1                          
jge           greater than or      (SF xor OF) = 0                                 
              egual                                                                
jg            greater than         ((SF xor OF) or ZF) =0                          
jo            overflow             OF = 1                                          
js            sign                 SF = 1                                          
jns           not signed           SF = 0                                          
jb            below                CF = 1                                          
jnb            not below           CF = 0                                          
jna           not above            (CF or ZF) = 1                                  
ja            above                (CF or ZF) = 0                                  
je            equal                ZF = 1                                          
jne           not equal            ZF = 0                                          
jcxz          cx is zero           CX = 0                                          
jp            parity even          PF = 1                                          
jnp           parity odd           PF = 0                                          

7.9.1.8 String Instruction
The 8086 supplier a set of instructions designed to do string manipulation. These instructions are unique to the 80x86 family of processor. They provide FAST efficient string manipulation techniques.

Instruction   operation        source     destination  
LODSB         moves a byte     DS:SI      AL           
LODSW         moves a word     DS:SI      AX           
STOSB         moves a byte     AL         ES:DI        
STOSW         moves a word     AX         ES:DI        
MOVSB         moves a byte     DS:SI      ES:DI        
MOVSW         moves a word     DS:SI      ES:DI        
SCASB         compares bytes   AX         ES:DI        
SCASW         compares word    AX         ES:DI        
CMPSB         compares bytes   DS:SI      ES:DI        
CMPSW         compares word    DS:SI      ES:DI        

NOTE: AX and AL refer to the contents of the registers , ES:DI and DS:SI refer the to memory location they point to.

These instructions can be prefixed by one of:

Prefix     operation                         
REP        repeat while CX != 0              
REPNE      repeat while CX != 0 and not      
           equal                             
REPE       repeat while CX != 0 and equal    

These prefixed will cause the string operation to be repeated while the conditions are true and the CX register is not zero. After each execution of the instruction CX is decremented and the index registers are either incremented of decremented depending on the direction flag. To uses these instruction the direction flag and the CX register have to be setup properly. The direction register can be set with either :

Instruction   operation                            
CLD           Clear direction flag for increment   
STD           Set direction flag for decrement     

Example:

.

.


cld		;Set for forward direction


mov	ax,SEF WordArray	;ES:DI  points to WordArray	


mov	es,ax


mov	di,OFFSET WordArray


sub	ax,ax	;Clear ax


mov	cx,WORD_ARRAY_LENGTH	;Only repeat for size of segment


rep	stosw	;Fill WordArray with zeros


.


.



7.9.2 Ascii Character Codes
ASCII TABLE

MSB

LSB      0        1        2        3        4        5        6        7        
0        NUL      DLE      SPACE    0        @        P        `        p        
1        SOH      DC1      !        1        A        Q        a        q        
2        STX      DC2      "        2        B        R        b        r        
3        ETX      DC3      #        3        C        S        c        s        
4        EOT      DC4      $        4        D        T        d        t        
5        ENQ      NAK      %        5        E        U        e        u        
6        ACK      SYN      &        6        F        V        f        v        
7        BEL      ETB      '        7        G        W        g        w        
8        BS       CAN      (        8        H        X        h        x        
9        HT       EM       )        9        I        Y        i        y        
A        LF       SUB      *        :        J        Z        j        z        
B        VT       ESC      +        ;        K        [        k        {        
C        FF       FS       ,        <        L        \        l        |        
D        CR       GS       -        =        M        ]        m        }        
E        SO       RS       .        >        N        ^        n        ~        
F        SI       US       /        ?        O        _        o        DEL      

ie: B = 42 hex


7.9.3 Memory Model directives
Even the simplest of assembly language programs has to contain a minimum of "setup" information. This information is used by the assembler to help it make certain decisions while it assembles. Some of this information is common to all assemblers and some is specific to 8086 assemblers. There are even variations among 8086 assemblers.
7.9.3.1 Segment Register directives
The assembler has to make certain assumptions about the values in the segment registers in order the calculate offsets. Their are several ways to tell the assembler the value of the segment registers.
7.9.3.1.1 . directives
Turbo Assembler provides a set of simple directive to specify information about the segment registers.


.CODE	Defines the start of the code segment


.DATA	Defines the start of the data segment


.STACK 	Defines the stack segment





7.9.3.1.2 Assume
A more powerful but complicated ways is to use the ASSUME directive.

	DATA	SEGMENT


	mov		ax,DATA


	mov		ds,ax


	ASSUME	ds:DATA 



The assembler would think that the ds segment register contains the address of DATA and would calculate the offset accordingly. The programmer has to load the register with the right value or the offsets will all be wrong.

7.9.3.1.3 Segment
	SEGMENT name  [align] [combine] [use] ['class']

	


name	Is the name given to the segment.  The same name can be used
several times through several source files.  Each time the name is encountered
the segments will be combined.


[align] 	is optionally used to tell the assembler what boundary to start
the segment on.  


BYTE - Use the next byte


WORD - Use the next word boundary (16 bits)


DWORD - Use the next double word boundary (32 bits)


PARA - Use the next paragraph boundary (16 bytes)


PAGE - Use the next page (256 bytes)




[combine]	Tell how to combine segments with the same name


AT expression -  The segment is located at the address specified
by expression.


COMMON - Locate all segments with this name at the same location.


PRIVATE - Do not allow this segments to be combined with any other.


PUBLIC - Concatenates all segments with this name together.


STACK - Concatenates all segments with this name together and initialize
the SS register to this segment and the SP register to the end of
this segment.


VIRTUAL- is a common area that will be combined across modules to permit
static data    to be shared.




[use] 	Specifies the default word size for the segment, this can only be
use with the 386 processor enabled.


USE16 - use 16 bit segment references.  This allows for 64K segments.


USE32 - use 32 bit segment references.  This allows for up to 4 Gb
segments.


[class]	Controls the ordering of segments at link time.  Segments with
the same class are ordered together regardless of their order in the source
file.  The class must be in quotes (' or ")



7.9.3.1.4 model directive
The following directives require the model to be defined with the .MODEL directive. This tells the compiler how memory is to be addressed. The options are:

tiny Code and data fit with in a single 64K segment. Memory references are NEAR.

small Code and data each fit with in 64K segments. Memory references are NEAR.

medium Code may be bigger than 64K but data can only be 64K. References to code are FAR and data is NEAR.

compact Code must fit within 64K but the data may exceed 64K. Code references are NEAR and data is FAR. No data array can exceed 64K.

large Both data and code can be larger than 64K. All references are FAR. No data array can exceed 64K.

huge Both data and code can be larger than 64K. All references are FAR. Data array can exceed 64K. Pointers to elements within an array are far.

7.9.3.2 Data storage directive
The 8086 contains a segment register (DS) that is dedicated to a data segment. This register is the default segment register used for all memory references (this can be overridden by explicitly specifying the segment). The user is responsible loading the DS register with the appropriate value and telling the assembler where the DS register points so that it can calculate the offsets correctly. The standard is to define a segment to be a data segment. This is a convenient way of keeping data an code separate. The most common way of doing this is:

DATA	SEGMENT


	...


	ENDS	DATA	;indicates the end of the data


				; segment 	




	ASSUME	ds:DATA  ;required to inform


						; assembler of location 


						; of DS pointer




REMEMBER:	The programmer is responsible for loading the DS register with
the correct value.




With in the DATA SEGMENT there are several ways of defining data.




[name] DB expression [,expression]


DB allocates and initializes a byte of memory.


name refers to the symbol associated with this memory location.


expression can be:


	A constant that will be loaded into memory.


	A question mark indicates not to initialize memory.


	A character string to initialize memory with.


	A DUP statement




[name] DD [type PTR] expression
[,expression]


	DD allocates and initializes a double word (4 bytes) of memory.


	name refers to the symbol associated with this memory location.


	type PTR is used to added debug information to the symbol.  Type can
be:


	BYTE, WORD,DATAPTR, CODEPTR, NEAR,FAR, DWORD,FWORD, PWORD, QWORD, TBYTE,
SHORT 


expression can be:


	A constant that will be loaded into memory.


	A question mark indicates not to initialize memory.


	A character string to initialize memory with.


	A DUP statement




[name] DW [type PTR] expression
[,expression]


	DD allocates and initializes a word (2 bytes) of memory.


	name refers to the symbol associated with this memory location.


	type PTR is used to add debug information to the symbol.  Type can
be:


	BYTE, WORD,DATAPTR, CODEPTR, NEAR,FAR, DWORD,FWORD, PWORD, QWORD, TBYTE,
SHORT 


expression can be:


	A constant that will be loaded into memory.


	A question mark indicates not to initialize memory.


	A character string to initialize memory with.


	A DUP statement




count DUP (expression [,expression]...) 


	Repeats a data allocation operation count  times.  This directive is to
be used with one of the data storage directives.





7.9.4 Program Listings
The format of the listing file is:


Turbo Assembler	 Version 2.5	    07/02/91 09:40:20	    Page 1


SUB.ASM




	Line	Offset	Opcode	Program listing


	Number	or Data value




	1					     DOSSEG


	2	0000				     MODEL   SMALL


	3	0000				     STACK   200H


	4


	5	0000				    .DATA


	6				     GLOBAL  P1


	7


	8	0000  0006		     P1	     DW	     6


	9	0002  004E		     P2	     DW	     78


 	10	      =	0038		     P3	     EQU     56






	.


	.


.


	28	0024  E8 0000e			     call    sub1


**Error** SUB.ASM(26) Near jump	or call	to different CS






Turbo Assembler	 Version 2.5	    07/02/91 09:40:20	    Page 2


Symbol Table




Symbol Name			  Type	 Value




??DATE				  Text	 "07/02/91"


??FILENAME			  Text	 "SUB	  "


??TIME				  Text	 "09:40:19"


??VERSION			  Number 0205


.


.


.


@MODEL				  Text	 2


@WORDSIZE			  Text	 2








MAIN				  Near	 _TEXT:0000


P1				  Word	 DGROUP:0000


P3				  Number 0038


P4				  Word	 DGROUP:0004


SUB1				  Near	 DGROUP:---- Extern


  


Groups & Segments		  Bit Size Align  Combine Class




DGROUP				  Group


  STACK				  16  0200 Para	  Stack	  STACK


  _DATA				  16  0006 Word	  Public  DATA


_TEXT				  16  003D Word	  Public  CODE




Turbo Assembler	 Version 2.5	    07/02/91 09:40:20	    Page 3


Error Summary






**Error** SUB.ASM(26) Near jump	or call	to different CS


**Error** SUB.ASM(31) Symbol already different kind: SUB1



The first section contains the listing of the program along with the line number, the offset from the start of the segment, and the hexadecimal opcode. Equates are defined but are not part of the object code. Error messages are printed after the line on which they occur


	...


	10	      =	0038		     P3	     EQU     56 


	...


	28	0024  E8 0000e			     call    sub1


**Error** SUB.ASM(26) Near jump	or call	to different CS




	...







The next section is the Symbol table. The first part of the Symbol table contains some symbols defined by the assembler. The next section contains the symbols that were defined within the program.The next section contains information about the segments. The last section contain a summary of the errors. The line number is included within brackets

7.9.5 Error Messages
Turbo Assembler will produce warning messages if it has to make an assumptions during assembly. These assumptions are usually correct but not always. A warning message is of the form:

**Warning** filename(line) message

or if the warning is within a macro:

**Warning** filename(line) macroname(macroline) message

An error will stop Turbo Assembler from generating object code but assembly will continue to the end of the file to find any more errors. An error message is of the form:

**Error** filename(line) message

or if the error is within a macro:

**Error** filename(line) macroname(macroline) message

For a complete list of error messages and their explanations see Turbo Assembler Reference Guide

8086 Programming Card
8086 REGISTERS

GENERAL REGISTERS

AX       accumulator (16 bit)              
AH       accumulator high-order byte (8    
         bit)                              
AL       accumulator low-order byte (8     
         bit)                              
BX       accumulator (16 bit)              
BH       accumulator high-order byte (8    
         bit)                              
BL       accumulator low-order byte (8     
         bit)                              
CX       count and accumulator (16 bit)    
CH       count high order byte (8 bit)     
CL       count low order byte (8 bit)      
DX       data and I/O address (16 bit)     
DH       data high order byte (8 bit)      
DL       data low order byte (8 bit)       

SEGMENT REGISTERS

CS       code segment (16 bit)             
DS       data segment (16 bit)             
SS       stack segment (16 bit)            
ES       extra segment (16 bit)            

INDEX REGISTERS

DI       destination index (16 bit)        
SI       source index (16 bit)             

POINTER REGISTERS

SP       stack pointer (16 bit)            
BP       base pointer (16 bit)             
IP       instruction pointer (16 bit)      

FLAGS

           fla  comments                                     
           g                                                 
Overflow   OF   Set when a carry results from the MSB        
Direction  DF   Indicates the direction for the string       
                instructions                                 
Interrupt  IF   Used to enable/disable interrupts            
Sign       SF   Set if last operation resulted in a          
                negative number                              
Zero       ZF   Set if last operation resulted in a zero     
Carry      CF   Show carry out or borrow in                  
Parity     PF   Set if last operation resulted in an even    
                parity                                       
Aux Carry  AF   Indicates carry or borrow for eight bit      
                operation                                    

FLAG REGISTER
15 0
X    X   X   X   OF  DF  IF  T   SF  ZF  X   AF  X   PF  X   CF  


MEMORY ADDRESS CALCULATIONS

INSTRUCTION SET
DATA TRANSFER

Inst.   Operation            Example        Comments         
mov     dest <- src          mov ax, var1                    
xchg    switch operands      xchg ax,bx                      
xlat    al <- al + [bx]      xlat EBCDIC                     
push    sp <- sp +2 [sp]     push ax                         
        <-src                                                
pop     dest <- [sp] sp <-   pop bx                          
        sp -2                                                
lea     load effective       lea dx,MSG     same as: mov     
        address                             dx, OFFSET MSG   
lds     ds:dest <- src       lds            src must be dd   
        +2:src               si,data[bx]    dest must be     
                                            reg              
les     es:dest <- src       les di,array   similar to lds   
        +2:src                                               
lahf    ah <- low byte       lahf                            
        flags                                                
sahf    low byte flags <-    sahf                            
        ah                                                   
pushf   push flags onto      pushf                           
        stack                                                
popf    pops flags from      popf                            
        stack                                                

BIT MANIPULATION

Inst.   Operation            Example        Comments         
not     src <- NOT src       not bl                          
and     src <- dest AND src  and al,054h                     
test    dest AND src         test bx,0F7h   Only affects     
                                            flags            
or      dest <- dest OR src  or flag,040h                    
xor     dest <- dest XOR     xor flags,97h                   
        src                                                  
shl     shift left by count  sal ah,8       or count in CX   
shr     logical shift right  shr bl,1       or count in CX   
sar     shift right by       sar bh,6       or count in CX   
        count                                                
rol     rotate left by       rol bx,.8      or count in CL   
        count                                                
ror     rotate right by      rol ax,cl      or count in CL   
        count                                                
rcl     left by count        rcl dh,1       or count in CL   
rcr     right by count       rcr dl,5       or count in CL   

ARITHMETIC

Inst.  Operation           Example          Comments      
add    dest <- dest+src    add al,077h                    
adc    dest <-             adc dx,[si]      add with      
       dest+src+CF                          carry         
inc    dest <- dest +1     inc ax                         
dec    dest <- dest -1     dec bl                         
daa    BCD addittion       daa                            
das    BCD subtration      das                            
aaa    ACD addition        aaa                            
aas    ACD subtract        aas                            
aad    ACD division        aad                            
aam    ACD multiply        aam                            
sub    dest <- dest - src  sub                            
                           vect[di],num                   
sbb    dest <- dest-src    sbb                            
       - CF                vect[di],num                   
neg    src <- -src         neg var1                       
cmp    dest - src          cmp ax,var2                    
mul    ax <- al * src      mul bl                         
imul   mul with sign       imul ax                        
div    ah <- al mod src    div byte ptr                   
       al <- al div src    num                            
div    dx <- ax mod src    div cx                         
       ax <- ax div src                                   
idiv   div with sign       idiv num,demon                 
cbw    extend sign to ah   cbw                            
cwd    extend sign to dx   cbw                            

JUMP

Inst.  Operation           Example          Comments      
jl     jump less than      (SF xor OF) = 1                
jle    less than or equal  ((SF xor OF)                   
                           or ZF) =1                      
jge    greater than or     (SF xor OF) = 0                
       egual                                              
jg     greater than        ((SF xor OF)or                 
                           ZF)=0                          
jo     overflow            OF = 1                         
js     sign                SF = 1                         
jns    not signed          SF = 0                         
jb     below               CF = 1                         
jnb     not below          CF = 0                         
jna    not above           (CF or ZF) = 1                 
ja     above               (CF or ZF) = 0                 
je     equal               ZF = 1                         
jne    not equal           ZF = 0                         
jcxz   cx is zero          CX = 0                         
jp     parity even         PF = 1                         
jnp    parity odd          PF = 0                         

STRING INSTRUCTIONS

Instruction   operation        source     destination  
LODSB         moves a byte     DS:SI      AL           
LODSW         moves a word     DS:SI      AX           
STOSB         moves a byte     AL         ES:DI        
STOSW         moves a word     AX         ES:DI        
MOVSB         moves a byte     DS:SI      ES:DI        
MOVSW         moves a word     DS:SI      ES:DI        
SCASB         compares bytes   AX         ES:DI        
SCASW         compares word    AX         ES:DI        
CMPSB         compares bytes   DS:SI      ES:DI        
CMPSW         compares word    DS:SI      ES:DI        

NOTE: AX and AL refer to the contents of the registers , ES:DI and DS:SI refer the to memory location they point to.
These instructions can be prefixed by one of:

Prefix     operation                         
REP        repeat while CX != 0              
REPNE      repeat while CX != 0 and not      
           equal                             
REPE       repeat while CX != 0 and equal    

Instruction   operation                            
CLD           Clear direction flag for increment   
STD           Set direction flag for decrement     

ADDRESSING EXAMPLES
Register mov cs,ax

Immediate mov ax,568

Direct mov cx,count

Register indirect mov ax,[si]

Register indirect with displacement

mov ax,[count+di]

Register indirect with base and index
mov [bp+di],ax
or mov ax,[bp+di]


INTERRUPT (TRAP) VECTORS





HEX Ascii Character Codes

MSB

LSB     0      1      2      3      4      5      6      7      
0       NUL    DLE    SP     0      @      P      `      p      
1       SOH    DC1    !      1      A      Q      a      q      
2       STX    DC2    "      2      B      R      b      r      
3       ETX    DC3    #      3      C      S      c      s      
4       EOT    DC4    $      4      D      T      d      t      
5       ENQ    NAK    %      5      E      U      e      u      
6       ACK    SYN    &      6      F      V      f      v      
7       BEL    ETB    '      7      G      W      g      w      
8       BS     CAN    (      8      H      X      h      x      
9       HT     EM     )      9      I      Y      i      y      
A       LF     SUB    *      :      J      Z      j      z      
B       VT     ESC    +      ;      K      [      k      {      
C       FF     FS     ,      <      L      \      l      |      
D       CR     GS     -      =      M      ]      m      }      
E       SO     RS     .      >      N      ^      n      ~      
F       SI     US     /      ?      O      _      o      DEL    

ie: B = 42 hex
DATA STORAGE DIRECTIVE
DATA SEGMENT
...

ENDS DATA ;indicates the end of the data

; segment

REMEMBER: The programmer is responsible for loading the DS register with the correct value.

STORAGE

[name] DB expression [,expression]

DB allocates and initializes a byte of memory.

name refers to the symbol associated with this memory location.

expression can be:

A constant that will be loaded into memory.

A question mark indicates not to initialize memory.

A character string to initialize memory with.

A DUP statement

[name] DD [type PTR] expression [,expression]

DD allocates and initializes a double word (4 bytes) of memory.

name refers to the symbol associated with this memory location.

type PTR is used to added debug information to the symbol. Type can be:

BYTE, WORD,DATAPTR, CODEPTR, NEAR,FAR, DWORD,FWORD, PWORD, QWORD, TBYTE, SHORT

expression can be:

A constant that will be loaded into memory.

A question mark indicates not to initialize memory.

A character string to initialize memory with.

A DUP statement

[name] DW [type PTR] expression [,expression]

DD allocates and initializes a word (2 bytes) of memory.

name refers to the symbol associated with this memory location.

type PTR is used to add debug information to the symbol. Type can be:

BYTE, WORD,DATAPTR, CODEPTR, NEAR,FAR, DWORD,FWORD, PWORD, QWORD, TBYTE, SHORT

expression can be:

A constant that will be loaded into memory.

A question mark indicates not to initialize memory.

A character string to initialize memory with.

A DUP statement

count DUP (expression [,expression]...)

Repeats a data allocation operation count times. This directive is to be used with one of the data storage directives.

BIOS DATA AREA ADDRESSES

ADDR   SIZE     DESCRIPTION                                 
40:00  WORD     COM1 PORT ADDRESS                           
40:02  WORD     COM2 PORT ADDRESS                           
40:04  WORD     COM3 PORT ADDRESS                           
40:06  WORD     COM4 PORT ADDRESS                           
40:08  WORD     LPT1 PORT ADDRESS                           
40:0A  WORD     LPT2 PORT ADDRESS                           
40:0C  WORD     LPT3 PORT ADDRESS                           
40:0E  WORD     LPT4 PORT ADDRESS                           
40:10  WORD     EQUIPMENT FLAG (SEE INT 11)                 
40:13  WORD     MEMORY SIZE IN KBYTES                       
40:17  BYTE     KEYBOARD FLAG 0 (SEE INT 9)                 
40:18  BYTE     KEYBOARD FLAG 1 (SEE INT 9                  
40:19  BYTE     STORAGE FOR ALTERNATE KEYPAD ENTRY          
40:1A  WORD     POINTER TO KEYBOARD BUFFER HEAD             
40:1C  WORD     POINTER TO KEYBOARD BUFFER TAIL             
40:1E  20       KEYBOARD BUFFER                             
       BYTES                                                
40:41  BYTE     STATUS OF LAST DISKETTE OPERATION           
40:49  BYTE     CURRENT CRT MODE                            
40:4A  WORD     NUMBER OF COLUMNS ON SCREEN                 
40:4C  WORD     REGEN BUFFER LENGTH IN BYTES                
40:4E  WORD     STARTING OFFSET OF REGEN BUFFER             
40:50  8 WORDS  CURSOR POSITION PAGES 1-8                   
40:60  BYTE     END LINE FOR CURSOR                         
40:61  BYTE     START LINE FOR CURSOR                       
40:62  BYTE     CURRENT PAGE  DISPLAYED                     
40:63  WORD     BASE PORT ADDRESS FOR ACTIVE DISPLAY        
40:65  BYTE     CURRENT SETTING OF THE 3X8 REGISTER         
40:66  BYTE     CURRENT PALETTE SETTING COLOR CARD          
40:67  DWORD    TEMP. STORAGE FOR SS:SP DURING SHUTDOWN     
40:6C  DWORD    TIMER COUNTER LOW WORD, HIGH WORD           
40:70  BYTE     24 HOUR TIMER OVERFLOW                      
40:71  BYTE     BIOS BREAK FLAG (BIT 7 = BREAK KEY HIT)     
40:72  WORD     RESET FLAG (1234 = SOFT RESET)              
40:74  BYTE     STATUS OF LAST HARD DISK OPERATION          
40:75  BYTE     NUMBER OF HARD FILES ATTACHED               
40:77  BYTE     PORT OFFSET TO CURRENT HF ADAPTER           
40:78  4 BYTES  TIMEOUT VALUE FOR LPT1,LPT2,LPT3,LPT4       
40:7C  4 BYTES  TIMEOUT VALUE FOR COM1,COM2,COM3,COM4       
40:80  WORD     KEYBOARD BUFFER START OFFSET (SEG=40)       
40:82  WORD     KEYBOARD BUFFER END OFFSET (SEG=40H)        
40:84  BYTE     ROWS ON THE SCREEN (EGA )                   
40:85  WORD     BYTES PER CHARACTER (EGA )                  
40:87  BYTE     MODE OPTIONS (EGA )                         
40:88  BYTE     FEATURE BIT SWITCHES (EGA )                 
40:8B  BYTE     DISKETTE DATA RATE SELECTED                 
40:8C  BYTE     HARD FILE STATUS RETURNED BY CONTROLLER     
40:8D  BYTE     HARD FILE ERROR RETURNED BY CONTROLLER      
40:8E  BYTE     HARD FILE INTERRUPT (BIT 7=WORKING INT)     
40:90  4 BYTES  MEDIA STATE DRIVE 0,1,2,3                   
40:94  2 BYTES  TRACK CURRENTLY SEEKED TO DRIVE 0,1         
40:96  BYTE     KEYBOARD FLAG 3 (SEE INT 9)                 
40:97  BYTE     KEYBOARD FLAG 2 (SEE INT 9)                 
40:98  DWORD    POINTER TO USERS WAIT FLAG                  
40:9C  DWORD    USERS TIMEOUT VALUE IN MICROSECONDS         
40:A0  BYTE     RTC WAIT FUNCTION IN USE                    
40:A1  BYTE     LANA DMA CHANNEL FLAGS                      
40:A2  2 BYTES  STATUS LANA 0,1                             
40:A4  DWORD    SAVED HARDFILE INTERRUPT VECTOR             
40:A8  DWORD    EGA POINTER TO PARAMETER TABLE              
40:B4  BYTE     KEYBOARD NMI CONTROL FLAGS (CONVERTIBLE)    
40:B5  DWORD    KEYBOARD BREAK PENDING FLAGS (CONVERTIBLE)  
40:B9  BYTE     PORT 60 SINGLE BYTE QUEUE (CONVERTIBLE)     
40:BA  BYTE     SCAN CODE OF LAST KEY (CONVERTIBLE)         
40:BB  BYTE     POINTER TO NMI BUFFER HEAD (CONVERTIBLE)    
40:BC  BYTE     POINTER TO NMI BUFFER TAIL (CONVERTIBLE)    
40:BD  16BYTES  NMI SCAN CODE BUFFER (CONVERTIBLE)          
40:CE  WORD     DAY COUNTER (CONVERTIBLE AND AFTER)         
50:00  BYTE     PRINT SCREEN STATUS BYTE                    
