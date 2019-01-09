#use "enumerate.ml"

(* 目的 : n の約数のリストを返す *)
(* divisor : int -> int list *)
let divisor n = List.filter (fun x -> n mod x = 0) (enumerate n)

(* テスト *)
let test1 = divisor 2 = [2; 1]
let test2 = divisor 6 = [6; 3; 2; 1]
let test3 = divisor 24 = [24; 12; 8; 6; 4; 3; 2; 1]