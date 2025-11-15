#include "headers.h"

Node *lastNode = NULL;

int main(void)
{
    char buff[256];
    char tmp[21];
    int a = 0;
    int intTmp = 0;

    printf("Enter numbers to crate linking list: ");
    scanf("%20[^ֿ\n]", buff);
    
    while (buff[a] != '\0')
    {
        if(a > 0)
        {
            a++;
        }

        for (int i = 0; buff[a] != ' ' && buff[a] != '\0'; i++)
        {
            tmp[i] = buff[a++];
            intTmp = i+1;
        }
        tmp[intTmp++] = '\0';
        intTmp = atoi(tmp);
        crateNode(lastNode, intTmp);
    }

    forEach(lastNode, printWithSpace);
    puts("");
    forEach(lastNode, printWithNewline);
    puts("");
    

    return 0;
}

int forEach(Node *startNode, void (*fun)(int))
{
    while (startNode != NULL)
    {
        fun(startNode->val);
        startNode = startNode->nextNode;
    }

    return 0;
}

void printWithSpace(int val)
{
    printf("%d ", val);
}

void printWithNewline(int val)
{
    printf("%d\n", val);
}

Node *crateNode(Node *nNode, int value)
{
    Node *new = malloc(sizeof(Node));
    new->val = value;
    new->nextNode = nNode;
    lastNode = new;
    return new;
}