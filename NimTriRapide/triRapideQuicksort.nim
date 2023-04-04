# --------------------------------DEBUT QUICKSORT---------------------------------------
proc partition(arr: var seq[int], start: int, fin: int): int =
    var pivotValue = arr[fin]
    var pivotIndex = start
    for i in start..fin-1: # fin-1 car fin pris en compte (diff de python) 
        # if int(arr[i]) < int(pivotValue):
        if arr[i] < pivotValue:
            swap(arr[i], arr[pivotIndex])
            pivotIndex += 1
    swap(arr[pivotIndex], arr[fin])
    return pivotIndex

proc quickSort(arr: var seq[int], start: int, fin: int) =
    if start >= fin:
        return
    else:
        let pivotIndex = partition(arr, start, fin)
        quickSort(arr, start, pivotIndex - 1)
        quickSort(arr, pivotIndex + 1, fin)
# --------------------------------FIN QUICKSORT---------------------------------------
