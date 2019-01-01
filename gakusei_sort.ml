#use "gakusei_t.ml"

(* 目的 : あらかじめ score フィールドの順に整列している gakusei_t 型のリスト lst と *)
(*        gakusei_t 型の gakusei を受けとり、 lstを前から順に見ていき、 score    *)
(*        フィールドが昇順となる位置に gakusei を挿入したリストを返す              *)
(* gakusei_insert : gakusei_t list -> gakusei_t -> gakusei_t list *)
let rec gakusei_insert lst gakusei = match lst with
    [] -> [gakusei]
    | ({name = n; score = s; grade = g} as first) :: rest -> (match gakusei with
            {name = n0; score = s0; grade = g0} -> if s0 < s then gakusei :: first :: rest
                                                             else first :: gakusei_insert rest gakusei)

(* テスト *)
let gakusei_insert_test1 = gakusei_insert [] gakusei1 = [gakusei1]
let gakusei_insert_test2 = gakusei_insert lst2 gakusei3 = [gakusei1; gakusei3]
let gakusei_insert_test3 = gakusei_insert lst3 gakusei3 = [gakusei1; gakusei3; gakusei2]


(* 目的 : gakusei_t 型のリストを受け取ったら、それを score フィールドの順に整列する *)
(* gakusei_sort : gakusei_t list -> gakusei_t list *)
let rec gakusei_sort lst = match lst with
    [] -> []
    | first :: rest -> gakusei_insert (gakusei_sort rest) first

(* テスト *)
let gakusei_sort_test1 = gakusei_sort lst1 = []
let gakusei_sort_test2 = gakusei_sort lst2 = [gakusei1]
let gakusei_sort_test3 = gakusei_sort lst3 = [gakusei1; gakusei2]
let gakusei_sort_test4 = gakusei_sort lst4 = [gakusei1; gakusei3; gakusei2]