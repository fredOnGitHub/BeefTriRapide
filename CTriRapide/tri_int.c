#include "tri_int.h"

#include <assert.h>

int inb_echange = 0;

void iechanger(int *A, int a, int b)
{
    inb_echange++;
    int temp = A[a];
    A[a] = A[b];
    A[b] = temp;
}

int icompare_fait_main(int a, int b)
{
    return (a - b);
}

// Lomuto partition scheme
int ipartition_dernier_elt(int *A, int lo, int hi)
{
    int pivot_value = A[hi];
    int pivot_index = lo;
    for (int i = lo; i < hi; i++)
    {
        // int u = FAST_STRCMP_2(A[i], pivot_value);
        // printf("u = %d\n", u);
        // if (u < 0)
        if (icompare_fait_main(A[i], pivot_value) < 0)
        {
            iechanger(A, i, pivot_index);
            pivot_index += 1;
        }
    }
    iechanger(A, hi, pivot_index);
    return pivot_index;
}
void iquicksort_dernier_elt(int *A, int lo, int hi)
{
    if (lo < hi)
    {
        int p = ipartition_dernier_elt(A, lo, hi);
        iquicksort_dernier_elt(A, lo, p - 1);
        iquicksort_dernier_elt(A, p + 1, hi);
    }
}
void itrie(int *t, int n)
{
    assert(t);
    assert(n > 0);
    iquicksort_dernier_elt(t, 0, n - 1);
}
