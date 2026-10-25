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
    
    return 0;
}
