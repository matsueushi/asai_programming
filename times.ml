(* 0 が見つかったことを示す例外 *)
exception Zero

(* 目的 : lst 中の整数を全て掛け合わせる *)
(* times : int list -> int *)
let rec times lst = match lst with
    [] -> 1
    | first :: rest -> first * times rest

(* テスト *)
let test1 = times [] = 1
let test2 = times [1] = 1
let test3 = times [0] = 0
let test4 = times [1; 2; 3; 4; 5] = 120
let test5 = times [1; 2; 0; 3] = 0