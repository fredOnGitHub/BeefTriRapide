-- Main.lua
-- tri_rapide
-- Created by fredOnGithub on 02/2023.
-- cls ; lua .\Main.lua > out.txt 
-- Measure-Command { lua .\Main.lua } > temps.txt

require "fichier.fichier"
require "tableau.tableau"
require "tri_rapide.quicksort"

nf = 'nombres_aleatoires_50_000.txt'
-- nf = 'test_1_a_9.txt'

s = ""
s = s .. "UTF8 ? 日本 éà\n"
io.write("Hello world, from ", _VERSION, "!\n")

t = fichier_en_tab_de_number(nf)
-- print("type(t[1]) : ", type(t[1]))
-- print("Taille de t:", #t)
x1 = os.clock()
quickSort(t, 1, #t)
x2 = os.clock()

s = s .. string.format("Temps mis du tri du tab d'entier en ms : %.0f\n", (x2 - x1) * 1000)
affiche_jusqu_a(10, t)
s = s .. string.format("nb_echange : %d\n", nb_echange)

io.write(s)

file = io.open("out.txt", "w")
file:write (s)
file:close()