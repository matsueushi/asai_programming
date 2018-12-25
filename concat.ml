(* 目的 : 文字列のリスト lst を受け取ったら、その中の要素を前から順に *)
(*       連結した文字列を返す                                   *)
(* concat : string list -> string *)
let rec concat lst = match lst with
    [] -> ""
    | first :: rest -> first ^ concat rest

(* テスト *)
let test1 = concat [] = ""
let test2 = concat ["A"] = "A"
let test3 = concat ["春"; "夏"; "秋"; "冬"] = "春夏秋冬"
let test4 = concat ["あ"; "い"; "う"; "え"; "お"] = "あいうえお"