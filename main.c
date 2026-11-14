#include "include/my_libc.h"

int main () {

    char *str = "ciolino";
    char carattere = 'c';
    int num_neg = -3;
    unsigned int u_int = 10;
    unsigned int u_int_2 = -10;

    my_printf ("numero: %d, stringa: %s, carattere: %c\n", num_neg, str, carattere);
    my_printf ("\nciao ciolini\nop easy cola\n");   
    my_printf ("il numero unsigned e': %u\n", u_int);

    return 0;
}



