#ifndef FUNC_H
#define FUNC_H

#include "node.h"
#include "clib.h"
Node *crateNode(Node* nNode,int value);
Node *crateList();
int forEach(Node *startNode,void (*fun)(int));
Node *map(Node *list,int (*fun)(int));
Node *map_mut(Node *list, int (*fun)(int));
Node *itrate(int numberOfNodes,int startVal,int (*f)(int));
int foldl(int a,int(*f)(int x,int acc),Node *list);
int boolSave(Node *lst, const char *fileName);
int boolLoad(Node **ptrLst,const char *fileName);
int boolSerialize(Node *lst,const char *fileName);
int boolDerialize(Node **lst,const char *fileName);

#endif