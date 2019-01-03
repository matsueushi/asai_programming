#use "gakusei_t.ml"
(* 目的 : gakusei_t 型のリストを受け取ったら、その中から最大得点を取った人のレコードを返す *)
(* gakusei_max : gakusei_t list -> gakusei_t *)
let rec gakusei_max lst = match lst with
    [] -> {name = ""; score = 0; grade = ""}
    | ({name = n0; score = s0; grade = g0}) as first :: rest ->
            let max_rest = gakusei_max rest in
            match max_rest with
                {name = n; score = s; grade = g} ->
                    if s0 <= s then max_rest 
                    else first

(* テスト *)
let test1 = gakusei_max lst2 = gakusei1
let test2 = gakusei_max lst3 = gakusei2
let test3 = gakusei_max lst4 = gakusei2