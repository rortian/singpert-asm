
#include <math.h>
#include <stdlib.h>

extern void sweet();


int main(){
	double x;
	double *z;
	x = 5;
	
	z = malloc(8*4);
	z[0] = 1.0;
	z[1] = 0.5;
	z[2] = 0.002;
	z[3] = 0.125;
	
	sweet(1.0,0.5,0.002,0.125);
}