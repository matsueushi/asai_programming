#use "price.ml"

(* Section 18.2 version *)

(* 目的 : yasai_list を買った時の値段の合計を調べる *)
(* total_price : string list -> (string * int) list -> int *)
(* let rec total_price yasai_list yaoya_list = match yasai_list with
    [] -> 0
    | first :: rest ->
        match price first yaoya_list with
            None -> total_price rest yaoya_list
            | Some (p) -> p + total_price rest yaoya_list *)

(* テスト *)
(* let test1 = total_price ["トマト"; "たまねぎ"] yaoya_list = 500
let test2 = total_price ["トマト"; "じゃがいも"] yaoya_list = 300  *)


(* Section 18.3 version *)

(* 目的 : yasai_list を買った時の値段の合計を調べる *)
(* total_price : string list -> (string * int) list -> int *)
(* let rec total_price yasai_list yaoya_list =
    (* 目的 : yasai_list を買った時の値段の合計を調べる補助関数 *)
    (* hojo : string list -> int option *)
    let rec hojo yasai_list = match yasai_list with
    [] -> Some(0)
    | first :: rest ->
        match price first yaoya_list with
            None -> None
            | Some (p) -> match hojo rest with
                            None -> None
                            | Some (q) -> Some(p + q)
    in match hojo yasai_list with
        None -> 0
        | Some (p) -> p  *)



(* Section 18.5 version *)

(* 目的 : yasai_list を買った時の値段の合計を調べる *)
(* total_price : string list -> (string * int) list -> int *)
let rec total_price yasai_list yaoya_list =
    (* 目的 : yasai_list を買った時の値段の合計を調べる補助関数 *)
    (* hojo : string list -> int *)
    let rec hojo yasai_list = match yasai_list with
    [] -> 0
    | first :: rest ->
        price first yaoya_list + hojo rest
    in try
        hojo yasai_list 
        with Urikire -> 0

(* テスト *)
let test1 = total_price ["トマト"; "たまねぎ"] yaoya_list = 500
let test2 = total_price ["トマト"; "じゃがいも"] yaoya_list = 0 
let test3 = total_price ["たまねぎ"; "にんじん"] yaoya_list = 350
let test4 = total_price ["たまねぎ"; "じゃがいも"; "にんじん"] yaoya_list = 0