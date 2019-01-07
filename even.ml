(* 整数のリスト lst を受け取り、その中の偶数の要素のみを含むリストを返す *)
(* even : int list -> int list *)
(* Ex 9.5 version *)
(* let rec even lst = match lst with
    [] -> []
    | first :: rest -> if first mod 2 = 0 then first :: even rest 
                                          else even rest *)

(* Ex 14.1 version *)
(* 目的 : 整数 n が偶数であるかどうかを調べる *)
(* is_even : int -> bool *)
let is_even n = n mod 2 = 0 

let even lst = List.filter is_even lst


(* テスト *)
let test1 = even [] = []
let test2 = even [1] = []
let test3 = even [2] = [2]
let test4 = even [1; 2] = [2]
let test5 = even [2; 1; 6; 4; 7] = [2; 6; 4]
let test6 = even [1; 2; 3; 4; 5; 6] = [2; 4; 6]