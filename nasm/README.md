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
|register|||||
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

