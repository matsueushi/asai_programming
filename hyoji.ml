(* 駅名の情報を格納するレコード型 *)
type ekimei_t = {
    kanji : string;     (* 漢字の駅名 *)
    kana : string;      (* ひらがなの駅名 *)
    romaji : string;    (* ローマ字の駅名 *)
    shozoku : string;   (* 駅が所属する路線名 *)
}


(* 目的 : ekimei_t 型のデータを受け取ってきたら、    *)
(*       「路線名, 駅名 (かな) 」の形式の文字列を返す *)
(* hyoji : ekimei_t -> string *)
let hyoji ekimei = match ekimei with
    {kanji = k; kana = h; romaji = r; shozoku =s} ->
        s ^ ", " ^ k ^ " (" ^ h ^ ") "


(* テスト *)
let test1 = hyoji {kanji = "茗荷谷"; kana = "みょうがだに";
                   romaji = "myogadani"; shozoku = "丸ノ内線"}
                = "丸ノ内線, 茗荷谷 (みょうがだに) "
let test2 = hyoji {kanji = "両国"; kana = "りょうごく";
                   romaji = "ryogoku"; shozoku = "総武線"}
                = "総武線, 両国 (りょうごく) "
let test3 = hyoji {kanji = "下北沢"; kana = "しもきたざわ";
                   romaji = "shimokitazawa"; shozoku = "井の頭線"}
                = "井の頭線, 下北沢 (しもきたざわ) "