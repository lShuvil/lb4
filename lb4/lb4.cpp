#include <iostream>

extern "C" float* SumR(float* n);

int main() {

	float* R = nullptr;
	float* n = new float[11];
	for (int i = 0; i < 11; i++) {
		n[i] = 0.1 * i;
	}
	R = SumR(n);
	std::cout << "Result:\n";
	for (int i = 0; i < 11; i++) {
		std::cout << "R[" << i << "] = " << R[i] << std::endl;
	}
	return 0;
}
