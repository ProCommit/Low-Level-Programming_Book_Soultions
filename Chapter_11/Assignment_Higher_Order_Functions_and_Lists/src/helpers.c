#include "helpers.h"

int returnMinimal(int x, int y)
{

    return (x < y) ? x : y;
}

int returnMaximal(int x, int y)
{
    return (x > y) ? x : y;
}

int sum(int x, int y)
{
    return x + y;
}

int squer(int val)
{
    return val * val;
}

int cube(int val)
{
    return val * val * val;
}

void printWithSpace(int val)
{
    printf("%d ", val);
}

void printWithNewline(int val)
{
    printf("%d\n", val);
}

int multi2(int val)
{
    return val * 2;
}
