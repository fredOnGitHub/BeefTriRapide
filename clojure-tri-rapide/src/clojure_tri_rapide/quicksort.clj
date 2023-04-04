(ns clojure-tri-rapide.quicksort)

(defn quicksort_
  "Recursive quick sort implementation"
  [items]
  (if
   (<= (count items) 1) items  ;; for zero or 1 length collections just return
   (let [pivot   (first items)
         others  (rest items)] ;; don't really need these but aids readability
     (concat
      (quicksort_ (filter #(>= pivot %) others))
      [pivot]
      (quicksort_ (filter #(< pivot %) others))))))
;; (quicksort [2 3 1 4 5 8 2 1])
;; (quicksort ["100" "11"])


;; https://eddmann.com/posts/quicksort-in-clojure/
(defn quick-sort [[pivot & coll]]
  (when pivot
    (concat (quick-sort (filter #(< % pivot) coll))
            [pivot]
            (quick-sort (filter #(>= % pivot) coll)))))
(defn quick-sort-2 [[pivot & coll]]
  (when pivot
    (let [greater? #(> % pivot)]
      (lazy-cat (quick-sort-2 (remove greater? coll))
                [pivot]
                (quick-sort-2 (filter greater? coll))))))
(defn quick-sort-3 [[pivot & coll]]
  (when pivot
    (let [{lesser false greater true} (group-by #(> % pivot) coll)]
      (lazy-cat (quick-sort-3 lesser)
                [pivot]
                (quick-sort-3 greater)))))