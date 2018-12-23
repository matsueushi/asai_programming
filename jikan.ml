(* 目的 : 時間 x を受け取り、午前か午後かを返す関数 *)
(* jikan : int -> string *)
let jikan x = 
    if x < 12 then "午前"
              else "午後"

(* テスト *)
let test1 = jikan 6 = "午前"
let test2 = jikan 12 = "午後"
let test3 = jikan 18 = "午後"