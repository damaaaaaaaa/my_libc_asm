#include <stdio.h>
#include <stdlib.h>
#include "include/my_libc.h"

int main () {

    char *str = "ciolino";
    char carattere = 'c';
    int num_neg = -3;

    my_printf ("numero: %d, stringa: %s, carattere: %c\n", num_neg, str, carattere);
    my_printf ("\nciao ciolini\nop easy cola\n");   

    return 0;
}



