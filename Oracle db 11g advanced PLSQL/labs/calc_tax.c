#include <ctype.h>
int calc_tax(int n) {
	int tax;
	tax = (n*8)/100;
	return(tax);
}