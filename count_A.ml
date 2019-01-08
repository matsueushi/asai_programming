#use "gakusei_t.ml"

(* Section 9.6 version *) 

(* 目的 : 学生リスト lst のうち成績が A の人の数を返す *)
(* count_A : gakusei_t list -> int *)
(* Section 9.6 version *)
(* let rec count_A lst = match lst with
    [] -> 0
    | {name = n; score = s; grade = g} :: rest  
        -> if g = "A" then 1 + count_A rest
                      else count_A rest *)


(* Ex 14.2 version *)

(* 目的 : gakusei_t 型の gakusei の成績が A かどうかを返す *)
(* let is_seiseki_A gakusei = match gakusei with
    {name = n; score = s; grade = g} -> g = "A"  *)

(* 目的 : 学生リスト lst のうち成績が A の人の数を返す *)
(* count_A : gakusei_t list -> int *)
(* let count_A lst = List.length (List.filter is_seiseki_A lst) *)


(* Ex 14.5 version *)

(* 目的 : 学生リスト lst のうち成績が A の人の数を返す *)
(* count_A : gakusei_t list -> int *)
(* let count_A lst = *)
    (* 目的 : gakusei_t 型の gakusei の成績が A かどうかを返す *)
    (* let is_seiseki_A gakusei = match gakusei with
        {name = n; score = s; grade = g} -> g = "A" in 
            List.length (List.filter is_seiseki_A lst) *)


(* Ex 14.10 version *)

(* 目的 : 学生リスト lst のうち成績が A の人の数を返す *)
(* count_A : gakusei_t list -> int *)
let count_A lst =
    List.length (
        List.filter 
        (fun gakusei -> 
            match gakusei with {name = n; score = s; grade = g} -> g = "A")
        lst)

(* テスト *)
let test1 = count_A lst1 = 0
let test2 = count_A lst2 = 0
let test3 = count_A lst3 = 1
let test4 = count_A lst4 = 2
