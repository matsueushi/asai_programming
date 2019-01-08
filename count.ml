#use "gakusei_t.ml"

(* Section 13.1 version *)

(* 目的 : 学生リスト lst のうち成績が seiseki0 の人の数を返す *)
(* count : gakusei_t list -> string -> int *)
(* let rec count lst seiseki0 = match lst with
    [] -> 0
    | {name = n; score = s; grade = g} :: rest
        -> if g = seiseki0 then 1 + count rest seiseki0
           else count rest seiseki0 *)


(* Section 14.4 version *)

(* 目的 : 学生リスト lst のうち成績が seiseki0 の人の数を返す *)
(* count : gakusei_t list -> string -> int *)
let rec count lst seiseki0 = 
    (* 目的 : gakusei_t 型の gakusei の成績が seiseki0 かどうかを返す *)
    let is_gakusei_seiseki0 gakusei = match gakusei with
        {name = n; score = s; grade = g} -> g = seiseki0 in
            List.length (List.filter is_gakusei_seiseki0 lst)

(* テスト *)
let test1 = count lst1 "A" = 0
let test2 = count lst2 "A" = 0
let test3 = count lst3 "A" = 1
let test4 = count lst4 "A" = 2
let test5 = count lst6 "C" = 1