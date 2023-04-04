#include <assert.h>
#include <stdlib.h>  //exit, malloc, free
#include <stdio.h>   //perror, printf
#include <string.h>  //strlen

#include "tri_tab_de_string.h"
#include "fichier.h" //nb_lignes_fichier


#define MIN(a, b) ((a) < (b) ? a : b)

int compare_string_pour_qsort(const void *a, const void *b)
{
    //    http://www.bien-programmer.fr/qsort.htm
    const char *const *pa = a;
    const char *const *pb = b;
    // return strcmp (*pa, *pb);

    int sa = strlen(a);
    int sb = strlen(b);
    // printf("%d  %d\n", strlen(a), strlen(b));
    if (sa != sb)
        return (sa - sb);
    // return (sb - sa);
    else
        return strcmp(a, b);
}

char *malloc_et_copie_string(const char *source)
{
    // https://koor.fr/C/cstdlib/malloc.wp
    assert(source != NULL);

    size_t l = strlen(source) + 1;
    char *dest = (char *)malloc(sizeof(char) * l);
    if (dest == NULL)
    {
        perror("copie_string malloc !!");
        exit(1);
    }
    return strcpy(dest, source);
}

Tab_de_string *Tab_de_string_creer(int n)
{
    assert(n > 0);

    Tab_de_string *ts = (Tab_de_string *)malloc(sizeof(Tab_de_string));

    if (ts == NULL)
    {
        perror("Tab_de_string *ts malloc !!");
        exit(1);
    }
    char **t = (char **)malloc(sizeof(char *) * n);
    if (t == NULL)
    {
        perror("Tab_de_string_creer char **t malloc !!");
        exit(1);
    }
    for (int i = 0; i < n; i++)
    {
        t[i] = NULL; // de type char *
    }
    ts->t = t;
    ts->n = n;

    return ts;
}

void Tab_de_string_free(Tab_de_string **ts)
{
    assert((ts != NULL) && (*ts != NULL));
    int n = (*ts)->n;
    // printf("\n---->free n : %d\n", (*ts)->n);

    // libérer chaque éléments du tab
    for (int i = 0; i < n; i++)
    {
        // char **p = &((*ts)->t[i]); // ou bien &(*ts)->t[i];
        // free(*p);                  // free(NULL) OK
        // *p = NULL;                 // oui sera modifié

        // char *p = (*ts)->t[i];
        // free(p);  // supprimera bien (valgrind OK)
        // p = NULL; // FAUX ne sera pas modifié

        free((*ts)->t[i]); // free(NULL) OK
        // (*ts)->t[i] = NULL; // sera mis à NULL
    }
    free((*ts)->t);
    free(*ts);
    *ts = NULL;
    // if (ts == NULL)
    //     puts("ts == NULL");
    // if (ts->t == NULL)
    //     puts("ts == NULL");
    // if (ts->t[0] == NULL)
    //     puts("ts->t[0] == NULL");
}

Tab_de_string *Tab_de_string_free_2(Tab_de_string *ts)
{
    assert(ts != NULL);
    int n = ts->n;

    // printf("\n---->free n : %d\n", ts->n);

    // libérer chaque éléments du tab
    for (int i = 0; i < n; i++)
    {
        free(ts->t[i]); // free(NULL) OK
        ts->t[i] = NULL;
    }
    free(ts->t); // libérer le tab
    ts->t = NULL;

    free(ts); // libérer la structure
    return NULL;
}

void Tab_de_string_affiche(Tab_de_string *ts, int m)
{
    assert(ts != NULL);
    assert(m > 0);
    int min_ = MIN(ts->n, m);
    int i = 0;
    //    printf("voir \n");
    char **t = ts->t;
    printf("[ ");
    for (; i < min_ - 1; i++)
    {
        printf("%s, ", t[i]); // de type char *
    }
    if (ts->n > m)
        printf("%s ... ", t[i]);
    else
        printf("%s ", t[i]);
    printf(" ]");
    puts("");
}

Tab_de_string *Tab_de_string_remplir_avec_fichier(const char *nf)
{
    assert(nf != NULL);
    int p = nb_lignes_fichier(nf);
    assert(p > 0);
    Tab_de_string *ts = Tab_de_string_creer(p);
    char str[BUFSIZ];
    int y = 0;
    FILE *file = fopen(nf, "r");
    char **t = ts->t;
    // !!!! Vérifier normalement que fscanf ne lit pas un truc + grand que BUFSIZ
    // https://stackoverflow.com/questions/3463426/in-c-how-should-i-read-a-text-file-and-print-all-strings
    if (file)
    {
        while (fscanf(file, "%s", str) != EOF)
        {
            t[y] = malloc_et_copie_string(str);
            // ts->t[y] = malloc_et_copie_string(str);
            // printf("\n--------->y:%d   %s\n", y, str);
            y++;
        }
        // printf("\n--------->y:%d\n", y);
        fclose(file);
    }
    else
    {
        perror("fopen");
        exit(1);
    }
    return ts;
}
