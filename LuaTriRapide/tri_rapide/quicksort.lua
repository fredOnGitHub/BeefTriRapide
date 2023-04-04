nb_echange = 0 -- ne pas mettre en 'local' pour l'écrire depuis le main

function partition(arr, start, fin)
    -- aff(arr, start, fin)
    -- print("partition", start, fin)
    -- io.write(string.format("partition %d %d\n", start - 1, fin - 1))
    pivotValue = arr[fin]
    pivotIndex = start
    for i = start, fin - 0 do
        if arr[i] < pivotValue then
            -- print(arr[i], " < ", pivotValue)
            do
                arr[i], arr[pivotIndex] = arr[pivotIndex], arr[i]
                nb_echange = nb_echange + 1
                pivotIndex = pivotIndex + 1
            end
        end
    end
    arr[pivotIndex], arr[fin] = arr[fin], arr[pivotIndex]
    nb_echange = nb_echange + 1
    return pivotIndex
end

function quickSort(arr, start, fin)
    -- aff(arr, start - 1, fin - 1)
    if start < fin then
        local pivotIndex = partition(arr, start, fin) -- ATTENTION local !!
        -- print("type(pivotIndex) : ", type(pivotIndex))
        -- io.write(string.format("%d %d %d\n", pivotIndex - 1, start - 1, fin - 1))
        quickSort(arr, start, pivotIndex - 1)
        quickSort(arr, pivotIndex + 1, fin)
    end
end
