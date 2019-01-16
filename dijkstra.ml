#use "eki_t.ml"
#use "seiretsu.ml"
#use "dijkstra_main.ml"

(* Ex 16.5 version *)
(*
(* 目的 : 始点の駅名 (ローマ字) と終点の駅名 (ローマ字) を受け取ったら、         *)
(*       seiretsu を使って global_ekimei_list の重複を取り除き、           *)
(*       romaji_to_kanji を使って始点と終点を使って始点と終点の漢字表記を求め、 *)
(*       make_initial_eki_list を使って駅のリスト (eki_t list 型)を作り    *)
(*       dijkstra_main を使って、各駅までの最短路を確定し、                  *)
(*       その中から終点の駅のレコード (eki_t 型)を返す                       *)
(* dijkstra : string -> string -> eki_t *)
let dijkstra shiten shuten =
    (* 目的 : ローマ字の駅名と駅名リスト (ekimei_t list 型) を受け取ったら、 *)
    (*       その駅の漢字表記を文字列で返す                               *)
    (* romaji_to_kanji : string -> ekimei_t list -> string *)
    let rec romaji_to_kanji ekiromaji lst = match lst with
        [] -> ""
        | {kanji = kanji; kana = kana; romaji = romaji; shozoku = shozoku} :: rest ->
            if ekiromaji = romaji then kanji
            else romaji_to_kanji ekiromaji rest


    (* 目的 : ekimei_t 型のリスト lst と始点を受け取り、 eki_t 型のリストを作る    *)
    (*       始点の場合は saitan_kyori は 0、 temae_list は始点のみからなるリスト *)
    (*       それ以外の場合は、saitan_kyori フィールドは無限大、 temae_list は空  *)
    in let make_initial_eki_list lst kiten =
        List.map
        (fun ekimei -> match ekimei with
        {kanji = kanji; kana = kana; romaji = r; shozoku = s} ->
        if kiten = kanji then {namae = kanji; saitan_kyori = 0.0; temae_list = [kanji]}
        else {namae = kanji; saitan_kyori = infinity; temae_list = []})
        lst

    (* 目的 : shuten のレコードを探す *)
    in let rec find shuten result_lst = match result_lst with
        [] -> {namae = ""; saitan_kyori = 0.0; temae_list = []}
        | ({namae = n; saitan_kyori = s; temae_list = l} as first) :: rest -> 
             if n = shuten then first
             else find shuten rest


    in let seiretsu_global_ekimei_list = seiretsu global_ekimei_list
    in let shiten_kanji = romaji_to_kanji shiten seiretsu_global_ekimei_list 
    in let shuten_kanji = romaji_to_kanji shuten seiretsu_global_ekimei_list
    in let eki_list = make_initial_eki_list seiretsu_global_ekimei_list shiten_kanji
    in let dijkstra_eki_list = dijkstra_main eki_list global_ekikan_list
    in find shuten_kanji dijkstra_eki_list 

                                                                            *)

(* Ex 17.15 version *)

(* 目的 : 始点の駅名 (ローマ字) と終点の駅名 (ローマ字) を受け取ったら、         *)
(*       seiretsu を使って global_ekimei_list の重複を取り除き、           *)
(*       romaji_to_kanji を使って始点と終点を使って始点と終点の漢字表記を求め、 *)
(*       make_initial_eki_list を使って駅のリスト (eki_t list 型)を作り    *)
(*       dijkstra_main を使って、各駅までの最短路を確定し、                  *)
(*       その中から終点の駅のレコード (eki_t 型)を返す                       *)
(* dijkstra : string -> string -> eki_t *)
let dijkstra shiten shuten =
    (* 目的 : ローマ字の駅名と駅名リスト (ekimei_t list 型) を受け取ったら、 *)
    (*       その駅の漢字表記を文字列で返す                               *)
    (* romaji_to_kanji : string -> ekimei_t list -> string *)
    let rec romaji_to_kanji ekiromaji lst = match lst with
        [] -> ""
        | {kanji = kanji; kana = kana; romaji = romaji; shozoku = shozoku} :: rest ->
            if ekiromaji = romaji then kanji
            else romaji_to_kanji ekiromaji rest


    (* 目的 : ekimei_t 型のリスト lst と始点を受け取り、 eki_t 型のリストを作る    *)
    (*       始点の場合は saitan_kyori は 0、 temae_list は始点のみからなるリスト *)
    (*       それ以外の場合は、saitan_kyori フィールドは無限大、 temae_list は空  *)
    in let make_initial_eki_list lst kiten =
        List.map
        (fun ekimei -> match ekimei with
        {kanji = kanji; kana = kana; romaji = r; shozoku = s} ->
        if kiten = kanji then {namae = kanji; saitan_kyori = 0.0; temae_list = [kanji]}
        else {namae = kanji; saitan_kyori = infinity; temae_list = []})
        lst

    (* 目的 : shuten のレコードを探す *)
    in let rec find shuten result_lst = match result_lst with
        [] -> {namae = ""; saitan_kyori = 0.0; temae_list = []}
        | ({namae = n; saitan_kyori = s; temae_list = l} as first) :: rest -> 
             if n = shuten then first
             else find shuten rest


    in let global_ekikan_tree_t = inserts_ekikan Empty global_ekikan_list
    in let seiretsu_global_ekimei_list = seiretsu global_ekimei_list
    in let shiten_kanji = romaji_to_kanji shiten seiretsu_global_ekimei_list 
    in let shuten_kanji = romaji_to_kanji shuten seiretsu_global_ekimei_list
    in let eki_list = make_initial_eki_list seiretsu_global_ekimei_list shiten_kanji
    in let dijkstra_eki_list = dijkstra_main eki_list global_ekikan_tree_t
    in find shuten_kanji dijkstra_eki_list 

(* テスト *)
let test1 = dijkstra "shibuya" "shibuya" 
    = {namae = "渋谷"; saitan_kyori = 0.0; temae_list = ["渋谷"]}
let test2 = dijkstra "kitasenju" "nishinippori" 
    = {namae = "西日暮里"; saitan_kyori = 4.3; temae_list = ["西日暮里"; "町屋"; "北千住"]}
