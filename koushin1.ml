#use "eki_t.ml"
#use "get_ekikan_kyori.ml"

(* 目的 : 直前に確定した駅 p (eki_t 型) と未確定の駅 q (eki_ t 型) を受け取り、   *)
(*        p と q が直接繋がっているかどうかを調べ、繋がっていたら q の最短距離と手前 *)
(*        リストを必要に応じて更新したものを返し、繋がっていなければ元の q を返す    *)
(* koushin1 : eki_t -> eki_t -> eki_t *)
let koushin1 p q = 
    match p with {namae = n_p; saitan_kyori = s_p; temae_list = t_p} ->
    match q with {namae = n_q; saitan_kyori = s_q; temae_list = t_q} ->
    let ekikan = get_ekikan_kyori n_p n_q global_ekikan_list in
        if ekikan = infinity then q
        else if s_p +. ekikan < s_q then 
            {namae = n_q; saitan_kyori = s_p +. ekikan; temae_list = n_q :: t_p}
        else q

(* テスト *)
let test1 = koushin1 {namae = "代々木上原"; saitan_kyori = 0.0; temae_list = ["代々木上原"]}
                     {namae = "代々木公園"; saitan_kyori = infinity; temae_list = []}
            = {namae = "代々木公園"; saitan_kyori = 1.0; temae_list = ["代々木公園"; "代々木上原"]}
let test2 = koushin1 {namae = "代々木上原"; saitan_kyori = 0.0; temae_list = ["代々木上原"]}
                     {namae = "赤坂"; saitan_kyori = infinity; temae_list = []}
            = {namae = "赤坂"; saitan_kyori = infinity; temae_list = []}
let test3 = koushin1 {namae = "代々木公園"; saitan_kyori = 1.0; temae_list = ["代々木公園"; "代々木上原"]}
                     {namae = "明治神宮前"; saitan_kyori = 5.0; temae_list = ["明治神宮前"; "代々木上原"]}
            = {namae = "明治神宮前"; saitan_kyori = 2.2; temae_list = ["明治神宮前"; "代々木公園"; "代々木上原"]}
let test4 = koushin1 {namae = "代々木公園"; saitan_kyori = 1.0; temae_list = ["代々木公園"; "代々木上原"]}
                     {namae = "明治神宮前"; saitan_kyori = 2.0; temae_list = ["明治神宮前"; "代々木上原"]}
            = {namae = "明治神宮前"; saitan_kyori = 2.0; temae_list = ["明治神宮前"; "代々木上原"]}