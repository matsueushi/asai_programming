#use "person_t.ml"

(* 目的 : person_t 型のデータのリストのうち、血液型が blood0 の人の数を返す *)
(* count_ketsueki : person_t list -> string -> int *)
let rec count_ketsueki lst blood0 = match lst with
    [] -> 0
    | {name = n; height = h; weight = w; month = m; day =d; blood = b} :: rest 
        -> if b = blood0 then 1 + count_ketsueki rest blood0
           else count_ketsueki rest blood0

(* テスト *)
let test1 = count_ketsueki lst3 "A" = 1 
let test2 = count_ketsueki lst4 "A" = 0
let test3 = count_ketsueki lst5 "A" = 1
let test4 = count_ketsueki lst7 "AB" = 1