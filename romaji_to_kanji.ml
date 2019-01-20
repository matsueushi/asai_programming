#use "ekimei_t.ml"

(* Ex 18.6 *)
(* 駅が存在しないことを示す例外 *)
exception No_such_station of string

(* Ex 10.10 version *)

(* 目的 : ローマ字の駅名と駅名リスト (ekimei_t list 型) を受け取ったら、 *)
(*       その駅の漢字表記を文字列で返す                               *)
(* romaji_to_kanji : string -> ekimei_t list -> string *)
(* let rec romaji_to_kanji ekiromaji lst = match lst with
    [] -> ""
    | {kanji = kanji; kana = kana; romaji = romaji; shozoku = shozoku} :: rest ->
        if ekiromaji = romaji then kanji
        else romaji_to_kanji ekiromaji rest *)

(* テスト *)
(* let test1 = romaji_to_kanji "atami" global_ekimei_list = ""
let test2 = romaji_to_kanji "myogadani" global_ekimei_list = "茗荷谷"
let test3 = romaji_to_kanji "shibuya" global_ekimei_list = "渋谷"
let test4 = romaji_to_kanji "ebisu" global_ekimei_list = "恵比寿" *)

(* Ex 10.10 version *)

(* 目的 : ローマ字の駅名と駅名リスト (ekimei_t list 型) を受け取ったら、 *)
(*       その駅の漢字表記を文字列で返す                               *)
(* romaji_to_kanji : string -> ekimei_t list -> string *)
let rec romaji_to_kanji ekiromaji lst = match lst with
    [] -> raise (No_such_station ekiromaji)
    | {kanji = kanji; kana = kana; romaji = romaji; shozoku = shozoku} :: rest ->
        if ekiromaji = romaji then kanji
        else romaji_to_kanji ekiromaji rest

(* テスト *)
let test2 = romaji_to_kanji "myogadani" global_ekimei_list = "茗荷谷"
let test3 = romaji_to_kanji "shibuya" global_ekimei_list = "渋谷"
let test4 = romaji_to_kanji "ebisu" global_ekimei_list = "恵比寿"