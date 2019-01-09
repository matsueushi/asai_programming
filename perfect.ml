#use "divisor.ml"

(* 目的 : m 以下の完全数のリストを返す *)
(* perfect : int -> int listz *)
let perfect m = List.filter 
                (fun n -> List.fold_right (+) (divisor n) 0 - n = n) 
                (enumerate m)

(* テスト *)
let test = perfect 10000 = [8128; 496; 28; 6]