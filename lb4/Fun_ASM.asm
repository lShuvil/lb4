.586
.MODEL flat, C
.DATA
SUM DD 0.0
i_local DD 0

count dd 11

.CODE
extern fun_el:near; ���������� ������� ������� fun_el
public SumR
SumR proc C
push ebp;
mov ebp, esp;

mov esi, [ebp + 8]; ��������� ����� ������� �� ���������� �� 0 �� 1 � ����� 0.1

L1:
mov ebx, i_local; �������� ������� � ebx
push dword ptr[esi + ebx * 4]; ������� � fun_el ������� ������� �������
call fun_el;
fld SUM;
fadd;
fstp SUM;
mov ecx, SUM;
mov[esi + ebx * 4], ecx; �������� �������� � �������

; �������� ����������
mov SUM, 0;
xor ecx, ecx;
xor ebx, ebx;


inc i_local;
mov ebx, i_local;
mov ecx, count;
cmp ebx, ecx; ���� ������� �� ����� ����� ��������, �� ���������� ����
jne L1;

mov eax, esi; �������� ����� ������� ��� ��������
mov esp, ebp
pop ebp
ret
SumR endp
End
