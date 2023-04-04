def partition(arr, start, end):
    # print(arr, start, end)
    # print("partition", start, end)
    global nbSwap
    pivotValue = arr[end]
    pivotIndex = start
    for i in range(start, end):
        if arr[i] < pivotValue:
            arr[i], arr[pivotIndex] = arr[pivotIndex], arr[i]
            nbSwap += 1
            pivotIndex += 1
    arr[pivotIndex], arr[end] = arr[end], arr[pivotIndex]
    nbSwap += 1
    return pivotIndex


def quickSort(arr, start, end):
    # print("quickSort", arr, start, end)
    if start < end:
        pivotIndex = partition(arr, start, end)
        quickSort(arr, start, pivotIndex - 1)
        quickSort(arr, pivotIndex + 1, end)


nbSwap = 0
a = [9, 8, 7, 2, 1, 20, 3, 21, 22, 100, 200]
quickSort(a, 0, len(a) - 1)
print("nbSwap", nbSwap)
print("", a, 0, len(a))