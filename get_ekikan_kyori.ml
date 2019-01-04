#use "metro.ml"

(* 目的 : 始点と終点の駅名と(文字列)と駅間リスト(ekikan_t list型)を受け取ったら、 *)
(*       駅間リストの中から2駅間の距離を返す                                  *)
(*       直接繋がっていないときは infinity が返ってくる                       *)
(* get_route_kyori : string -> string -> ekikan_t list -> float *)
let rec get_route_kyori eki1 eki2 lst = match lst with
    [] -> infinity
    | {kiten = k; shuten = s; keiyu = r; kyori = d; jikan = t} :: rest ->
        if eki1 = k && eki2 = s then d
        else get_route_kyori eki1 eki2 rest

(* テスト *)
let get_route_kyori_test1 = 
    get_route_kyori "茗荷谷" "新大塚" global_ekikan_list = infinity
let get_route_kyori_test2 = 
    get_route_kyori "渋谷" "日本橋" global_ekikan_list = infinity
let get_route_kyori_test3 = 
    get_route_kyori "新大塚" "茗荷谷" global_ekikan_list = 1.2 
let get_route_kyori_test4 = 
    get_route_kyori "広尾" "六本木" global_ekikan_list = 1.7


(* 目的 : 感じの駅名を二つ(文字列)と駅間リスト(ekikan_t list型)を受け取ったら、 *)
(*       駅間リストの中から2駅間の距離を返す                                *)
(*       どちらの順番で問い合わせても正しく距離が帰ってくるように作る           *)
(*       直接繋がっていないときは infinity が返ってくる                     *)
(* get_ekikan_kyori : string -> string -> ekikan_t list -> float *)
let get_ekikan_kyori eki1 eki2 lst =
    min (get_route_kyori eki1 eki2 lst) (get_route_kyori eki2 eki1 lst)

(* テスト *)
let get_ekikan_kyori_test1 = 
    get_ekikan_kyori "茗荷谷" "新大塚" global_ekikan_list = 1.2
let get_ekikan_kyori_test2 = 
    get_ekikan_kyori "渋谷" "日本橋" global_ekikan_list = infinity
let get_ekikan_kyori_test3 = 
    get_ekikan_kyori "新大塚" "茗荷谷" global_ekikan_list = 1.2
let get_ekikan_kyori_test4 = 
    get_ekikan_kyori "広尾" "六本木" global_ekikan_list = 1.7