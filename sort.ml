#use "insert.ml"

(* 目的 : 整数のリストを受け取ったら、昇順に整列したリストを返す *)
(* sort : int list -> int list *)
let rec sort lst = match lst with
    [] -> []
    | first :: rest -> insert (sort rest) first 

(* テスト *)
let test1 = sort [] = []
let test2 = sort [1] = [1]
let test3 = sort [2; 1] = [1; 2]
let test4 = sort [1; 2] = [1; 2]
let test5 = sort [5; 3; 8; 1; 7; 4] = [1; 3; 4; 5; 7; 8]
let test6 = sort [4; 1; 9; 8; 7; 10] = [1; 4; 7; 8; 9; 10]