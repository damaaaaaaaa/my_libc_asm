#include <stdio.h>
#include <stdlib.h>
#include "include/my_libc.h"

int main () {

    char* str = "ciolins";
    size_t len = my_strlen (str);
    printf("\nLa lunghezza della stringa %s e': %ld", str, len);

    const char *src = "easycola";
    printf ("\nstringa src: %s", src);
    char *dest = malloc (10 * sizeof (char));
    char *new_string = my_strcpy (dest, src);
    printf ("\nLa stringa copiata e': %s", new_string);

    const char *src2 = "easycola";
    printf ("\nLa stringa src e': %s", src2);
    char *dest2 = malloc (10 * sizeof (char));
    char *new_string2 = my_memcpy (dest2, src2, 8);
    printf ("\nLa stringa copiata e': %s", new_string2);

    const char *src3 = "easycola";
    printf ("\nLa stringa src e': %s", src3);
    char *dest3 = malloc (10 * sizeof (char));
    char *new_string3 = my_memcpy (dest3, src3, 8);
    printf ("\nLa stringa copiata e': %s", new_string3);
    
    return 0;
}
