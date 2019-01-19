(* Section 18.1 version *)

(* 目的 : item の値段を調べる *)
(* price : string -> (string * int) list -> int option *)
(* let rec price item yaoya_list = match yaoya_list with
    [] -> None
    | (yasai, nedan) :: rest ->
        if item = yasai then Some (nedan)
        else price item rest *)

(* テスト *)
(* let yaoya_list = [("トマト", 300); ("たまねぎ", 200); ("にんじん", 150); ("ほうれん草", 200)]
let test1 = price "トマト" yaoya_list = Some (300)
let test2 = price "じゃがいも" yaoya_list = None *)

(* Section 18.5 version *)

(* 売り切れを示す例外 *)
exception Urikire

(* 目的 : item の値段を調べる *)
(* 見つからないときは Urikire という例外を発生する *)
(* price : string -> (string * int) list -> option *)
let rec price item yaoya_list = match yaoya_list with
    [] -> raise Urikire 
    | (yasai, nedan) :: rest ->
        if item = yasai then nedan
        else price item rest
        
(* テスト *)
let yaoya_list = [("トマト", 300); ("たまねぎ", 200); ("にんじん", 150); ("ほうれん草", 200)]
let test1 = price "トマト" yaoya_list = 300
