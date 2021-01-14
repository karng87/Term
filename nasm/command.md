# 메모리 주소지정 [Memory Addressing](https://csiflabs.cs.ucdavis.edu/~ssdavis/50/att-syntax.htm)
### In the AT&T Syntax, memory is referenced in the following way,
#### segment-override:signed-offset(base,index,scale)
parts of which can be omitted depending on the address you want.

- %es:100(%eax,%ebx,2)
       - Please note that the offsets and the scale should not be prefixed by '$'. 
       - A few more examples with their equivalent NASM-syntax, should make things clearer,

| GAS memory operand	|		| NASM memory operand |
|------------------|			|-------------------|
| 100					| [100]| 
| %es:100				| [es:100]| 
| (%eax)				| [eax]| 
| (%eax,%ebx)				| [eax+ebx]| 
| (%ecx,%ebx,2)			| [ecx+ebx*2]| 
| (,%ebx,2)				| [ebx*2]| 
| -10(%eax)				| [eax-10]| 
| %ds:-10(%ebp)			| [ds:ebp-10]| 

Example instructions,
- mov	%ax,	100
- mov	%eax,	-100(%eax)
The first instruction moves the value in register AX into offset 100 of the data segment register (by default), and the second one moves the value in eax register to [eax-100].




# 어셈 명령어
---
8개의 범용 레지스터는 다음과 같다:
- AX (Accumulator register). 산술 연산에 사용.
- CX (Counter register). 시프트/회전 연산과 루프에서 사용.
- DX (Data register). 산술 연산과 I/O 명령에서 사용.
- BX (Base register). 데이터의 주소를 가리키는 포인터로 사용. (세그멘티드 모드에서는 세그멘트 레지스터 DS로 존재)
- SP (Stack Pointer register). 스택의 최상단을 가리키는 포인터로 사용.
- BP (Stack Base Pointer register). 스택의 베이스를 가리키는 포인터로 사용.
- SI (Source Index register). 스트림 명령에서 소스를 가리키는 포인터로 사용.
- DI (Destination Index register). 스트림 명령에서 도착점을 가리키는 포인터로 사용.
---
### 1. 주소 산술 연산

- Push  : sp 레지스터를 조작하는 명령어중의 하나이다.
       스택에 데이터를 저장하는데 쓰인다.
       
ex:) Push eax : 스택에 Eax의 값을 스택에 저장한다.  
ex:) Push 20 :즉석값인 20을 스택에 저장한다.  
ex:) Push 401F47 : 메모리 오프셋 401F47의 값을 스택에 저장한다.  

- Pop  : 이또한 sp 레지스터를 조작하는 명령어중 하나이다.  
스택에서 데이터를 꺼내는데 쓰인다.

ex:) Pop eax :스택에 가장 상위에 있는 값을 꺼내애서 eax에 저장한다.  
주의점 : Push 의 역순으로 값은 스택에서 Pop 된다.

- Mov  : 메모리나 레지스터의 값을 옮길 때[로 만들 때]쓰인다.

ex:) Mov eax,ebx    :ebx 레지스터의 값을 eax로 옮긴다[로 만든다].  
ex:) Mov eax,20     :즉석값인 20을 eax레지스터 에 옮긴다[로 만든다].  
ex:) Mov eax,dword ptr[401F47]   :메모리 오프셋 401F47 의 값을 eax에 옮긴다[로 만든다]  

- Lea  : 오퍼렌드1의 값을 오퍼렌드2의 값으로 만들어준다.

ex:) Lea eax,ebx    : eax레지스터의 값을 ebx의 값으로 만든다.

- Inc  : 레지스터의 값을 1증가 시킨다.

ex:) Inc eax  : Eax 레지스터의 값을 1증가 시킨다.
Dec  : 레지스터의 값을 1 감소 시킨다.
ex:) Dec eax : Eax 레지스터의 값을 1 감소 시킨다.

- Add  : 레지스터나 메모리의 값을 덧셈할떄 쓰임.

ex:) Add eax,ebx   :Eax 레지스터의 값에 ebx 값을 더한다.  
ex:) Add eax,50    :Eax 레지스터에 즉석값인 50을 더한다.  
ex:) Add eax,dword ptr[401F47]  : Eax 레지스터에 메모리 오프셋 401F47의 값을 더한다.  

