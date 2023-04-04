import sequtils #concat, @
# --------------------------------DEBUT TRI FONCTIONNEL---------------------------------------
# proc quickSort(arr: seq[int]): seq[int] {.discardable.} = #{.discardable.} pour appeler time qui ne prend pas de retour
proc quickSort(arr: seq[int]): seq[int] =
    # echo "quickSort"
    if arr.len == 0: return @[]
    # echo "arr : ", arr
    let pivot = arr[0]
    let smaller = arr[1..^1].filterIt(it <=
            pivot) # ^1 is the last element, ^2 would be one before it, and so on
    let bigger = arr.filterIt(it > pivot) # on peut prendre le pivot car il ne sera pas pris en charge (>)
 # echo "smaller : ", smaller
 # echo "pivot : ", pivot
 # echo "bigger : ", bigger
    concat(smaller.quickSort, @[pivot], bigger.quickSort)

proc quicksort_fonctionnel(arr: var seq[int]) =
    arr = quickSort(arr)
# --------------------------------FIN TRI FONCTIONNEL---------------------------------------
