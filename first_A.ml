#use "person_t.ml"

(* 目的 : person_t 型のリストを受け取り、最初の A 型の人のレコードをオプション型で返す *)
(* first_A : person_t list -> person_t option *)
let rec first_A lst = match lst with
    [] -> None
    | ({name = n; height = h; weight = w; month = m; day = d; blood = b} as first) :: rest
         -> if b = "A" then Some (first)
            else first_A rest

(* テスト *)
let test1 = first_A [] = None
let test2 = first_A lst3 = Some (person4)
let test3 = first_A lst6 = Some (person4)
let test4 = first_A lst7 = Some (person4)