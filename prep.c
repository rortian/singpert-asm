
#include <math.h>
#include <stdlib.h>

extern void m2n1();

extern void m2n2();

void pertubations(int m,int n,double real,double imag,double xinit,double yinit,double deltax,double deltay,int x,int y,char *array){
	switch(m){
		case 2:
			switch(n){
				case 1:
					m2n1(real,imag,xinit,yinit,deltax,deltay,x,y,array);
					break;
				case 2:
					m2n2(real,imag,xinit,yinit,deltax,deltay,x,y,array);
					break;
			}
			break;
	}
}


int main(){
	char *c;
	char hi,there;
	
	c = malloc((100*100+8)*sizeof(char));
	pertubations(2,1,0.18,0.02,-0.65,-0.65,0.01,0.01,25,25,c);
	hi = c[0];
	there = c[1];
	return 0;
}