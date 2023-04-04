#include "fichier.h"

#include <stdio.h>   //printf FILE BUFFSIZ
#include <stdlib.h>  //malloc qsort exit
#include <string.h>  // strlen strcmp
// #include <assert.h>


int nb_lignes_fichier(const char *n)
{
    int r = 0;
    char str[BUFSIZ];
    FILE *file;
    file = fopen(n, "r");
    if (file)
    {
        while (fscanf(file, "%s", str) != EOF)
        {
            r++;
        }
        fclose(file);
    }
    else
    {
        perror("fopen");
        exit(1);
    }
    return r;
}

const char *repertoire_courant(char *c)
{
    const char *homedir;
    homedir = getenv(c);
    if (!homedir)
    {
        printf("homedir : %s NULL", homedir);
        exit(1);
    }
    // printf("homedir : %s",homedir);
    return homedir;
}