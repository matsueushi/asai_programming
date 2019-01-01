#use "person_t.ml"

(* 目的 : あらかじめ整列された person_t 型の配列 lst と person_t 型の person *)
(*       を受け取り、 lst を前から順に見ていき、 name フィールドが昇順となる位置 *)
(*       に person を挿入する                                            *)
(* person_insert : person_t list -> person_t -> person_t list *)
let rec person_insert lst person = match lst with
    [] -> [person]
    | ({name = n0; height = h0; weight = w0; month = m0; day = d0; blood = b0} as first) :: rest ->
        match person with
            {name = n; height = h; weight = w; month = m; day = d; blood = b} ->
                if n < n0 then person :: first :: rest
                else first :: person_insert rest person

(* テスト *)
let person_insert_test1 = person_insert [] person1 = [person1]
let person_insert_test2 = person_insert lst2 person2 = [person2; person1]
let person_insert_test3 = person_insert [person5; person3; person2] person4 = [person5; person3; person4; person2]


(* 目的 : person_t 型のリストを受け取って、名前の順に整列したリストを返す *)
(* person_sort : person_t list -> person_t list *)
let rec person_sort lst = match lst with
    [] -> []
    | first :: rest -> person_insert (person_sort rest) first

(* テスト *)
let person_sort_test1 = person_sort [] = []
let person_sort_test2 = person_sort [person1] = [person1]
let person_sort_test3 = person_sort lst4 = [person3; person2; person1]
let person_sort_test4 = person_sort lst7 = [person5; person3; person4; person2; person1]