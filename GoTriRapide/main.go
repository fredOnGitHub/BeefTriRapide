//	Created by fredOnGithub on 01/2023.
//
// compilation

// créer le mod (par exemple)
// https://go.dev/doc/tutorial/create-module
// go mod init example.com/m

// go build main.go
// ./main
// ou
// go run main.go
// ou
// go run . // quand il y a plusieurs fichiers avec le même package main par ex

// Measure-Command { go run main.go } > temps.txt

package main

import (
	"fmt"
	"time"

	"example.com/m/tri_rapide_int"
)

func main() {
	// fmt.Println(reflect.TypeOf("1"[0]))        //uint8
	// fmt.Println(reflect.TypeOf((int)("1"[0]))) //int
	// fmt.Println((int)("1"[0] - "9"[0]))        //248
	// fmt.Println((int)("1"[0]) - (int)("9"[0])) //-8

	// fmt.Println("math.MaxInt16", math.MaxInt16) //https://pkg.go.dev/math#pkg-constants
	// fmt.Println("math.MaxInt32", math.MaxInt32) //https://pkg.go.dev/math#pkg-constants
	// fmt.Println("math.MaxInt  ", math.MaxInt)   //https://pkg.go.dev/math#pkg-constants
	// fmt.Println("math.MaxInt64", math.MaxInt64) //https://pkg.go.dev/math#pkg-constants

	print("UTF8 ? 日本 éà\n")
	
	// nf := "test_1_a_9.txt"
	nf := "nombres_aleatoires_50_000.txt"
	tri_rapide_int.Créer_tab_de_int(nf)
	
	t0 := time.Now()
	tri_rapide_int.Tri()
	t1 := time.Now()
	
	print(fmt.Sprintf("\nTemps mis du tri du tab d'entier en ms : %.0f\n", t1.Sub(t0).Seconds()*1000))
	tri_rapide_int.Affiche_tab(10)
	print("NbEchange : ", tri_rapide_int.NbEchange)

}
