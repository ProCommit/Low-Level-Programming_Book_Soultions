#include "app.h"

int main(void)
{
    char buff[256];
    char tmp[21];
    int a = 0;
    int intTmp = 0;

    Node *lastNode = crateList();

    printf("Enter numbers to crate linking list: ");
    scanf("%20[^ֿ\n]", buff);

    while (buff[a] != '\0')
    {
        if (a > 0)
        {
            a++;
        }

        for (int i = 0; buff[a] != ' ' && buff[a] != '\0'; i++)
        {
            tmp[i] = buff[a++];
            intTmp = i + 1;
        }
        tmp[intTmp++] = '\0';
        intTmp = atoi(tmp);
        lastNode = crateNode(lastNode, intTmp);
    }

    /*
    3.
    forEach(lastNode, printWithSpace);
    puts("");
    forEach(lastNode, printWithNewline);
    */

    /*
    4.
    Node *newLst = map(lastNode,squer);
    newLst = map(lastNode,cube);
    */

    /*
    5.
    int s = foldl(0, sum, lastNode);
     int m = foldl(lastNode->val, returnMinimal, lastNode);
     int x = foldl(0, returnMaximal, lastNode);
     printf("sum = %d, min = %d, max = %d\n", s, m, x);
    */

    /*
    6.
    map_mut(lastNode,squer);
    forEach(lastNode,printWithSpace);
    puts("");
    */

    /*
    7.
    Node *newList10 = itrate(10,1,multi2);
    forEach(newList10,printWithSpace);
    puts("");
    */

    /*
    8.
    boolLoad(&lastNode, "test.txt");
    */

    /*
    9.
    boolSave(lastNode,"test2.txt");
    */

    /*
    11.
    boolSerialize(lastNode,"binfile");
    */
    

    /*
    12.
    boolDerialize(&lastNode,"binfile");
    */

    return 0;
}
