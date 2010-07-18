
#include <math.h>
#include <stdlib.h>

extern void sweet();



int main(){
	char *c;
	char hi,there;
	
	c = malloc((100*100+8)*sizeof(char));
	sweet(0.18,0.02,-0.65,-0.65,0.01,0.01,100,100,c);
	hi = c[0];
	there = c[1];
	return 0;
}