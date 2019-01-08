(* 目的 : init から始めて lst の要素を右から順に f を施しこむ *)
(* fold_right : ('a -> 'b -> 'b) -> 'a list -> 'b -> 'b *)
let rec fold_right f lst init = match lst with
    [] -> init
    | first :: rest -> f first (fold_right f rest init)


(* 目的 : first と rest_result を加える *)
(* add_int : int -> int -> int *)
let add_int first rest_result = first + rest_result

(* 目的 : 受け取ったリスト lst の各要素の和を求める *)
(* sum : int list -> int *)
let sum lst = fold_right add_int lst 0


(* 目的 : first は無視して rest_result に1を加える *)
(* add_one : int -> int -> int *)
let add_one first rest_result = 1 + rest_result

(* 目的 : 受け取った lst の長さを求める *)
(* length : 'a list -> int *)
let length lst = fold_right add_one lst 0


(* 目的 : first をリスト rest_result の先頭に加える  *)
(* cons : 'a -> 'a list -> 'a list *)
let cons first rest_result = first :: rest_result

(* 目的 : lst1 と lst2 を受け取りそれらを結合したリストを返す *)
(* append : 'a list -> 'a list -> 'a list *)
let append lst1 lst2 = fold_right cons lst1 lst2 