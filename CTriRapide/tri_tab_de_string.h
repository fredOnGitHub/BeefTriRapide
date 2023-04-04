#ifndef TRI_TAB_DE_STRING_H
#define TRI_TAB_DE_STRING_H
 
struct Tab_de_string_
{
    char **t;
    int n;
};

typedef struct Tab_de_string_ Tab_de_string;

int compare_string_pour_qsort(const void *a, const void *b);

char *malloc_et_copie_string(const char *source);

Tab_de_string *Tab_de_string_creer(int n);

void Tab_de_string_free(Tab_de_string **ts);

Tab_de_string *Tab_de_string_free_2(Tab_de_string *ts);

void Tab_de_string_affiche(Tab_de_string *ts, int m);

Tab_de_string *Tab_de_string_remplir_avec_fichier(const char *nf);

#endif
