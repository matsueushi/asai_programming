#use "ekimei_t.ml" 
#use "eki_t.ml"

(* 目的 : ekimei_t 型のリストを受け取ったら、その駅名を使って eki_t 型のリストを作る *)
(*       saitan_kyori フィールドは無限大、temae_list フィールドに空リストを入れる  *)
(* make_eki_list : ekimei_t list -> eki_t list *)
let rec make_eki_list lst = match lst with
    [] -> []
    | {kanji = kanji; kana = kana; romaji = r; shozoku = s} :: rest ->
        {namae = kanji; saitan_kyori = infinity; temae_list = []}
        :: make_eki_list rest

(* テスト *)
let test1 = make_eki_list [] = []
let test2 = make_eki_list 
    [{kanji = "代々木上原"; kana = "よよぎうはら"; romaji = "yoyogiuehara"; shozoku = "千代田線"}]
    = [{namae = "代々木上原"; saitan_kyori = infinity; temae_list = []}]
let test3 = make_eki_list [
    {kanji = "代々木上原"; kana = "よよぎうえはら"; romaji = "yoyogiuehara"; shozoku = "千代田線"}; 
    {kanji = "代々木公園"; kana = "よよぎこうえん"; romaji = "yoyogikouen"; shozoku = "千代田線"}]
    = [{namae = "代々木上原"; saitan_kyori = infinity; temae_list = []};
       {namae = "代々木公園"; saitan_kyori = infinity; temae_list = []}]