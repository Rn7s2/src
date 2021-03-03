#include <stdio.h>
#include <string.h>
#include <stdlib.h>

FILE* out;

inline double f(double x)
{
    return (7 * x - 2) / (x + 4);
}

void print(int x, double a)
{
    if(x > 100)
        return;
    double tmp = f(a);
    if(x % 2)
        fprintf(out, "%lf %lf\n", a, tmp);
    else
        fprintf(out, "%lf %lf\n", tmp, a);
    print(x + 1, tmp);
}

int main()
{
    out = fopen("data.txt", "w+");
    print(1, 3.0);    
    fclose(out);
    return 0;
}
