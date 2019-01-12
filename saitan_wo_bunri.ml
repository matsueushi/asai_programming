#use "eki_t.ml"

(* 目的 : eki_t list 型のリストを受け取ったら、「最短距離最小の駅」と「最短距離最小の駅 *)
(*       以外からなるリスト」の組を返す                                          *)
(* saitan_wo_bunri : eki_t list -> eki_t * eki_t list *)
let saitan_wo_bunri lst = 
    let empty_eki = {namae = ""; saitan_kyori = infinity; temae_list = []}
    in match lst with
    [] -> (empty_eki, [])
    | first :: rest ->
    let min_eki e1 e2 = 
        match e1 with
        {namae = n1; saitan_kyori = s1; temae_list = l1} ->
        match e2 with
        {namae = n2; saitan_kyori = s2; temae_list = l2} ->
        if s1 <= s2 then e1
        else e2
    in let minimum_eki = List.fold_right min_eki lst empty_eki
    in (minimum_eki, List.filter (fun x -> x <> minimum_eki) lst)



(* テスト *)
let eki1 = {namae = "代々木上原"; saitan_kyori = 0.0; temae_list = ["代々木上原"]}
let eki2 = {namae = "代々木上原"; saitan_kyori = infinity; temae_list = []}
let eki3 = {namae = "代々木公園"; saitan_kyori = 0.0; temae_list = ["代々木公園"]}

let test1 = saitan_wo_bunri [eki1] = (eki1, [])
let test2 = saitan_wo_bunri [eki2] = (eki2, [])
let test3 = saitan_wo_bunri [eki2; eki3] = (eki3, [eki2])

