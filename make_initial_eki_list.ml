#use "ekimei_t.ml"
#use "eki_t.ml"

(* 目的 : ekimei_t 型のリスト lst と始点を受け取り、 eki_t 型のリストを作る    *)
(*       始点の場合は saitan_kyori は 0、 temae_list は始点のみからなるリスト *)
(*       それ以外の場合は、saitan_kyori フィールドは無限大、 temae_list は空  *)
let make_initial_eki_list lst kiten =
    List.map
    (fun ekimei -> match ekimei with
    {kanji = kanji; kana = kana; romaji = r; shozoku = s} ->
    if kiten = kanji then {namae = kanji; saitan_kyori = 0.0; temae_list = [kanji]}
    else {namae = kanji; saitan_kyori = infinity; temae_list = []})
    lst

(* テスト *)
let test1 = make_initial_eki_list [] "代々木上原" = []
let test2 = make_initial_eki_list 
    [{kanji = "代々木上原"; kana = "よよぎうはら"; romaji = "yoyogiuehara"; shozoku = "千代田線"}]
    "代々木上原"
    = [{namae = "代々木上原"; saitan_kyori = 0.0; temae_list = ["代々木上原"]}] 
let test3 = make_initial_eki_list 
    [{kanji = "代々木上原"; kana = "よよぎうえはら"; romaji = "yoyogiuehara"; shozoku = "千代田線"}; 
    {kanji = "代々木公園"; kana = "よよぎこうえん"; romaji = "yoyogikouen"; shozoku = "千代田線"}]
    "代々木公園"
    = [{namae = "代々木上原"; saitan_kyori = infinity; temae_list = []};
    {namae = "代々木公園"; saitan_kyori = 0.0; temae_list = ["代々木公園"]}]