#use "koushin1.ml"

(* 目的 : 直前に確定した駅 p (eki_t 型) と未確定の駅のリスト v (eki_t list 型)  *)
(*       を受け取ったら、必要な更新処理を行った後の未確定の駅のリストを返す         *)
(* koushin : eki_t -> eki_t list -> eki_t list *)
let koushin eki lst =
    let f x = koushin1 eki x in List.map f lst 

(* テスト *)
let test1 = koushin 
    {namae = "代々木上原"; saitan_kyori = 0.0; temae_list = ["代々木上原"]} [] = []
let test2 = koushin 
    {namae = "代々木上原"; saitan_kyori = 0.0; temae_list = ["代々木上原"]}
    [{namae = "代々木公園"; saitan_kyori = infinity; temae_list = []};
    {namae = "赤坂"; saitan_kyori = infinity; temae_list = []}]
    = [{namae = "代々木公園"; saitan_kyori = 1.0; temae_list = ["代々木公園"; "代々木上原"]};
    {namae = "赤坂"; saitan_kyori = infinity; temae_list = []}]