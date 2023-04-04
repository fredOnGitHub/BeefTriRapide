//
//  main.c
//  tri_rapide
//
//  Created by fredOnGithub on 02/2023.

// D'abord avec valgrind pour voir les fuites de mémoires
// pour la dernière version de c de 2018 et voir à quel niveau de l'appel de fonction il y a
// les fuites de mémoires (grâce à l'option de débogage -g -Og)
// clear; sudo gcc -g -Og -std=c18 main.c -o a.out
// puis
// valgrind --leak-check=full ./a.out
// EN résumé
// clear; sudo gcc -g -Og -std=c18 main.c -o a.out; valgrind --leak-check=full ./a.out

// puis on peut alors faire
// clear ; sudo  gcc main.c ; ./a.out > out.tx

// Autre commande plus verbeuse (pas la peine, voir au-dessus qui dit où l'allocation a eu lieu)
// clear ; sudo  gcc main.c ; ./a.out ; valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes ./a.out

// Marche pas sur l'environnement Linux : Measure-Command { ./a.out } > temps.txt
// Sur Linux : time ./a.out

#include "fichier.h"
#include "tri_tab_de_string.h"
#include "tri_string.h"
#include "tri_tab_de_int.h"
#include "tri_int.h"

#include <stdio.h>  //printf puts
#include <time.h>   // clock
#include <stdlib.h> // qsort

int main(int argc, const char *argv[])
{

    Tab_de_string *ts;
    Tab_de_int *TI;
    char *f = NULL;
    clock_t start_t1, start_t2, t3; // typedef long clock_t;
    int n = 0;
    const char *homedir = repertoire_courant("HOME");

    puts("UTF8 ? 日本 éà");
    f = "nombres_aleatoires_50_000.txt";
    n = nb_lignes_fichier(f);
    printf("%d éléments à trier\n", n);

    puts("");

    puts("tab de int");

    TI = Tab_de_int_remplir_avec_fichier(f);
    // Tab_de_int_affiche(TI, 10);

    start_t1 = clock(); // https://www.geeksforgeeks.org/how-to-measure-time-taken-by-a-program-in-c/
    itrie(TI->t, TI->n);
    start_t2 = clock();
    t3 = start_t2 - start_t1;

    printf("Temps mis du tri du tab d'entier en ms : %.0f\n", (double)t3 / CLOCKS_PER_SEC * 1000);
    Tab_de_int_affiche(TI, 10);
    TI = Tab_de_int_free(TI);
    printf("%d permutations\n", inb_echange);

    puts("---------------------------");

    puts("tab de string");

    ts = Tab_de_string_remplir_avec_fichier(f);
    // Tab_de_string_affiche(ts, 10);

    start_t1 = clock();
    trie_string(ts->t, ts->n);
    start_t2 = clock();
    t3 = start_t2 - start_t1;

    printf("Time CPU: %.0f ms\n", (double)t3 / CLOCKS_PER_SEC * 1000);
    Tab_de_string_affiche(ts, 10);
    // ts = Tab_de_string_free_2(ts);
    Tab_de_string_free(&ts);
    printf("%d permutations\n", nb_echange);

    puts("---------------------------");

    puts("tab de int et qsort du système");

    TI = Tab_de_int_remplir_avec_fichier(f);

    // Tab_de_int_affiche(TI, 10);

    start_t1 = clock();
    qsort(TI->t, TI->n, sizeof(int) /**(TI->t)*/, compare);
    start_t2 = clock();
    t3 = start_t2 - start_t1;

    printf("Time CPU: %.0f ms\n", (double)t3 / CLOCKS_PER_SEC * 1000);

    Tab_de_int_affiche(TI, 10);
    TI = Tab_de_int_free(TI);

fin:
    puts("Fin normale");
    return 0;
}