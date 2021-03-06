1bit (전선 1가닥) (2^1) = 2가지 경우의 수를 표현가능

8bit (전선 8가닥) (2^8) = (16^2) = 16진수 두번째 자리

1byte (8 bit)
- (16^2 = 0x ff)
- (db) => 2^8 = 256 (-128)  

2byte (16 bit)
- (16^4 = 0x ffff)
- (dw) => 2^16 = 65536 (-32768)  

4byte (32 bit)
- (16^8 = 0x ffff ffff)
- (dd) => 2^32 = 4294967296 (-2147483648)  

8byte (64 bit)
- (16^16 = 0x ffff ffff ffff ffff )
- (dq) => 2^64 = 1.8446744e+19 (-9.223372e+18)  

|4 byte|3 byte|2 byte|1 byte|-|Address|
|---|---|---|---|---|---|
|ff|ff|ff|f0|-|0000|
|ff|ff|ff|f0|-|0004|
|ff|ff|ff|f0|-|0008|
|ff|ff|ff|f0|-|000c|
|ff|ff|ff|f0|-|0010|
|ff|ff|ff|f0|-|0014|
|ff|ff|ff|f0|-|0018|
|ff|ff|ff|f0|-|001c|
|ff|ff|ff|f0|-|0020|


# [nasm blog] (https://hdnua.tistory.com/10)
| 문자(Letter) | dx(data )| resx(reserve expanding) | 단위(Unit) | another name |
|---|---|---|---|---|
| b | db | resb | 1바이트 | 바이트(byte) |
| w | dw | resw | 2바이트 | 워드(word) |
| d(ㅣ) | dd | resd | 4바이트 | 더블 워드(double word, dword) |
| q | dq | resq | 8바이트 | 쿼드 워드(quard word, qword) |
| t | dt | rest | 10 바이트 | 텐 바이트(ten byte, tbyte) |
## times num (Arrary)
- times 100 db (db x 100 )
- times 20 resw  (resw x 20)

> # Operator (OPCode)
> ## OpCode(X) Source, Destination
>   - X is one of a { b, w, l }
>
>> ### DATA SCALE
>> b => 1byte  
>> w => 2byte  
>> l => 4byte (long word = 2 word)
> 
>> move(x) src, des
>> - x is one of { b, w, l }
>> moveb src des => 1 byte
>>   - b is 1byte data scale
>> movew src des => 2 byte
>>   - w is 2byte data scale
>> movel src des => 4 byte 
>>   = 1 is 2 word (4 byte) data scale
>  
> # Operand
> - Source, Destination Type
>   - immediate value
>     - $
>       - $0xffff
>       - $0x-ffff       
>   - register value
>     - %
>     - one of 8 integer register

|64 bit register|32 bit|16bit|8bit high|8bit low|
|---|---|---|---|---|
|rax|eax|ax|ah|al|
|rbx|ebx|bx|bh|bl|
|rcx|ecx|cx|ch|cl|
|rdx|edx|dx|dh|dl|
|esp|||||
|ebp|||||
|si|||||
|di|||||

>   - memory value
>     - [register]
>     - Num[register]
>     - [register , offset]
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
# system call function 
## [linux x86_64 system call table](https://chromium.googlesource.com/chromiumos/docs/+/master/constants/syscalls.md)
## mac => /usr/include/sys/syscall.h value + 0x02000000
- lunux x86_64 syscall register
  - rax - select system call 
  - rdi - used to pass 1st argument to functions
  - rsi - used to pass 2nd argument to functions
  - rdx - used to pass 3rd argument to functions
  - rcx - used to pass 4th argument to functions
  - r8 - used to pass 5th argument to functions
  - r9 - used to pass 6th argument to functions

|arch	|syscall NR	|return	|arg0	|arg1	|arg2	|arg3	|arg4	|arg5|
|---|---|---|---|---|---|---|---|---|
|arm	|r7	|r0	|r0	|r1	|r2	|r3	|r4	|r5|
|arm64	|x8	|x0	|x0	|x1	|x2	|x3	|x4	|x5|
|x86	|eax	|eax	|ebx	|ecx	|edx	|esi	|edi	|ebp|
|x86_64	|rax	|rax	|rdi	|rsi	|rdx	|r10	|r8	|r9|
