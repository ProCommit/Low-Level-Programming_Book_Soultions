#include <stdio.h>
#include <stdlib.h>


typedef struct Node{
    int val;
    struct Node* nextNode;
}Node;


Node *crateNode(Node* nNode,int value);
int forEach(Node *startNode,void (*fun)(int));
void printWithNewline(int val);
void printWithSpace(int val);
