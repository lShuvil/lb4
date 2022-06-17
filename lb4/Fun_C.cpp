#include <math.h>


extern "C" float fun_el(float x)
{
	float rez;
	rez = ((1 / tan(x)) + cos(x)) / exp(x);//при 0 будет бесконечность
	return rez;
}
