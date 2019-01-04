#use "ketsueki_shukei.ml"

(* 目的 : person_t 型のデータのリストを受け取ったら、4 つの血液型のうち *)
(*       もっとも人数の多かった血液型を返す関数                      *)
(* saita_ketsueki : person_t list -> string *)
let saita_ketsueki lst = 
    let (a, b, o, ab) = ketsueki_shukei lst in
    let saidai = max (max a b) (max o ab) in
    if saidai = a then "A"
    else if saidai = b then "B"
    else if saidai = o then "O"
    else "AB"

(* テスト *)
let test1 = saita_ketsueki lst2 = "AB"
let test2 = saita_ketsueki lst3 = "A"
let test3 = saita_ketsueki lst4 = "B"