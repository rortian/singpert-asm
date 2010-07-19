


extern void m2n1();

void pertubations(int m,int n,double real,double imag,double xinit,double yinit,double deltax,double deltay,int x,int y,char *array){
	switch(m){
		case 2:
			switch(n){
				case 1:
					m2n1(real,imag,xinit,yinit,deltax,deltay,x,y,array);
					break;
			}
			break;
	}
}


