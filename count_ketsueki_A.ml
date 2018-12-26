#use "person_t.ml"

(* 目的: : person_t 型のデータのリストを受け取ったら、 *)
(*        血液型が A 型の人の数を返す               *)
(* count_ketsueki_A : person_t list -> int *)
let rec count_ketsueki_A lst = match lst with
    [] -> 0 
    | {name = n; height = h; weight = w; month = m; day = d; blood = b} :: rest 
        -> if b = "A" then 1 + count_ketsueki_A rest
                      else count_ketsueki_A rest 

(* テスト *)
let test1 = count_ketsueki_A lst1 = 0 
let test2 = count_ketsueki_A lst2 = 0
let test3 = count_ketsueki_A lst3 = 1 
let test4 = count_ketsueki_A lst4 = 0
let test5 = count_ketsueki_A lst5 = 1
let test6 = count_ketsueki_A lst6 = 2
let test7 = count_ketsueki_A lst7 = 2 