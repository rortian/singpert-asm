

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
