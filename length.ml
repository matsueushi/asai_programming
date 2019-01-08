(* Ex 9.6 version *)
(* リスト lst を受け取り、そのリストの長さを返す *)
(* length : 'a list -> int *)

(* let rec length lst = match lst with
    [] -> 0
    | first :: rest -> 1 + length rest  *)

(* Section 14.2 version *)
#use "fold_right.ml"
(* 目的 : first は無視して rest_result に1を加える *)
(* add_one : int -> int -> int *)
let add_one first rest_result = 1 + rest_result

(* 目的 : 受け取った lst の長さを求める *)
(* length : 'a list -> int *)
let length lst = fold_right add_one lst 0


(* テスト *)
let test1 = length [] = 0
let test2 = length [2] = 1
let test3 = length [1; 2] = 2
let test4 = length [4; 2; 1; 0] = 4
(* Section 13.3 *)
let test5 = length ["a"; "b"; "c"] = 3