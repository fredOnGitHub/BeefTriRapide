#include "tri_tab_de_int.h"
#include "fichier.h" //nb_lignes_fichier

#include <assert.h>
#include <stdio.h>  //perror
#include <stdlib.h> //exit, malloc, free

Tab_de_int *Tab_de_int_creer(int n)
{
    assert(n > 0);

    Tab_de_int *tdi = (Tab_de_int *)malloc(sizeof(Tab_de_int));
    assert(tdi != NULL);

    tdi->t = (int *)malloc(sizeof(int) * n);
    assert(tdi->t != NULL);

    for (int i = 0; i < n; i++)
    {
        tdi->t[i] = 11;
    }
    tdi->n = n;

    // int *t = (int *)malloc(sizeof(int) * n);
    // assert(t != NULL);
    // for (int i = 0; i < n; i++)
    // {
    //     t[i] = 0;
    // }
    // tdi->t = t;
    return tdi;
}

Tab_de_int *Tab_de_int_free(Tab_de_int *ti)
{
    free(ti->t);
    ti->t = NULL;

    free(ti); // free(NULL) OK
    ti = NULL;
    return NULL;
    // if (TI == NULL)
    //     puts("TI == NULL");
    // if (TI->t == NULL)
    //     puts("TI->t == NULL");
}

void Tab_de_int_affiche(Tab_de_int *tdi, int m)
{
    assert(tdi != NULL);
    assert(tdi->t != NULL);
    assert(m > 0);

    int min_ = MIN(tdi->n, m);
    int i = 0;
    int *pt = tdi->t;
    printf("[ ");
    for (; i < min_ - 1; i++)
    {
        printf("%d, ", pt[i]);
    }
    if (tdi->n > min_)
        printf("%d ... ", pt[i]);
    else
        printf("%d ", pt[i]);
    printf(" ]");
    puts("");
}

Tab_de_int *Tab_de_int_remplir_avec_fichier(const char *nf)
{
    assert(nf != NULL);
    int p = nb_lignes_fichier(nf);
    assert(p > 0);
    Tab_de_int *pti = Tab_de_int_creer(p);
    char str[BUFSIZ];
    int y = 0;
    FILE *file = fopen(nf, "r");
    // !!!! Vérifier normalement que fscanf ne lit pas un truc + grand que BUFSIZ
    // https://stackoverflow.com/questions/3463426/in-c-how-should-i-read-a-text-file-and-print-all-strings
    int *t = pti->t;
    if (file)
    {
        while (fscanf(file, "%s", str) != EOF)
        {
            // https://koor.fr/C/cstdlib/atoi.wp
            // ATTENTION:la fonction atoi retourne la valeur 0 si la chaîne de caractères ne contient pas une représentation de valeur numérique.
            t[y] = atoi(str);
            y++;
        }
        fclose(file);
        // printf("------------>%d\n", y);
    }
    else
    {
        perror("fopen");
        exit(1);
    }
    return pti;
}

int compare(void const *a, void const *b) 
{
    // http://www.bien-programmer.fr/qsort.htm
    // https://koor.fr/C/cstdlib/qsort.wp 

    int pa = *(const int *)a;
    int pb = *(const int *)b;
    return pa - pb;
    
    // int const *pa = a;marche pas ici
    // int const *pb = b;
    /* evaluer et retourner l'etat de l'evaluation (tri croissant) */
    // return *pa - *pb;
}
