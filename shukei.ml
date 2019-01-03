#use "gakusei_t.ml"

(* 目的 : 学生リスト lst のうち各成績の人数を集計する *)
(* shukei : gakusei_t list -> int * int * int * int *)
let rec shukei lst = match lst with
    [] -> (0, 0, 0, 0)
    | {name = n; score = s; grade = g} :: rest -> 
        let (a, b, c, d) = shukei rest in
                if g = "A" then (a + 1, b, c, d)
                else if g = "B" then (a, b + 1, c, d)
                else if g = "C" then (a, b, c + 1, d)
                else (a, b, c, d + 1)

(* テスト *)
let test1 = shukei lst1 = (0, 0, 0, 0)
let test2 = shukei lst2 = (0, 1, 0, 0)
let test3 = shukei lst4 = (2, 1, 0, 0)
let test4 = shukei lst6 = (2, 1, 1, 1)