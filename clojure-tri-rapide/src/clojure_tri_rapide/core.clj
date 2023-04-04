;; Testé avec WSL
;; création du projet : lein new app clojure-tr_rapide
;; exécuter : lein run (depuis la racine)

(ns clojure-tri-rapide.core
  (:gen-class)
  (:require
   [clojure.string :as string]
   [clojure-tri-rapide.quicksort :as quicksort]))

(defn file->vec2 [f]
  (-> (slurp f)
      (string/split-lines)))


(defn vecteur-str-non-trie [] (file->vec2 "nombres_aleatoires_50_000.txt"))
(defn vecteur-integer [] (map #(Integer/parseInt %) (vecteur-str-non-trie)));;!! parenthèse à vecteur-str-non-trie


;; (type (iterate inc 0))
;; (type (take 5 (iterate inc 0)));;LazySeq
;; (println (take 5 (iterate inc 0)))


;; (type (vecteur-str-non-trie));;PersistentVector
;; (type (take 10 vecteur-str-non-trie));;LazySeq
;; (type (vecteur-integer));;LazySeq


;; (type (quicksort/quicksort_ (vecteur-integer)));;LazySeq
;; (type (quicksort/quick-sort-2 (vecteur-integer)));;LazySeq


(defn créer-PersistentVector [] (into [] (quicksort/quicksort_ (vecteur-integer))))
(defn créer-PersistentVector-2 [] (into [] (quicksort/quick-sort-2 (vecteur-integer))))

;; (count (test_));;50000
;; (type (test_));;PersistentVector
;; (type (test-2));;PersistentVector


(defn -main
  []
  (println "\nquicksort_ : ")
  (time (quicksort/quicksort_  (vecteur-integer)))
  (time créer-PersistentVector)
  (println (take 10 (créer-PersistentVector)))
  (println (str "Taille du vect : " (count (créer-PersistentVector))))

  (println "\nquick-sort-2 : ")
  (time (quicksort/quick-sort-2  (vecteur-integer)))
  (time (créer-PersistentVector-2))
  (println (take 10 (créer-PersistentVector-2)))
  (println (str "Taille du vect : " (count (créer-PersistentVector-2)))))


;; quicksort_ :
;; "Elapsed time: 278.7078 msecs"
;; "Elapsed time: 0.0084 msecs"
;; (0 1 2 3 4 5 6 7 8 9)
;; Taille du vect : 50000

;; quick-sort-2 :
;; "Elapsed time: 15.3649 msecs"
;; "Elapsed time: 265.2736 msecs"
;; (0 1 2 3 4 5 6 7 8 9)
;; Taille du vect : 50000