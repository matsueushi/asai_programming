(* Ex 17.11 version *)

(* 目的 : 「駅名」と「駅名と距離の組のリスト」を受けとったら、その駅までの距離を返す *)
(* assoc : string -> (string * float) list -> float *)
(* let rec assoc ekimei lst = match lst with
    [] -> infinity
    | (e, d) :: rest ->  if e = ekimei then d
                         else assoc ekimei rest  *)

(* テスト *)
(* let test1 = assoc "後楽園" [] = infinity
let test2 = assoc "後楽園" [("新大阪", 1.2); ("後楽園", 1.8)] = 1.8
let test3 = assoc "池袋" [("新大阪", 1.2); ("後楽園", 1.8)] = infinity  *)


(* Ex 18.3 version *)

(* 目的 : 「駅名」と「駅名と距離の組のリスト」を受けとったら、その駅までの距離を返す *)
(* assoc : 'a -> ('a * 'b) list -> 'b *)
let rec assoc ekimei lst = match lst with
    [] -> raise Not_found 
    | (e, d) :: rest ->  if e = ekimei then d
                         else assoc ekimei rest 

(* テスト *)
let test2 = assoc "後楽園" [("新大阪", 1.2); ("後楽園", 1.8)] = 1.8