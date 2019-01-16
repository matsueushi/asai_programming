#use "ekikan_t.ml"
#use "saitan_wo_bunri.ml"

(* eki_t.mlを二度読み込むのを防ぐため *)
(* Ex 16.3 version *)

(*

#use "get_ekikan_kyori.ml"

(* 目的 : 直前に確定した駅 p (eki_t 型) と未確定の駅のリスト lst (eki_t list 型)  *)
(*       を受け取ったら、必要な更新処理を行った後の未確定の駅のリストを返す         *)
(* koushin : eki_t -> eki_t list -> ekikan_t list -> eki_t list *)
let koushin p lst ekikan_list = match p with
    {namae = n_p; saitan_kyori = s_p; temae_list = t_p} ->
    List.map 
    (fun q -> match q with 
    {namae = n_q; saitan_kyori = s_q; temae_list = t_q} ->
    let ekikan = get_ekikan_kyori n_p n_q ekikan_list in
        if ekikan = infinity then q
        else if s_p +. ekikan < s_q then
            {namae = n_q; saitan_kyori = s_p +. ekikan; temae_list = n_q :: t_p}
        else q)
    lst

(* 目的 : eki_t list 型の (未確定の) リストとekikan_t list 型の駅間のリスト *)
(*       を受け取ったら、ダイクストラのアルゴリズムに従って各駅について最短距離  *)
(*       と最短経路が正しく入ったリスト(eki_t list 型)を返す                *)
(* dijkstra_main : eki_t list -> ekikan_t list -> eki_t list *)
let rec dijkstra_main eki_lst ekikan_lst = match eki_lst with
    [] -> []
    | first :: rest -> 
        let (saitan, nokori) = saitan_wo_bunri eki_lst in
        let updated_nokori = koushin saitan nokori ekikan_lst in
        saitan :: dijkstra_main updated_nokori ekikan_lst

(* length of nokori = length of eki_lst - 1 より終了する *)

(* テスト *)
let sample_eki_list = [
    {namae = "A"; saitan_kyori = 0.0; temae_list = ["A"]};
    {namae = "B"; saitan_kyori = infinity; temae_list = []};
    {namae = "C"; saitan_kyori = infinity; temae_list = []};
    {namae = "D"; saitan_kyori = infinity; temae_list = []};
    {namae = "E"; saitan_kyori = infinity; temae_list = []}
]
let sample_ekikan_list = [
    {kiten = "A"; shuten = "D"; keiyu = ""; kyori = 4.0; jikan = 0};
    {kiten = "A"; shuten = "B"; keiyu = ""; kyori = 10.0; jikan = 0};
    {kiten = "D"; shuten = "E"; keiyu = ""; kyori = 3.0; jikan = 0};
    {kiten = "B"; shuten = "E"; keiyu = ""; kyori = 2.0; jikan = 0};
    {kiten = "B"; shuten = "C"; keiyu = ""; kyori = 2.0; jikan = 0};
    {kiten = "E"; shuten = "C"; keiyu = ""; kyori = 1.0; jikan = 0};
]
let result_eki_list = [
    {namae = "A"; saitan_kyori = 0.0; temae_list = ["A"]};
    {namae = "D"; saitan_kyori = 4.0; temae_list = ["D"; "A"]};
    {namae = "E"; saitan_kyori = 7.0; temae_list = ["E"; "D"; "A"]};
    {namae = "C"; saitan_kyori = 8.0; temae_list = ["C"; "E"; "D"; "A"]};
    {namae = "B"; saitan_kyori = 9.0; temae_list = ["B"; "E"; "D"; "A"]}
]

let test = dijkstra_main sample_eki_list sample_ekikan_list = result_eki_list

                                                                    *)

(* Ex 17.14 version *)

#use "get_ekikan_kyori.ml"

(* 目的 : 直前に確定した駅 p (eki_t 型) と未確定の駅のリスト lst (eki_t list 型)  *)
(*       を受け取ったら、必要な更新処理を行った後の未確定の駅のリストを返す         *)
(* koushin : eki_t -> eki_t list -> ekikan_tree_t -> eki_t list *)
let koushin p lst ekikan_tree = match p with
    {namae = n_p; saitan_kyori = s_p; temae_list = t_p} ->
    List.map 
    (fun q -> match q with 
    {namae = n_q; saitan_kyori = s_q; temae_list = t_q} ->
    let ekikan = get_ekikan_kyori n_p n_q ekikan_tree in
        if ekikan = infinity then q
        else if s_p +. ekikan < s_q then
            {namae = n_q; saitan_kyori = s_p +. ekikan; temae_list = n_q :: t_p}
        else q)
    lst

(* 目的 : eki_t list 型の (未確定の) リストとekikan_t list 型の駅間のリスト *)
(*       を受け取ったら、ダイクストラのアルゴリズムに従って各駅について最短距離  *)
(*       と最短経路が正しく入ったリスト(eki_t list 型)を返す                *)
(* dijkstra_main : eki_t list -> ekikan_t list -> eki_t list *)
let rec dijkstra_main eki_lst ekikan_lst = match eki_lst with
    [] -> []
    | first :: rest ->
        (* let (saitan, nokori) = saitan_wo_bunri eki_lst in *)
        (* Ex 17.16 *)
        let (saitan, nokori) = saitan_wo_bunri first rest in
        let updated_nokori = koushin saitan nokori ekikan_lst in
        saitan :: dijkstra_main updated_nokori ekikan_lst

(* length of nokori = length of eki_lst - 1 より終了する *)

(* テスト *)
let sample_eki_list = [
    {namae = "A"; saitan_kyori = 0.0; temae_list = ["A"]};
    {namae = "B"; saitan_kyori = infinity; temae_list = []};
    {namae = "C"; saitan_kyori = infinity; temae_list = []};
    {namae = "D"; saitan_kyori = infinity; temae_list = []};
    {namae = "E"; saitan_kyori = infinity; temae_list = []}
]
let sample_ekikan_list = [
    {kiten = "A"; shuten = "D"; keiyu = ""; kyori = 4.0; jikan = 0};
    {kiten = "A"; shuten = "B"; keiyu = ""; kyori = 10.0; jikan = 0};
    {kiten = "D"; shuten = "E"; keiyu = ""; kyori = 3.0; jikan = 0};
    {kiten = "B"; shuten = "E"; keiyu = ""; kyori = 2.0; jikan = 0};
    {kiten = "B"; shuten = "C"; keiyu = ""; kyori = 2.0; jikan = 0};
    {kiten = "E"; shuten = "C"; keiyu = ""; kyori = 1.0; jikan = 0};
]
let result_eki_list = [
    {namae = "A"; saitan_kyori = 0.0; temae_list = ["A"]};
    {namae = "D"; saitan_kyori = 4.0; temae_list = ["D"; "A"]};
    {namae = "E"; saitan_kyori = 7.0; temae_list = ["E"; "D"; "A"]};
    {namae = "C"; saitan_kyori = 8.0; temae_list = ["C"; "E"; "D"; "A"]};
    {namae = "B"; saitan_kyori = 9.0; temae_list = ["B"; "E"; "D"; "A"]}
]

let sample_ekikan_tree_t = inserts_ekikan Empty sample_ekikan_list
let test = dijkstra_main sample_eki_list sample_ekikan_tree_t = result_eki_list