- Sub  : 레지스터나 메모리의 값을 뻇셈할떄 쓰임.

ex:) Sub eax,ebx   : Eax 레지스터에서 ebx 레지스터의 값을 뺸다.  
ex:) Sub eax,50  
Eax  : 레지스터에서 즉석값 50을 뺸다.  
ex:) Sub eax,dword ptr[401F47]    :Eax 레지스터에서 메모리 오프셋 401F47의 값을 뺸다.

- Nop  : 아무동작도 하지 않는다. : 90

- Call : 프로시저를 호출할떄 쓰인다.

ex:) Call dword ptr[401F47] : 메모리 오프셋 401F47을 콜한다.

- Ret : 콜한 지점으로 돌아간다.

- Cmp : 레지스터와 레지스터혹은 레지스터 값을 비교하기위하여 쓰인다.

ex:) Cmp eax,ebx    :Eax 레지스터와 Ebx 레지스터의 값을 비교한다.  
ex:) Cmp eax,50     :Eax 레지스터와 즉석값 50을 비교한다.  
ex:) Cmp eax,dword ptr[401F47]  
:Eax 레지스터와 메모리 오프셋 401F47의 값을 비교한다.

- Jmp : 특정한 메모리 오프셋으로 이동할떄 쓰인다.

ex:) Jmp dword ptr[401F47]   :메모리 오프셋 401F47 로 점프한다.  
조건부 점프: Cmp나 Test 같은 명령어의 결과에 따라점프한다.  
  - Je  : Cmp나 Test 의 결과가 같다면 점프  
  - Jne : Cmp나 Text 의 결과가 같지 않다면 점프  
  - Jz  : 왼쪽 인자의 값이 0 이라면 점프  
  - Jnz  : 왼쪽 인자의 값이 0 이 아니라면 점프  
  - Jl   : 왼쪽 인자의 값이 오른쪽 인자의 값보다 작으면 점프(부호있는)  
  - Jnl  : 왼쪽 인자의 값이 오른쪽 인자의 값보다 작지 않으면(크거나 같으면) 점프 (부호있는)  
  - Jb   : 왼쪽 인자의 값이 오른쪽 인자의 값보다 작으면 점프(부호없는)  
  - Jnb  : 왼쪽 인자의 값이 오른쪽 인자의 값보다 작지 않으면(크거나 같으면) 점프 (부호없는)  
  - Jg   : 왼쪽 인자의 값이 오른쪽 인자의 값보다 크면 점프  
  - Jng  : 왼쪽 인자의 값이 오른쪽 인자의 값보다 크지 않으면 (작거나 같으면) 점프  
  - Jle   : 왼쪽 인자의 값이 오른쪽 인자의 값보다 작거나 같으면점프 (부호있는)  
  - Jge  : 왼쪽 인자의 값이 오른쪽 인자의 값보다 크거나 같으면 점프  
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
---
### 2. 논리연산

- AND 연산

대응되는 비트가 둘다 1이면 결과는 1이고 그외의 결과들은 모두 0 이 된다.  
ex:) MOV EAX,8  
AND EAX,10 :위를 계산하기 위해 우선 두 오퍼렌드의 값을 2진수로 바꾸어 주면 8은 1000 이 되고 10은 1010 이 되고 AND 연산은 둘다 1이여야 1이 됨으로 결과는 1000 이 됩니다.

- OR 연산

대응되는 비트중 하나가 1 또는 둘다 1이면 결과는 1이고 그외는 모두 0이 된다.  
ex:) MOV EAX,8  
OR EAX,10  
:위를 계산하기 위해 두 오퍼렌드의 값을 2진수로 바꾸어 주면 8은 1000이 되고 10은 1010이 되고 OR 연산은 한쪽 또는 양쪽둘다 1이면 1이고그외는 모두 0 임으로 결과는 1010이 된다.

- XOR 연산

대응되는 비트 중에서 한비트가 1이고 다른 비트가 0이면 1이 되고 두개의 비트가 1이면 0 이 되고 두개다 0 이어도 0이 된다.  
ex:) MOV EAX,8  
XOR EAX,10  
:위를 계산하기 위해 두 오퍼렌드의 값을 2진수로 바꾸어 주면 8은 1000이 되고 10은 1010이 되고 XOR 연산은 한쪽만 1이어야 1임으로 결과는 10이 된다.  

