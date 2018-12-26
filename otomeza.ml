#use "person_t.ml"
#use "seiza.ml"

(* 目的 : person_t 型のデータのリスト lst を受け取り、 *)
(*       おとめ座の人の名前のみからなるリストを返す     *)
(* otomeza : person_t list -> string list *) 
let rec otomeza lst = match lst with
    [] -> []
    | {name = n; height = h; weight = w; month = m; day = d; blood = b} :: rest 
        -> if seiza m d = "おとめ座" then n :: otomeza rest
                                    else otomeza rest 
(* テスト *)
let test1 = otomeza lst1 = []
let test2 = otomeza lst2 = []
let test3 = otomeza lst3 = ["Ogawa"]
let test4 = otomeza lst4 = ["Kojima"]
let test5 = otomeza lst5 = ["Kojima"]
let test6 = otomeza lst6 = ["Ogawa"]
let test7 = otomeza lst7 = ["Kojima"; "Ogawa"]