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

|2 byte|2 byte|2 byte|2 byte|-|Address|
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
| d | dd | resd | 4바이트 | 더블 워드(double word, dword) |
| q | dq | resq | 8바이트 | 쿼드 워드(quard word, qword) |
| t | dt | rest | 10 바이트 | 텐 바이트(ten byte, tbyte) |
## times num (Arrary)
- times 100 db (db x 100 )
- times 20 resw  (resw x 20)


