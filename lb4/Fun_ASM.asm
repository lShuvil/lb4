.586
.MODEL flat, C
.DATA
SUM DD 0.0
i_local DD 0

count dd 11

.CODE
extern fun_el:near; объ€вление внешней функции fun_el
public SumR
SumR proc C
push ebp;
mov ebp, esp;

mov esi, [ebp + 8]; поместили адрес массива со значени€ми от 0 до 1 с шагом 0.1

L1:
mov ebx, i_local; помещаем счЄтчик в ebx
push dword ptr[esi + ebx * 4]; передаЄм в fun_el текущий элемент массива
call fun_el;
fld SUM;
fadd;
fstp SUM;
mov ecx, SUM;
mov[esi + ebx * 4], ecx; замен€ем значение в массиве

; обнул€ем переменные
mov SUM, 0;
xor ecx, ecx;
xor ebx, ebx;


inc i_local;
mov ebx, i_local;
mov ecx, count;
cmp ebx, ecx; если счЄтчик не равен числу итераций, то продолжаем цикл
jne L1;

mov eax, esi; помещаем адрес массива дл€ возврата
mov esp, ebp
pop ebp
ret
SumR endp
End
