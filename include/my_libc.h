#ifndef MY_LIBC_H 
#define MY_LIBC_H   

#include <stddef.h>

size_t my_strlen (char *str);

char *my_strcpy (char *dest, char const *src);

char *my_memcpy (char *dest, char const *src, size_t n);

#endif  
