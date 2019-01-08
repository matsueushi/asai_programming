(* 目的 : 文字列のリスト lst を受け取ったら、その中の要素を前から順に *)
(*       連結した文字列を返す                                   *)
(* concat : string list -> string *)

(* Ex 9.6 version *)

(* 目的 : 文字列のリスト lst を受け取ったら、その中の要素を前から順に *)
(*       連結した文字列を返す                                   *)
(* concat : string list -> string *)
(* let rec concat lst = match lst with 
    [] -> ""
    | first :: rest -> first ^ concat rest *)


(* Ex 14.3 version *)

(* 目的 : 文字列 str1 と文字列 str2 を受け取り、結合した文字列を返す *)
(* let concat_str str1 str2 = str1 ^ str2 *)

(* 目的 : 文字列のリスト lst を受け取ったら、その中の要素を前から順に *)
(*       連結した文字列を返す                                   *)
(* concat : string list -> string *)
(* let concat lst = List.fold_right concat_str lst "" *)


(* Ex 14.5 version *)

(* 目的 : 文字列のリスト lst を受け取ったら、その中の要素を前から順に *)
(*       連結した文字列を返す                                   *)
(* concat : string list -> string *)
let concat lst = 
    (* 目的 : 文字列 str1 と文字列 str2 を受け取り、結合した文字列を返す *)
    let concat_str str1 str2 = str1 ^ str2 in
        List.fold_right concat_str lst ""

(* テスト *)
let test1 = concat [] = ""
let test2 = concat ["A"] = "A"
let test3 = concat ["春"; "夏"; "秋"; "冬"] = "春夏秋冬"
let test4 = concat ["あ"; "い"; "う"; "え"; "お"] = "あいうえお"