- NOT 연산

NOT 연산은 오퍼렌드의 값을 반대로 하여 준다.  
ex:) MOV EAX,10  
NOT EAX  
:위를 계산하기 위해 오퍼렌드의 값을 2진수로 바꾸어 주면 10은 1010이 되고 NOT 연산은 1 과 0을 반대로 하여 줌으로 결과는 0101 이 된다.  
*Test 연산은 오퍼렌드에 영향을 주지 않으며 플래그만 세트 시키어 준다.  

### 3.레지스터

범용 레지스터

- (1) Eax 레지스터

누산기인 Eax 레지스터는 입출력과 거의 모든 산술연산에 사용된다. 곱셋과 나눗셈, 변환 명령어등은 반드시 Eax 레지스터를 필요하게 된다.  
Eax 레지스터는 32bit의 레지스터이고 16bit 의 레지스터로 ax가 있다.  
(ax는 왼쪽의 ah와 오른쪽의 al로 이루어져 있다)  

- (2) Ebx 레지스터

Ebx는 주소지정을 확대하기 위한 인덱스로서 사용될수 있는 유일한 범용 레지스터 이며, 다른 일반적인 계산 용도로도 쓰인다.  
Ebx는 32bit 레지스터이고 16bit로 eb가 있다.  
(eb는 왼쪽의 bh와 오른쪽의 bl로 이루어져 있다)  

- (3) Ecx 레지스터

Ecx는 루프의 반복 횟수나 좌우방향의 시프트 비트 수를 기억한다. 그외의 계산에도 사용된다.  
Ecx는 32bit 레지스터이고 16bit로 cx가 있다.  
(cx는 왼쪽의 ch와 오른쪽의 cl로 이루어져 있다.)  

- (4) Edx 레지스터

Edx는 몇몇 입출력 동작에서 사용 된다.

- (5) 플래그 레지스터
  - (1) OF [Over Flow]
산술연산후 상위 비트의 오버플로를 나타냄
  - (2) DF [Direction]
스트링 데이터를 이동하거나 비교할떄 왼쪽 또는 오른쪽으로의 방향을 결정한다.
  - (3) SF [Sign]
산술결과의 부호를 나타낸다.[0=양수,1=음수]
  - (4) ZF [zero]
산술연산 또는 비교동작의 결과를 나타낸다.
[0=결과가 0이 아님,1=결과가 0임]

  - (5) CF [Carry]
산술연산후 상위 비트로부터의 캐리 그리고 시프트 또는 회전동작의 결과 마지막 비트
내용을 저장한다.

  - (6) TF [trap]
프로세서가 단일 스텝 모드(single-step mode)를 동작할수 있도록 해준다.
---
### 3. Assembly 명령어

- MOV <Destination>, <Source> - Move.  
값을 대입하려고 할때 사용한다.  
사용 방법에는 <Destination>에는 레지스터, 메모리등이 올 수 있으며 <Source>에는 <Destination>와 같은 것 이외에 직접적인 값 등이 올 수 있다.  
Example:  
MOV EAX, 14h  
MOV EAX, DWORD PTR SS:[EBP-14]  
MOV DWORD PTR SS:[EBP-14], EDX  

  - MOVS, MOVSB, MOVSW, MOVSD(Move String Byte or Word or DWord) 
    - ESI가 가르키는 곳의 값들을 Byte(1byte), Word(2byte), DWord(4byte)크기만음 EDI가 가르키는 곳으로 이동시킨다.

  - MOVSX(Move with Sign-Extended) 
    - Byte나 Word크기의 Operand를 Word나 DWord사이즈로 늘려준다. 부호는 유지된다.

  - MOVZX(Move with Zero-Extended) 
    - Byte나 Word크기의 Operand를 Word나 DWord사이즈로 늘려준다. 연산 후 채워지지 않은 공간에는 0으로 매꾼다.


- INT <Value>  Interrupt.  
해당 Value에 따른 Interrupt를 발생시킨다.  
<Value>에 해당하는 것들이 너무 많으므로 다음에 더욱 자세하게 다루기로 하자. 
Example:  
INT 21h  

