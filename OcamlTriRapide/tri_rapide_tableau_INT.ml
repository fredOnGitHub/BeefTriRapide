
(*

Author : fredOnGithub

compilation :
clear; rm a.out 2>/dev/null; ocamlopt -o a.out tri_rapide_tableau_INT.ml; ./a.out 2>/dev/null

code natif Windows : 
with-dkml ocamlopt -o a.exe tri_rapide_tableau_INT.ml

ou ocaml.exe tri_rapide_tableau_INT.ml;
pour l'exécuter comme du bytecode

*)

(* open Printf;;
   printf "%s" "ok \n";; *)

(* AFFICHAGE BASIQUE *)
let ps e = print_string e; print_string " ";;
let pf e = print_float e;;
let nl() = print_newline();;
let pi e = print_int e; print_string " ";;

let nombre_de_lignes_fichier file =
  let n = ref 0 and ich = open_in file in
  let rec loop () = ignore (input_line ich); incr n; loop () in
  try loop () with End_of_file -> close_in ich; 
    (* ps "fermeture du fichier"; nl(); *)
    !n;;

let fichier_dans_tableau filename =
  let n = nombre_de_lignes_fichier filename in 
  (* ps "nombre_de_lignes_fichier filename"; pi n; nl(); *)
  let v = Array.make n 0 and
    i = ref 0
  and chan = open_in filename in
  (* ps "Taille du tab"; pi (nombre_de_lignes_fichier filename);nl(); *)
  let rec loop () = 
    let l = input_line chan in 
    Array.set v !i (int_of_string l); 
    (* pi !i;  *)
    i:=1+ !i; loop () in
  try loop () with End_of_file -> close_in chan; 
    (* ps "fin du fichier dans le tableau\n"; *)
    v;;


let print_tableau_max t max =
  let donne_max = 
    let l = Array.length t in 
    if max < l then max else l in
  let m = donne_max in
  for i = 0 to m-1 do
    pi (Array.get t i)
  done;
  if (m) = Array.length t then ps "[]"
  else ps "..."; nl();;


(* MESURE TEMPS D'EXÉCUTION *)
let time f1 =
  let t = Sys.time() and
  res = f1 () in
  ps "Temps mis : "; pf (Sys.time() -. t); ps " seconds"; nl();
  res;;
(* - : (unit -> 'a) -> 'a = <fun> *)

(* FONCTIONS DE COMPARAISON *)
let compare_a_b_renvoie_bool x y = 
  if x < y then true else false;;

let nb = ref 0;;

let swap a i j =
  incr nb;
  let t = a.(i) in
  a.(i) <- a.(j); 
  a.(j) <- t;;

(* PIVOT EN PRENANT LE DERNIER ÉLÉMENT *)
let partition_pivot_fin a l r =
  let p = a.(r) in
  let m = ref l in
  for i = l to r - 1 do
    if compare_a_b_renvoie_bool a.(i) p then begin 
      swap a i !m;
      incr m
    end
  done;
  swap a !m r;
  !m;;
let rec quick_rec_pivot_fin a l r =
  (* ps "oui\n"; *)
  if l < r then begin

    let m = partition_pivot_fin a l r in
    quick_rec_pivot_fin a l (m-1) ;
    quick_rec_pivot_fin a (m + 1) r
  end;;


(* bug pour 5_000_000 ? 5_000_000 *)

let nf = "nombres_aleatoires_50_000.txt";;

ps "Chargement du tableau : ";;
let ti = Sys.time();;
let t = fichier_dans_tableau nf;;
(* let t =[|"1000";"2"|];; *)
pf (Sys.time() -. ti); ps " seconds"; nl(); 
ps "Taille : ";;
pi (Array.length t);;
nl();;
print_tableau_max t 10;;
ps "Tri fonction fait main : ";;
let ti = Sys.time();;
quick_rec_pivot_fin t 0 (Array.length t - 1);;
pf (Sys.time() -. ti); ps " seconds";
nl();;
print_tableau_max t 10;;
ps "nb de swap : ";pi !nb;;

nl();;
nl();;

ps "Chargement du tableau : ";;
let ti = Sys.time();;
let t = fichier_dans_tableau nf;;
(* let t =[|"1000";"2"|];; *)
pf (Sys.time() -. ti); ps " seconds"; nl(); 
ps "Taille : ";;
pi (Array.length t);;
nl();;
print_tableau_max t 10;;
ps "Tri fast_sort : ";;
let ti = Sys.time();;
Array.fast_sort compare t;
pf (Sys.time() -. ti); ps " seconds";
nl();;
print_tableau_max t 10;;

