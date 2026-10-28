#include <stdio.h>
#include <stdlib.h>
#include "include/my_libc.h"

int main () {

    char* str = "ciolins";
    size_t len = my_strlen (str);
    printf("La lunghezza della stringa %s e': %ld", str, len);

    const char *src = "easycola";
    my_printf ("stringa src: %s\n", src);
    char *dest = malloc (10 * sizeof (char));
    char *new_string = my_strcpy (dest, src);
    my_printf ("La stringa copiata e': %s\n", new_string);

    const char *src2 = "easycola";
    my_printf ("La stringa src e': %s\n", src2);
    char *dest2 = malloc (10 * sizeof (char));
    char *new_string2 = my_memcpy (dest2, src2, 8);
    printf ("\nLa stringa copiata e': %s\n", new_string2);

    const char *src3 = "easycola";
    my_printf ("La stringa src e': %s\n", src3);
    char *dest3 = malloc (10 * sizeof (char));
    char *new_string3 = my_memcpy (dest3, src3, 8);
    printf ("La stringa copiata e': %s\n", new_string3);

    char *stringa_da_stampare = "ciao ciolini";
    my_printf ("La stringa digitata dall'utente e': %s\n", stringa_da_stampare);

    int num = 5;
    my_printf ("il numero stampato e': %d", num);
    
    return 0;
}
