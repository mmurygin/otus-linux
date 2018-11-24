#include "fcgi_stdio.h"
#include <stdlib.h>

int main(void)
{
    int count = 0;
    while (FCGI_Accept() >= 0)
        printf("HTTP/1.1 200 OK\r\n"
               "Content-type: text/html\r\n"
               "\r\n"
               "<title>FastCGI Hello!</title>\n"
               "<h1>FastCGI Hello!</h1>\n"
               "Request number %d\n",
               ++count);

    return 0;
}
