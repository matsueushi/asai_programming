(* 目的 : 関数 f と初期値 init, そしてリスト lst を受け取ったら、init から初めて *)
(*       リスト lst の要素を「左から」順に f を流し込む                        *)
(* fold_left : ('a -> 'a -> 'a) -> 'a -> 'a list -> 'a *)
let fold_left f init lst = match lst with
        [] -> init
        | first :: rest -> fold_left f (f init first) rest

(* テスト *)
let test1 = fold_left (fun x y -> x + y) 0 [] = 0
let test2 = fold_left (fun x y -> x + y) 0 [1; 2; 3; 4; 5] = 15
let test3 = fold_left (fun x y -> x * y) 1 [1; 2; 3; 4; 5] = 120
let test4 = fold_left 
    (fun x y -> if x >= y then y else x) max_int [1; 2; 3; 4; 5] = 1
let test5 = fold_left
    (fun x y -> x ^ y) "-" ["a"; "b"; "c"; "d"; "e"] = "-abcde"