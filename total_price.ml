#use "price.ml"

(* 目的 : yasai_list を買った時の値段の合計を調べる *)
(* total_price : string list -> (string * int) list -> int *)
let rec total_price yasai_list yaoya_list = match yasai_list with
    [] -> 0
    | first :: rest ->
        match price first yaoya_list with
            None -> total_price rest yaoya_list
            | Some (p) -> p + total_price rest yaoya_list

(* 目的 *)
let test1 = total_price ["トマト"; "たまねぎ"] yaoya_list = 500
let test2 = total_price ["トマト"; "じゃがいも"] yaoya_list = 300 
