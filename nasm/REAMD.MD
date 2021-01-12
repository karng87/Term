1byte (db) => 2^8 = 256 (-128)  
2byte (dw) => 2^16 = 65536 (-32768)  
4byte (dd) => 2^32 = 4294967296 (-2147483648)  
8bye  (dq) => 2^64 = 1.8446744e+19 (-9.223372e+18)  

|2^64|-|2^32|2^16|||
|---|---|---|---|---|
|ff|ee|cc|bb|-|0000|
|ff|ee|cc|bb|-|0004|
|ff|ee|cc|bb|-|0008|
|ff|ee|cc|bb|-|000c|
|ff|ee|cc|bb|-|0010|
|ff|ee|cc|bb|-|0014|
|ff|ee|cc|bb|-|0018|
|ff|ee|cc|bb|-|001c|
|ff|ee|cc|bb|-|0020|


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


