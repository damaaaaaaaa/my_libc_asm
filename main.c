#include "include/my_libc.h"

int main () {

    char *str = "ciolino";
    char carattere = 'c';
    int num_neg = -3;
    unsigned int u_int = 10;
    long int long_int = 20;
    unsigned long long long_long_u_int = 30;

    my_printf ("numero: %d, stringa: %s, carattere: %c\n", num_neg, str, carattere);
    my_printf ("ciao ciolini\nop easy cola\n");   
    my_printf ("il numero unsigned e': %u\n", u_int);

    my_printf ("long: %ld\n", long_int);
    my_printf ("long long unsigned: %llu\n", long_long_u_int);

    my_printf ("prova stampa percentuale: %%5, %v \n");

    return 0;
}



