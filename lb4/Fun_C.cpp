#include <math.h>


extern "C" float fun_el(float x)
{
	float rez;
	rez = ((1 / tan(x)) + cos(x)) / exp(x);//��� 0 ����� �������������
	return rez;
}
