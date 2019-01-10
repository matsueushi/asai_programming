#use "enumerate.ml"

(* 目的 : 先頭の要素が素数であるリスト lst を受け取り、リストの残りの中からリストの先頭の *)
(*       要素で割り切れるものは取り除くという操作を、リストが空になるまで繰り返す        *)
(* sieve : int list -> int list *)
let rec sieve lst = match lst with
    [] -> []
    | first :: rest -> 
        first :: sieve (List.filter (fun n -> n mod first <> 0) rest)

(* テスト *)
let sieve_test1 = sieve [2; 3; 4] = [2; 3]
let sieve_test2 = sieve [3; 5] = [3; 5]
let sieve_test3 = sieve [4; 5; 6] = [4; 5; 6]
let sieve_test4 = sieve [5; 6; 7; 9; 18; 21; 34] = [5; 6; 7; 9; 34]


(* 目的 : 自然数 n (n>=2) を受け取り、それ以下の素数のリストを返す関数 *)
(* prime : int -> int list *)
let prime n =
    let rec two_to_n n = if n = 1 then []
                         else two_to_n (n - 1) @ [n]
    in sieve (two_to_n n)


(* テスト *)
let prime_test1 = prime 5 = [2; 3; 5]
let prime_test2 = prime 10 = [2; 3; 5; 7]