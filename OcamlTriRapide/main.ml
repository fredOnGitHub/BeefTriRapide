
(*

dune compilation :
----------------
dune init exe main
dune build
clear; dune exec .\main.exe

ocamlopt compilation (Windows) :
------------------------------
ocamlopt -o a.exe main.ml;


*)

(* AFFICHAGE BASIQUE *)
let ps e = print_string e;;
let pf e = print_float e;;
let nl() = print_newline();;
let pi e = print_int e;;


(* MESURE TEMPS D'EXÉCUTION *)
let time f1 =
  let t = Sys.time() and
  res = f1 () in
  ps ""; pf (Sys.time() -. t); ps " secondes";
  nl();
  res;;


(* FONCTIONS DE COMPARAISON *)
let compare_int_renvoie_bool x y = 
  if x <= y then true else false;;

let compare_str_renvoie_bool a b =
  let la = String.length a and lb =  String.length b in
  if la < lb then true 
  else if la == lb then
    if a <= b then true
    else false
  else false;;

(* Ajout d'une fonction de comparaison, modif de http://programmer-avec-ocaml.lri.fr/chap12.html *)
let rec partition_liste ((left, right) as acc) p fonction_tri = function
  | [] -> acc
  | x :: s when fonction_tri x p ->
    partition_liste (x :: left, right) p fonction_tri s
  | x :: s -> 
    partition_liste (left, x :: right) p fonction_tri s;;
let rec quicksort_liste fonction_tri = function
  | [] -> []
  | p :: s ->
    let (left, right) = partition_liste ([], []) p fonction_tri s in
    (quicksort_liste fonction_tri left) @ (p :: quicksort_liste fonction_tri right);;

(* http://www.dailly.info/ressources/tri/caml_liste/rapide.html  *)
let rec partition liste pivot=
  match liste with
  |[]->[],[]
  |tt::qq->
    let (l1,l2)=partition qq pivot in
    if(tt<pivot) then (tt::l1,l2) else (l1,tt::l2);;
(* partition : 'a list -> 'a -> 'a list * 'a list = <fun> *)
let rec tri_rapide liste=
  match liste with
  |[]->[]
  |a::ll->
    let (l1,l2)=partition ll a in
    (tri_rapide l1)@(a::(tri_rapide l2));;
(* 'a list -> 'a list *)

let fichier_dans_liste_avec_ref filename conv_en_int_ou_pas =
  let lines = ref [] and
  chan = open_in filename in 
  begin
    try
      while true; do
        lines := conv_en_int_ou_pas (input_line chan) :: !lines
      done
    with End_of_file ->
      close_in chan
  end;
  (* List.rev_append !lines [] *)
  (* List.rev !lines *)
  !lines
;;
(* string -> (string -> 'a) -> 'a list *)

let print_liste_max l m pi_ou_ps =
  let rec g a b = 
    match (a, b) with  (*TAIL REC*)
    | [], _ -> ps "[]";
    | tete::reste, n ->
      if n < m then begin 
        pi_ou_ps tete; ps " ";
        g reste (n + 1) end
      else ps "...[]" in
  g l 0;;
(* 'a list -> int -> ('a -> unit) -> unit *)

let nf = "nombres_aleatoires_50_000.txt";;
(* let nf = "test.txt";; *)

      
nl();ps "----------------  tri_rapide int ----------------";nl();
let listeEntier = fichier_dans_liste_avec_ref nf (function x-> int_of_string x)in
  print_liste_max listeEntier 10 pi;
  nl();
  let f () = tri_rapide listeEntier in
    let listeEntierTrie = time f in
      print_liste_max listeEntierTrie 10 pi;;

nl();

nl();ps "----------------  quicksort_liste int ----------------";nl();
let listeEntier = fichier_dans_liste_avec_ref nf (function x-> int_of_string x)in
  print_liste_max listeEntier 10 pi;
  nl();
  let f () = quicksort_liste compare_int_renvoie_bool listeEntier in
    let listeEntierTrie = time f in
      print_liste_max listeEntierTrie 10 pi;;
nl();

nl();ps "----------------  quicksort_liste str ----------------";nl();
let listeStr = fichier_dans_liste_avec_ref nf (function x-> x)in
  print_liste_max listeStr 10 ps;
  nl();
  let f () = quicksort_liste compare_str_renvoie_bool listeStr in
    let listeStrTrie = time f in
      print_liste_max listeStrTrie 10 ps;;