- ADD <Destination>, <Source> - Addition. 간단하다. 
  <Destination>+<Source>한 값을 <Destination>에 저장한다.  
  <Destination>에는 레지스터, 메모리등이 올 수 있으며 <Source>에는 <Destination>와 같은 것 이외에 직접적인 값 등이 올 수 있다. 
Example:  
MOV EAX, 5h  
MOV EBX, 12h  
ADD EAX, 5h  ; EAX에는 5h + 5h = Ah(10진수로 10)가 저장된다.  
ADD EAX, EBX ; EAX에는 Ah + 12h = 1Ch(10진수로 28)가 저장된다.  

- SUB <Destination>, <Source> - Subtact. ADD명령어와 사용법은 동일하다. 단지 기능은 빼주는 역할이라는거!
Example:  
MOV EAX, 4h  
SUB EAX, 3h ; EAX에는 4h - 3h = 1h가 저장된다.  

- INC <Target> - Increments. 타겟의 값에서 1을 증가시킨다.  
  <Target>에는 레지스터, 메모리등이 올 수 있으며, 직접적인 값은 불가능하다.  
Example:  
MOV EAX, 4h  
INC EAX     ; EAX에는 4h에서 1증가된 값인 5h가 저장된다.  


- DEC <Target> - Decrements. 타겟의 값에서 1을 감소시킨다.  
  <Target>에는 레지스터, 메모리등이 올 수 있으며, 직접적인 값은 불가능하다.  
Example:  
MOV EAX, 4h  
DEC EAX     ; EAX에는 4h에서 1감수한 값인 3h가 저장된다.  

- JMP <Location> - Jump. 어떠한 장소로 점프한다. 
  <Location>에는 점프할 곳의 코드주소를 담고있는 레지스터나 메모리등이 올 수 있다.
Example: 
JMP 0041D983
JMP DWORD PTR SS:[EBP-14]

- Conditional JUMP

JMP명령어와 같다. 단지 조건에 따라서 Jump할지 안할지가 결정되므로 Conditional Jump라고 하겠다. Conditional JUMP는 CMP명령어와 같이 사용된다.

  - CMP <Target1>, <Target2> 
    - 두 타겟을 비교해서 Flag Register를 변경시킨다. 
    - <Target1>이 <Target2>보다 작으면 CF가 Set되고, 같으면 ZF가 Set되고 이런것 들이 있긴하지만, 
    - 다음에 왠만하면 Conditional Jump가 있기때문에 Jump문 의미로 이해하도록 하고 CMP로 인한 Flag 변화는 그냥 넘어가도록 하겠다.  
Example:  
CMP EAX, EBX

- Unsigned
  - JA(JUMP if ABOVE)                                     CF=0 and ZF=0
  - JAE(JUMP if ABOVE or EQUAL)                    CF=0
  - JB(JUMP if BELOW)                                     CF=1
  - JBE(JUMP if BELOW or EQUAL)                    CF=1 and ZF=1
  - JNA(JUMP if NOT ABOVE)                            CF=1 or ZF=1
  - JNAE(JUMP if NOT ABOVE or EQUAL)           CF=1
  - JNB(JUMP if NOT BELOW)                            CF=0
  - JNBE(JUMP if NOW BELOW or EQUAL)          CF=0 and ZF=0
  - JE(JUMP if EQUAL)                                      ZF=1
  - JNE(JUMP if NOT EQUAL)                             ZF=0

- Signed
  - JG(JUMP if GREATER)                                 ZF=0 and SF=OF
  - JGE(JUMP if GREATER or EQUAL)                SF=OF
  - JL(JUMP if LOWER)                                     SF!=OF
  - JLE(JUMP if LOWER or EQUAL)                    ZF=1 and SF!=OF
  - JNG(JUMP if NOT GREATER)                        ZF=1 or SF!=OF
  - JNGE(JUMP if NOT GREATER or EQUAL)       SF!=OF
  - JNL(JUMP if NOT LOWER)                            SF=OF
  - JNLE(JUMP if NOT LOWER or EQUAL)           ZF=0 and SF=OF
  - JE(JUMP if EQUAL)                                     ZF=1
  - JNE(JUMP if NOT EQUAL)                            ZF=0

