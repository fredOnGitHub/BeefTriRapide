package fichier

import (
	"os"
	"strconv"
	"strings"

	"example.com/m/erreur"
)

func LireFichier(a string) []uint8 {
	dat, err := os.ReadFile(a)
	// fmt.Println(reflect.TypeOf(dat)) //
	// fmt.Println(reflect.TypeOf(err)) //
	erreur.Check(err)
	return dat
}

func Créer_tab_de_string(a string) []string {
	dat := LireFichier(a)
	s := string(dat) //convert []uint8 vers string
	// fmt.Println("dat == string([]uint8(dat)) :", dat == string([]uint8(dat)))
	r := strings.Replace(s, "\r", "", -1) // Replace will work with a single unicode : -1 no limit of replacement
	//comme ça on aura que des \n et pas d'erreur de convertion d'un '9\r' par ex
	tableauString := strings.Split(r, "\n")
	return tableauString
}

// Il faut mettre en Majuscule pour l'exporter
func Vecteur_de_string_en_int(vs []string) []int {
	return map2(vs, string_en_int)
}

func string_en_int(a string) int {
	intVar, err := strconv.Atoi(a)
	erreur.Check(err)
	return intVar
}
func map2(vs []string, f func(string) int) []int {
	// https://stackoverflow.com/questions/33726731/short-way-to-apply-a-function-to-all-elements-in-a-list-in-golang
	vsm := make([]int, len(vs))
	for i, v := range vs {
		vsm[i] = f(v)
	}
	return vsm
}
