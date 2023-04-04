#  triRapide.py

#  Created by fredOnGithub on 02/2023.

#  Compilation et exécution :
#  clear; python tri_rapide.py ;

nb_de_permutations = 0

def partition(arr, start, end):
    # print(arr, start, end)
    # print("partition", start, end)
    global nb_de_permutations
    pivotValue = arr[end]
    pivotIndex = start
    for i in range(start, end):  # end n'est pas pris en compte
        if arr[i] < pivotValue:
            # print(arr[i], " < ", pivotValue)
            arr[i], arr[pivotIndex] = arr[pivotIndex], arr[i]
            nb_de_permutations += 1
            pivotIndex += 1
    arr[pivotIndex], arr[end] = arr[end], arr[pivotIndex]
    nb_de_permutations += 1
    return pivotIndex


def quickSort(arr, start, end):
    # print(arr, start, end)
    if start < end:
        pivotIndex = partition(arr, start, end)
        # print(pivotIndex, start, end)
        quickSort(arr, start, pivotIndex - 1)
        quickSort(arr, pivotIndex + 1, end)


def tri_rapide(t):
    quickSort(t, 0, len(t) - 1)
    return t


def affiche_jusqua(t, n):
    for i in range(0, min(len(t), n)):
        print(t[i], end=" ")
    print()


def fichier_ds_tab_de_str(fich_txt):
    of = open(fich_txt)  # r par défaut
    return of.read().splitlines()


def tab_de_str_en_int(t):
    r = []
    for i in range(0, len(t)):
        r.append(int(t[i]))
    return r


def tri_ce_tab(t, fonction):
    t = fonction(t)
    return t
