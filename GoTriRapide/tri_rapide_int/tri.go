package tri_rapide_int

import (
	"fmt"

	"example.com/m/fichier"
)

func QuicksortDernierElt(lo int, hi int) {
	// println(ta, lo, hi)
	// fmt.Printf("%v, %d, %d\n", ta, lo, hi)
	if lo < hi {
		p := partitionDernierElt(lo, hi)
		// println(p)
		QuicksortDernierElt(lo, p-1)
		QuicksortDernierElt(p+1, hi)
	}
}

// Lomuto partition scheme
func partitionDernierElt(lo int, hi int) int {
	pivot := ta[hi]
	i := lo
	for j := lo; j < hi; j++ {
		if ta[j] < pivot {
			ta[i], ta[j] = ta[j], ta[i]
			NbEchange++
			i = i + 1
		}
	}
	ta[i], ta[hi] = ta[hi], ta[i]
	NbEchange++
	return i
}

func Créer_tab_de_int(a string) {
	tableauString := fichier.Créer_tab_de_string(a)
	ta = fichier.Vecteur_de_string_en_int(tableauString)
}

func Tri() {
	if len(ta) > 0 {
		QuicksortDernierElt(0, len(ta)-1)
	}
}

func Get_sprintf_du_tab_de_int(m int) string {
	l := m
	if l > len(ta) {
		l = len(ta)
	}
	var s []int = ta[:l]
	// https: //zetcode.com/golang/string-format/
	res := fmt.Sprintf("%v", s)
	return res
}

func Affiche_tab(n int) {
	println(Get_sprintf_du_tab_de_int(n))
}

func Affiche_tab_(m int) {
	l := m
	if l > len(ta) {
		l = len(ta)
	}
	i := 0
	for index, element := range ta {
		fmt.Println(index, element)
		if i == l {
			break
		}
		i++
	}
}

var NbEchange int = 0
var ta []int

const nn = 10
