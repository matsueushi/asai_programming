#use "gakusei_t.ml"

(* 目的 : gakusei_t 型の fitst の score を rest_result に加える *)
(* add_score : gakusei_t -> int -> int *)
let add_score first rest_result = match first with
    {name = n; score = s; grade = g} -> s + rest_result

(* 目的 : gakusei_t 型のリストを受け取ったら、全員の特典の合計を返す *)
(* gakusei_sum : gakusei_t list -> int *)
let gakusei_sum lst = List.fold_right add_score lst 0

(* テスト *)
let test1 = gakusei_sum [] = 0
let test2 = gakusei_sum lst2 = 70
let test3 = gakusei_sum lst3 = 155
let test4 = gakusei_sum lst4 = 235
let test5 = gakusei_sum lst5 = 175