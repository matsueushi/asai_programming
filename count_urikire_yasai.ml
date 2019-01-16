#use "price.ml"

(* 目的 : 野菜のリストと八百屋のリストを受け取り、野菜のリストのうち八百屋に無い野菜の数を返す *)
(* count_urikire_yasai : string int -> (string * int) list -> int *)
let rec count_urikire_yasai yasai_list yaoya_list = 
    match yasai_list with
        [] -> 0
        | first :: rest -> 
            match price first yaoya_list with
                None -> 1 + count_urikire_yasai rest yaoya_list
                | Some(p) -> count_urikire_yasai rest yaoya_list

(* テスト *)
let test1 = count_urikire_yasai ["トマト"; "たまねぎ"] yaoya_list = 0 
let test2 = count_urikire_yasai ["トマト"; "じゃがいも"] yaoya_list = 1