(* 目的 : あらかじめ昇順に並んでいる整数のリスト lst と 整数 n　を受け取ったら、 *)
(*       lst を前から順に見ていき、昇順となる位置に n を挿入したリストを返す    *)
(* insert : int list -> int -> int list *)
let rec insert lst n = match lst with
    [] -> [n]
    | first :: rest -> if n < first then n :: first ::rest 
                                    else first :: insert rest n 

(* テスト *)
let test1 = insert [] 1 = [1]
let test2 = insert [1; 3] 2 = [1; 2; 3]
let test3 = insert [1; 2] 0 = [0; 1; 2]
let test4 = insert [1; 2] 3 = [1; 2; 3]
let test5 = insert [1; 3; 4; 7; 8] 5 = [1; 3; 4; 5; 7; 8]