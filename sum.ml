(* Section 9.5 version *)
(* 目的 : 受け取ったリスト lst の各要素の和を求める *)
(* sum : int list -> int *) 
(* let rec sum lst = match lst with
    [] -> 0
    | first :: rest -> first + sum rest *)

(* Section 14.2 version *)

(* #use "fold_right.ml" *)

(* 目的 : first と rest_result を加える *)
(* add_int : int -> int -> int *)
(* let add_int first rest_result = first + rest_result *)

(* 目的 : 受け取ったリスト lst の各要素の和を求める *)
(* sum : int list -> int *) 
(* let sum lst = fold_right add_int lst 0 *)


(* Section 14.5 version *)

#use "fold_right.ml"


(* 目的 : 受け取ったリスト lst の各要素の和を求める *)
(* sum : int list -> int *) 
let sum lst = 
    (* 目的 : first と rest_result を加える *)
    (* add_int : int -> int -> int *)
    let add_int first rest_result = first + rest_result in
        fold_right add_int lst 0

(* テスト *)
let test1 = sum [] = 0
let test2 = sum [2] = 2
let test3 = sum [1; 3] = 4
let test4 = sum [1; 2; 3; 4; 5; 6; 7; 8; 9; 10] = 55