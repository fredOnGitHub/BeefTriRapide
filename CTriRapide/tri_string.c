#include "tri_string.h"

#include <string.h> // strlen strcmp
#include <assert.h>

// #define FAST_STRCMP(x, y) (*(x) != *(y) ? ((unsigned char)*(x) - (unsigned char)*(y)) : strcmp((x), (y)))

// #define FAST_STRCMP_2(x, y) ( \
//     strlen(x) != strlen(y) ? strlen(x) - strlen(y) : FAST_STRCMP(x, y))

// printf("\n%d", FAST_STRCMP("10", "9"));
// printf("\n%d", FAST_STRCMP_2("100", "109"));

int nb_echange = 0;

void echanger(char **A, int a, int b)
{
    nb_echange++;
    char *temp = A[a];
    A[a] = A[b];
    A[b] = temp;
}

int compare_fait_main(char *a, char *b)
{
    int sa = strlen(a);
    int sb = strlen(b);
    if (sa != sb)
        return (sa - sb);
    else
        return strcmp(a, b);
}
// Lomuto partition scheme
int partition_dernier_elt(char **A, int lo, int hi)
{
    char *pivot_value = A[hi];
    int pivot_index = lo;
    for (int i = lo; i < hi; i++)
    {
        // int u = FAST_STRCMP_2(A[i], pivot_value);
        // printf("u = %d\n", u);
        // if (u < 0)
        if (compare_fait_main(A[i], pivot_value) < 0)
        {
            echanger(A, i, pivot_index);
            pivot_index += 1;
        }
    }
    echanger(A, hi, pivot_index);
    return pivot_index;
}

void quicksort_dernier_elt(char **A, int lo, int hi)
{
    if (lo < hi)
    {
        int p = partition_dernier_elt(A, lo, hi);
        quicksort_dernier_elt(A, lo, p - 1);
        quicksort_dernier_elt(A, p + 1, hi);
    }
}

void trie_string(char **t, int n)
{
    assert(t);
    assert(n > 0);
    quicksort_dernier_elt(t, 0, n - 1);
}