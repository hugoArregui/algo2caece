#include <stdio.h>
#include <stdlib.h>

typedef struct tnodo 
{
    int nat;
    struct tnodo *sig;
} Nodo;

typedef Nodo* Lista;

void emptyList(Lista* plist);
int conslist(int n, Lista* plist);
int isEmptyList(Lista plist);
void head(Lista list, int *pn);
int tail(Lista* plist);
int replaceHead(Lista* plist, int n);
void destroyList(Lista* plist);
void copyList(Lista olist, Lista *pLista);
void consAtras(Lista* plist, int n);
void showList(Lista plist);

int main() {
    Lista list;
    emptyList(&list);
    consList(1, &list);
    consList(2, &list);
    consList(3, &list);
    consList(4, &list);
    consList(5, &list);
    consList(6, &list);
    consList(7, &list);
    consList(8, &list);
    consList(9, &list);
    consList(10, &list);
    showList(list);
    return 0;
}

void emptyList(Lista* plist) {
    *plist = NULL;
}

int consList(int n, Lista* plist) {
    Nodo * pnodo;
    if ((pnodo = (Nodo*)malloc(sizeof(Nodo*))) == NULL) {
        return 0;
    }
    pnodo->nat = n;
    pnodo->sig = *plist;
    *plist = pnodo;
    return 1;
}

int isEmptyList(Lista plist) {
    return plist == NULL;
}

void head(Lista list, int *pn) {
    if (isEmptyList(list))
        pn = NULL;
    else
        *pn = list->nat;
}

int tail(Lista* plist) {
    if (isEmptyList(*plist))
        return 0;
    *plist = (*plist)->sig;
    return 1;
}

int replaceHead(Lista* plist, int n) {
    if (isEmptyList(*plist))
        return 0;
    (*plist)->nat = n;
    return 1;
}

void destroyList(Lista* plist) {
    Lista ls;
    while (*plist != NULL) {
        ls = (*plist)->sig;
        free(*plist);
        *plist = ls;
    }
}

void copyList(Lista lis, Lista *plist) {
    Lista laux;
    int h;
    laux = lis;
    emptyList(plist);
    while (!isEmptyList(laux)) {
        head(laux, &h);
        tail(&laux);
        consAtras(plist, h);
    }
}

void consAtras(Lista* xlist, int n) {
    Lista ylist, zlist;
    ylist = *xlist;
    zlist = NULL;
    while (!isEmptyList(ylist)) {
        zlist = ylist;
        tail(&ylist);
    }
    if (zlist == NULL) {
        consList(n, xlist);
    } else {
        consList(n, &ylist);
        zlist->sig = ylist;
    }
}

void showList(Lista list) {
    Nodo* pnodo;
    pnodo = list;
    printf("[  ");
    while (pnodo != NULL) {
        printf("%d ", pnodo->nat);
        pnodo = pnodo->sig;
    }
    printf("]\n");
}
