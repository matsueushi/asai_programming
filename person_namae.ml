#use "person_t.ml"

(* 目的 : person_t 型を受け取り、名前を返す *)
(* take_name : person_t -> string *)
let take_namae person = match person with
    {name = n; height = h; weight = w; month = m; day = d; blood = b} -> n

(* テスト *)
let take_namae_test1 = take_namae person1 = "Tanaka"
let take_namae_test2 = take_namae person2 = "Saito"


(* 目的 : person_t 型のリストを受け取ったら、その中に出てくる人の名前のリストを返す *)
(* person_name : person_t list -> string list *)
let person_namae lst = List.map take_namae lst

(* テスト *)
let person_namae_test1 = person_namae [] = []
let person_namae_test2 = person_namae lst2 = ["Tanaka"]
let person_namae_test3 = person_namae lst7 = 
    ["Tanaka"; "Saito"; "Kojima"; "Ogawa"; "Ishikawa"]