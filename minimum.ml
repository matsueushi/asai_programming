(* Section 10.2 version *)

(* 目的 : 受けとった lst の中の最小値を返す *)
(* minimum : int list -> int *)
(* let rec minimum lst = match lst with
    [] -> max_int 
    | first :: rest ->
        let min_rest = minimum rest in 
        if first <= min_rest then first
        else min_rest  *)


(* fold_right version *)

(* 目的 : 受けとった lst の中の最小値を返す *)
(* minimum : int list -> int *)
(* let minimum lst = List.fold_right min lst max_int *)

(* テスト *)
(* let test1 = minimum [3] = 3
let test2 = minimum [1; 2] = 1
let test3 = minimum [3; 2] = 2
let test4 = minimum [3; 2; 6; 4; 1; 8] = 1 *)


(* Ex 17.17 version *)

(* 目的 : first, rest の中の最小値を返す *)
(* minimim : int -> int list -> int *)
let minimum first rest = List.fold_right min (first :: rest) first

(* テスト *)
let test1 = minimum 3 [] = 3
let test2 = minimum 1 [2] = 1
let test3 = minimum 3 [2] = 2
let test4 = minimum 3 [2; 6; 4; 1; 8] = 1