- Flag
  - JC(JUMP if CARRY flag set)                        CF=1
  - JNC(JUMP if NOT CARRY flag set)               CF=0
  - JO(JUMP if OVERFLOW flag set)                  OF=1
  - JNO(JUMP if NOT OVERFLOW flag set)         OF=0
  - JP(JUMP if PARITY flag set)                        PF=1
  - JNP(JUMP if NOT PARITY flag set)               PF=0
  - JPE(JUMP if PARITY is EVEN)                     PF=1
  - JPO(JUMP if PARITY is ODD)                      PF=0
  - JS(JUMP if SIGNAL flag set)                       SF=1
  - JNS(JUMP if NOT SIGNAL flag set)              SF=0
  - JCXZ(JUMP if CX is ZERO)                       CX=0

- AND <Destination>, <Source>  
  - Logical AND. 논리회로에 있어서의 AND연산을 수행한다. 그리고 AND연산을 시행할때, OF, CF는 초기화되고, ZF는 Set될 수 있다.  
Example:  
AND EAX, EBX  

- CALL <Location> 
  - Call. 말그대로 함수를 부를때 사용한다. Jump와 같다고 느껴질지도 모르지만 Call문을 시행할 경우 스택에 Call문이 시행된것을 Push를 하며 Return이 가능하다.  
Example:  
CALL 0041D983  
CALL DWORD PTR [EBX]  

- DIV <Target> 
  - AX를 <Target>으로 나누는 연산이다.   
  - 결과로 몫은EAX에 나머지는 ECX에 들어간다.  
Example:   
MOV EAX, 64h  
MOV ECX, 9h   
DIV ECX   ; 64h(100) / 9h(9) = 몫 : 0Bh(11) , 나머지 1h이므로 EAX = 0Bh, ECX = 1h가 저장된다.

- IDIV <Target> 
  - Integer Division. DIV와 똑같다. 하지만 다른점은 부호있는 정수를 다룬다는 점이다.

- MUL <Target> 
  - EAX와 <Target>을 곱하여 EAX에 저장한다.  
Example:  
MOV EAX, 2h  
MUL 4h       ; EAX에는 2h * 4h = 8h가 저장된다.  


- IMUL <Value> - Integer Multiplication. EAX와 <Value>를 곱하여 EAX에 저장한다.
- IMUL <Destination>, <Value> - <Destination>과 <Value>를 곱하여 <Destination>에 저장한다.
- IMUL <Destination>, <Value>, <Value> - 2개의 <Value>를 곱한 후에 <Destination>에 저장한다.


- LEA <Destination>, <Source> 
  - Load Effective Address. 
  - <Source>의 실제 주소를 <Destination>에 저장한다. 
  - LEA EAX, DWORD PTR [2*EAX+ECX]를 하면, EAX에 2*EAX+ECX계산값이 들어가게 된다.

- NOP - No Operation. 아무것도 하지 않는다.


- OR <Destination>, <Source> 
  - Logical OR. 논리회로에 있어서의 OR연산을 수행한다. 그리고 OR연산을 시행할때, OF, CF는 초기화되고, ZF는 Set될 수 있다.  
Example:  
OR EAX, EBX  

- POP <Destination> 
  - POP. 스택에서 ESP가 가르키는 곳에서 주소값을 불러내어 <Destination>에 저장한다. 그리고 ESP는 다음값을 가르키게 된다.  
Example:  
POP EAX  

- PUSH <Source> 
  - 스택에 <Source>를 집어넣는다. ESP는 최근에 PUSH한 값을 가르키게 된다.  
Example:  
PUSH EAX  

- RET 
  - Return. 
  - 스택에서 주소를 POP해온 후 그 주소로 돌아간다. 
  - PUSH와 RET을 조합해서 JMP처럼 사용 할 수 있다.


- TEST <Target1>, <Target2> 
  - 이 연산은 대부분이 <Target1>과 <Target2>가 같게 설정된다. 
  - 예를들면 TEST EAX, EAX. 이 연산은 논리회로의 AND연산을 수행하지만 결과값을 저장하지 않는다. 
  - 단지 EAX=0일경우 ZF=1이 되고 EAX!=0일경우 ZF=0이 된다. 그리고 OF, CF는 0이된다.  
