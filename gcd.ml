(* 目的 : 二つの自然数 m と n の最大公約数を求める *)
(*       入力は m >= n >= 0                   *)
(*       再起するたびに m + n が小さくなる       *)
(* gcd : int -> int -> int *)
let rec gcd m n =
    if n = 0 then m
    else gcd n (m mod n)

(* テスト *)
let test1 = gcd 7 5 = 1
let test2 = gcd 10 5 = 5
let test3 = gcd 18 12 = 6
let test4 = gcd 13 13 = 13