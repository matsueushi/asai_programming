#use "person_t.ml"

(* 目的 : person_t 型のデータのリストを受け取り、各血液型の人の組を返す *)
(*       血液型は A, B, O, AB の順                               *)
(* ketsueki_shukei : person_t list -> int * int * int * int *)
let rec ketsueki_shukei lst = match lst with
    [] -> (0, 0, 0, 0)
    | {name = n; height = h; weight = w; month = m; day = d; blood = b} :: rest -> 
        let (x, y, z, w) = ketsueki_shukei rest in 
            if b = "A" then (x + 1, y, z, w)
            else if b = "B" then (x, y + 1, z, w)
            else if b = "O" then (x, y, z + 1, w)
            else (x, y, z, w + 1)
            
(* テスト *)
let test1 = ketsueki_shukei lst1 = (0, 0, 0, 0)
let test2 = ketsueki_shukei lst2 = (0, 0, 0, 1)
let test3 = ketsueki_shukei lst7 = (2, 1, 1, 1)
