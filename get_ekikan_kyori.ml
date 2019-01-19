(* Ex 10.11 version 

#use "ekikan_t.ml"

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


(* 目的 : 漢字の駅名を二つ(文字列)と駅間リスト(ekikan_t list型)を受け取ったら、 *)
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

                                                            *)

(* Ex 17.14 version *)
(* #use "assoc.ml"
#use "ekikan_t.ml"
#use "inserts_ekikan.ml" *)

(* 目的 :  漢字の駅名二つと ekikan_tree_t 型の気を受け取り、2 駅間の距離を返す *)
(* get_ekikan_kyori : string -> string -> ekikan_tree_t -> float *)
(* let rec get_ekikan_kyori eki1 eki2 tree = match tree with 
    Empty -> infinity
    | Node (t1, eki, lst, t2) -> 
        if eki1 = eki then assoc eki2 lst  
        else if eki1 < eki then get_ekikan_kyori eki1 eki2 t1
        else get_ekikan_kyori eki1 eki2 t2  *)

(* テスト *)
(* let global_ekikan_tree_t = inserts_ekikan Empty global_ekikan_list
let get_ekikan_kyori_test1 = 
    get_ekikan_kyori "茗荷谷" "新大塚" global_ekikan_tree_t = 1.2
let get_ekikan_kyori_test2 = 
    get_ekikan_kyori "渋谷" "日本橋" global_ekikan_tree_t = infinity
let get_ekikan_kyori_test3 = 
    get_ekikan_kyori "新大塚" "茗荷谷" global_ekikan_tree_t = 1.2
let get_ekikan_kyori_test4 = 
    get_ekikan_kyori "広尾" "六本木" global_ekikan_tree_t = 1.7 *)


(* Ex 18.4 version *)
#use "assoc.ml"
#use "ekikan_t.ml"
#use "inserts_ekikan.ml"

(* 二つの駅が繋がっていなかったことを示す例外 *)
exception Not_found

(* 目的 :  漢字の駅名二つと ekikan_tree_t 型の気を受け取り、2 駅間の距離を返す *)
(* get_ekikan_kyori : string -> string -> ekikan_tree_t -> float *)
let rec get_ekikan_kyori eki1 eki2 tree = match tree with 
    Empty -> raise Not_found 
    | Node (t1, eki, lst, t2) -> 
        if eki1 = eki then assoc eki2 lst  
        else if eki1 < eki then get_ekikan_kyori eki1 eki2 t1
        else get_ekikan_kyori eki1 eki2 t2 

(* テスト *)
let global_ekikan_tree_t = inserts_ekikan Empty global_ekikan_list
let get_ekikan_kyori_test1 = 
    get_ekikan_kyori "茗荷谷" "新大塚" global_ekikan_tree_t = 1.2
let get_ekikan_kyori_test3 = 
    get_ekikan_kyori "新大塚" "茗荷谷" global_ekikan_tree_t = 1.2
let get_ekikan_kyori_test4 = 
    get_ekikan_kyori "広尾" "六本木" global_ekikan_tree_t = 1.7