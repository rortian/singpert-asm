

#include <math.h>
#include <stdlib.h>



extern void m2n1();


extern void m2n2();


extern void m2n3();


extern void m2n4();


extern void m3n1();


extern void m3n2();


extern void m3n3();


extern void m4n1();


extern void m4n2();


extern void m4n4();




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
				
				
				case 3:
					m2n3(real,imag,xinit,yinit,deltax,deltay,x,y,array);
					break;
				
				
				case 4:
					m2n4(real,imag,xinit,yinit,deltax,deltay,x,y,array);
					break;
				
			}
			break;
		
		case 3:
			switch(n){
				
				
				case 1:
					m3n1(real,imag,xinit,yinit,deltax,deltay,x,y,array);
					break;
				
				
				case 2:
					m3n2(real,imag,xinit,yinit,deltax,deltay,x,y,array);
					break;
				
				
				case 3:
					m3n3(real,imag,xinit,yinit,deltax,deltay,x,y,array);
					break;
				
			}
			break;
		
		case 4:
			switch(n){
				
				
				case 1:
					m4n1(real,imag,xinit,yinit,deltax,deltay,x,y,array);
					break;
				
				
				case 2:
					m4n2(real,imag,xinit,yinit,deltax,deltay,x,y,array);
					break;
				
				
				case 4:
					m4n4(real,imag,xinit,yinit,deltax,deltay,x,y,array);
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
	
	pertubations(2,2,0.18,0.02,-0.65,-0.65,0.01,0.01,25,25,c);
	hi = c[0];
	there = c[1];
	
	pertubations(2,3,0.18,0.02,-0.65,-0.65,0.01,0.01,25,25,c);
	hi = c[0];
	there = c[1];
	
	pertubations(2,4,0.18,0.02,-0.65,-0.65,0.01,0.01,25,25,c);
	hi = c[0];
	there = c[1];
	
	
	
	pertubations(3,1,0.18,0.02,-0.65,-0.65,0.01,0.01,25,25,c);
	hi = c[0];
	there = c[1];
	
	pertubations(3,2,0.18,0.02,-0.65,-0.65,0.01,0.01,25,25,c);
	hi = c[0];
	there = c[1];
	
	pertubations(3,3,0.18,0.02,-0.65,-0.65,0.01,0.01,25,25,c);
	hi = c[0];
	there = c[1];
	
	
	
	pertubations(4,1,0.18,0.02,-0.65,-0.65,0.01,0.01,25,25,c);
	hi = c[0];
	there = c[1];
	
	pertubations(4,2,0.18,0.02,-0.65,-0.65,0.01,0.01,25,25,c);
	hi = c[0];
	there = c[1];
	
	pertubations(4,4,0.18,0.02,-0.65,-0.65,0.01,0.01,25,25,c);
	hi = c[0];
	there = c[1];
	
	
	return 0;
}
