#include <stdio.h>
#include <stdlib.h>
#include "include/my_libc.h"

int main () {

    char* str = "ciolins";
    size_t len = my_strlen (str);
    printf("\nLa lunghezza della stringa %s e': %ld", str, len);

    return 0;
}
