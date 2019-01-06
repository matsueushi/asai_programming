#use "gakusei_t.ml"

(* 目的 : 学生リスト lst のうち成績が seiseki0 の人の数を返す *)
(* count : gakusei_t list -> string -> int *)
let rec count lst seiseki0 = match lst with
    [] -> 0
    | {name = n; score = s; grade = g} :: rest
        -> if g = seiseki0 then 1 + count rest seiseki0
           else count rest seiseki0

(* テスト *)
let test1 = count lst1 "A" = 0
let test2 = count lst2 "A" = 0
let test3 = count lst3 "A" = 1
let test4 = count lst4 "A" = 2
let test5 = count lst6 "C" = 1