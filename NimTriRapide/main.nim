
import strutils #parseInt



include fichiers_et_outils
include triRapideQuicksort

# for i in 0 .. 2:
#     stdout.writeLine("i = ", i) # 0, 1, 2
echo "UTF8 ? 日本 éà"
# let nf = "test_nombres_aleatoires.txt"
let nf="nombres_aleatoires_50_000.txt"

var a = fait_array_de_int_depuis_le_fichier(nf)
echo "Taille de a :", len(a)

echo "Temps mis du tri du tab d'entier en ms : ", (time(quickSort(a, 0, len(a)-1)) * 1000).formatFloat(ffDecimal, precision = 0)
a.afficheGen(10)

a = fait_array_de_int_depuis_le_fichier(nf)
# a.afficheGen(10)
include triFonctionnel
echo "\nTime quicksort fonctionnel in millis = ", (time(quicksort_fonctionnel(a)) * 1000).formatFloat(ffDecimal, precision = 0)
a.afficheGen(10)

# ----------------------------COMPILER-------------------------------
# clear; nim c -d:release main.nim
# clear; nim c -r main.nim


# OPTION de compil -d:realease
# https://nim-lang.org/docs/nimc.html#compiler-usage-compileminustime-symbols
# ...The typical use of this switch is to enable builds in release mode (-d:release) where 
# optimizations are enabled for better performance...
# ----------------------------COMPILER-------------------------------


# Petit exemple de compilation
# https://nim-by-example.github.io/hello_world/
# To compile and execute the program, the following command should be run
# nim c -r --verbosity:0 helloworld.nim
    # c is an alias for compile, which compiles the Nim sources into C and then invokes the C compiler on them
    # -r is an alias for --run, which runs the program
    # --verbosity:0 makes the compiler only output essential messages, since by default it also outputs some debugging messages. From now on, we assume that --verbosity:0 is set
    # ./helloworld.nim is the path to the source you want to compile


# TIME
# Time_a_function https://www.rosettacode.org/wiki/Time_a_function#Nim

# QUICKSORT
# quickSort fonctionnel https://rosettacode.org/wiki/Sorting_algorithms/Quicksort#Nim

# Tableaux https://nimbyexample.com/arrays.html

