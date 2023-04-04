#  Main.py

#  Created by fredOnGithub on 02/2023.

#  Compilation et exécution :
# py .\Main.py > out.txt
# Measure-Command { py .\Main.py } > temps.txt
import sys
from triRapide import *
from time import perf_counter


n = 10
fich_txt = 'nombres_aleatoires_50_000.txt'
# fich_txt = 'test_1_a_9.txt'
# s = ""
# print("-----------------------")


print("Python version")
print("{0}".format(sys.version))
print("Version info")
print("{0}".format(sys.version_info))

ok = False
ok = True

if ok:
    print("\nUTF8 ? 日本 éà")
    print("\nFonction fait main")
    # https://docs.python.org/3/library/time.html#time.perf_counter
    # ...clock with the highest available resolution to measure a short duration (in sec)

    t = tab_de_str_en_int(fichier_ds_tab_de_str(fich_txt))
    # print("Taille de t:", len(t))
    # affiche_jusqua(t, n)
    # print('type(t):{0}'.format(type(t)))
    # print('type(t[0]:{0}'.format(type(t[0])))

    tps1 = perf_counter()
    t = tri_rapide(t)
    tps2 = perf_counter()

    tp3 = tps2 - tps1
    # print('Temps mis du tri du tab d\'entier en ms : {0}'.format(
    #     tp3 * 1000, "ms"))
    print('Temps mis du tri du tab d\'entier en ms : %.0f' % (tp3 * 1000))
    print('Nombre de permutations : {0}'.format(nb_de_permutations))
    affiche_jusqua(t, n)
else:
    print("\nFonction 'sorted' du système")

    t = fichier_ds_tab_de_str(fich_txt)

    tps1 = perf_counter()
    t = tri_ce_tab(t, lambda x: sorted(x, key=int))
    tps2 = perf_counter()

    tp3 = tps2 - tps1
    print('Tri de ce tableau avec sorted en ms : %.0f' % (tp3 * 1000))
    print('Nombre de permutations : {0}'.format(nb_de_permutations))
    affiche_jusqua(t, n)