Example:  
TEST EAX, EAX  

- XOR <Destination>, <Source> 
  - Logical Exclusive OR. 논리회로에 있어서 XOR연산을 수행한다. 
  - XOR연산을 시행할때, OF, CF는 초기화되고, ZF는 Set될 수 있다. 
  - 이 연산은 XOR EAX, EAX처럼 많이 사용되는데, 이렇게 할 경우 XOR=0이 된다. 
Example:  
XOR EAX, EBX  
XOR EAX, EAX     ; EAX=0이 됨.  


- LODS, LODSB, LODSW, LODSD(Load String Byte, Word, DWord) 
  - ESI가 가르키는 곳에서 지정한 크기(Byte, Word, DWord) 만큼 읽어와 EAX에 복사한다. 
  - ESI는 복사한만큼 이동한다.


- STOS, STOSB, STOSW, STOSD(Store String Byte, Word, DWord) 
  - EAX에 들어이있는 데이터를 지정한 크기만큼 EDI가 가르키는 주소에 복사한다. 
  - EDI는 복사된 만큼 이동한다.


- CLD(Clear Direction flag), STD(Set Direction flag) 
  - Direction Flag를 Set하거나 Clear할때 사용한다.


- CMC(Complement Carry flag), CLC(Clear Carry flag), STC(Set Carry flag) 
  - Carry flag를 순서대로 반전, Clear, Set시킨다.


- SHL <Destination>, <Value> 
  - Shift Logical Left. 
  - <Destination>에 <Value>만큼 Shift연산을 왼쪽으로 수행한다. 만약 <Destination>보다 커질경우 CF=1이 된다.

- SHR <Destination>, <Value> 
  - Shift Logical Right. 
  - SHL과 기능은 동일하며 Shift연산이 오른쪽으로 진행된다.

 ROL <Destination>, <Value> 
  - Rotate Left. SHL과 기능은 동일하다. 
  - 단지 자리수가 늘어날경우 해당 비트가 오른쪽 끝으로 이동한다.

- ROR <Destination>, <Value> 
  - Rotate Reft. SHR과 기능은 동일하다. 
  - 단지 자리수가 없어질경우 해당 비트가 왼쪽 끝으로 이동한다.
---

1. 나눗셈 연산의 피젯수는(32bit의 나눗셈을 가정) 항상 edx:eax 이다.
2. cdq 는 나눗셈을 위해 피젯수의 사이즈를 확장하는 것이다.


나눗셈연산(div, idiv)은 eax와 edx에 의해서만 이루어집니다
- 피젯수(나눔을 당하는 수) 는 eax, edx에만 들어갈 수 있다는 얘기에요
16 / 5 연산을 한다고 가정해 봅시다.

16과 5 둘다 32bit data라고 가정하구요

그럼 일단 eax에 16을 넣습니다. 그 다음 ebx(다른레지스터나 메모리도 상관없음)에

5를 넣습니다. 그 다음 div 연산을 하면.........될것 같지만 안됩니다..

일반적으로 제수(여기서는 5)가 32bit이면 피젯수(여기서는 16) 는 64bit가 되어야

32bit 값을 가지는 몫을 얻을 수 있습니다.

그래서 피젯수의 bit를 확장 시켜주는것이 바로 cdq 연산입니다

32bit 크기의 eax의 값을 64bit의 값인 edx:eax로 만들어줍니다.

여기서 edx는 상위자리가되고 eax는 하위 자리가 되죠

자..그럼 cdq 연산까지 끝났으면 edx:eax에 16이 들어가있고 ebx에 5가 들어있겠네요

그럼 idiv연산을 해봅시다(div는 부호가없는 나눗셈 idiv 부호가 있는 나눗셈)

그럼 몫과 나머지가 나와야 하겠죠? 그 결과는 다시 eax와 edx로 들어가는데

eax에는 몫이, edx에는 나머지 부분이 들어갑니다~

LoadLibrary GetProcAddress (로드 라이브러리 겟프락어드레스) 후에 변하지 않는 레지스터는
EBX EBP ESI EDI 이다. EAX, ECX, EDX 가 변한다
