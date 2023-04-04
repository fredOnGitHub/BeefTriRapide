#ifndef TRI_TAB_DE_INTE_H
#define TRI_TAB_DE_INTE_H

#include "tri_int.h"

#define MIN(a, b) ((a) < (b) ? a : b)

struct Tab_de_int_
{
    int *t;
    int n;
};

typedef struct Tab_de_int_ Tab_de_int;

Tab_de_int *Tab_de_int_creer(int n);

Tab_de_int *Tab_de_int_free(Tab_de_int *ti);

void Tab_de_int_affiche(Tab_de_int *tdi, int m);

Tab_de_int *Tab_de_int_remplir_avec_fichier(const char *nf);

int compare(void const *a, void const *b);

#endif