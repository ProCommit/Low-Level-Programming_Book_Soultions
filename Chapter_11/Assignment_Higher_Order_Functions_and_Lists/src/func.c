#include "funcs.h"


int boolDerialize(Node **lst,const char *fileName)
{
    FILE *f;
    f = fopen(fileName,"rb");
    if (f == NULL)
    {
        return 1;
    }

    Node *newLst =  crateList();
    int x;
    while (fread(&x,sizeof(int),1,f) == 1)
    {   
        newLst = crateNode(newLst,x);
    }
    fclose(f);

    *lst = newLst;
    return 0;
}

int boolSerialize(Node *lst,const char *fileName)
{
    FILE *f;
    f = fopen(fileName,"wb");
    if (f == NULL)
    {
        return 1;
    }

    int x;
    while (lst != NULL)
    {   
        x = lst->val;
        fwrite(&x,sizeof(int),1,f);
        lst = lst->nextNode;
    }

    fclose(f);

    return 0;
}


int boolLoad(Node **ptrLst, const char *fileName)
{
    FILE *f;
    f = fopen(fileName, "r");
    if (f == NULL)
    {
        return 1;
    }
    Node *newList = crateList();

    int x;
    while (fscanf(f, "%d", &x) == 1)
    {
        newList = crateNode(newList, x);
    }
    *ptrLst = newList;
    fclose(f);

    return 0;
}

int boolSave(Node *lst, const char *fileName)
{
    FILE *fptr;
    fptr = fopen(fileName, "w");
    if (fptr == NULL)
    {
        return 1;
    }

    while (lst != NULL)
    {
        fprintf(fptr, "%d ", lst->val);
        lst = lst->nextNode;
    }

    fclose(fptr);

    return 0;
}

Node *map(Node *list, int (*fun)(int))
{
    Node *listStartPoint = crateList();
    int tmp;
    while (list != NULL)
    {
        tmp = list->val;
        tmp = fun(tmp);

        listStartPoint = crateNode(listStartPoint, tmp);
        list = list->nextNode;
    }

    return listStartPoint;
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


Node *crateList()
{
    Node *startList = NULL;
    return startList;
}

Node *crateNode(Node *nNode, int value)
{
    Node *new = malloc(sizeof(Node));
    new->val = value;
    new->nextNode = nNode;
    return new;
}

Node *map_mut(Node *list, int (*fun)(int))
{
    int tmp;
    while (list != NULL)
    {
        tmp = list->val;
        tmp = fun(tmp);

        list->val = tmp;
        list = list->nextNode;
    }

    return list;
}

Node *itrate(int numberOfNodes, int startVal, int (*f)(int))
{
    Node *list = crateList();
    int tmp = startVal;
    for (int i = 0; i < numberOfNodes; i++)
    {
        tmp = f(tmp);
        list = crateNode(list, tmp);
    }

    return list;
}

int foldl(int a, int (*f)(int x, int acc), Node *list)
{
    int acculaor = a;
    while (list != NULL)
    {
        acculaor = f(list->val, acculaor);
        list = list->nextNode;
    }
    return acculaor;
}