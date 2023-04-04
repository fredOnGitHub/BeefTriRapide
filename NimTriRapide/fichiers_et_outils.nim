
proc number_line_from_file(f: string): int =
    var i = 0
    for line in lines f:
        i+=1
    i

# import strutils #parseInt

proc fait_array_de_int_depuis_le_fichier(f: string): seq[int] =
    let M = number_line_from_file(f)
    var a = newSeq[int](M)
    var i = 0
    for line in lines f:
        a[i] = parseInt(line)
        i+=1
    a

proc afficheGen [T] (a: seq[T], n: int) =
    if n <= 0:
        return
    echo "afficheGen ", n, "  ", len(a)
    let l: int = if a.len <= n: a.len else: n
    stdout.write "[ "
    var i = 0
    while i <= l-2: # https://nim-lang.org/docs/tut1.html#control-flow-statements-for-statement
        stdout.write a[i]
        stdout.write ", "
        inc i
    stdout.write a[i]
    if n == l:
        stdout.write ", ... ]\n"
    else:
        stdout.write " ]\n"

import times
template time(statement: untyped): float =
    let t0 = cpuTime()
    statement
    cpuTime() - t0