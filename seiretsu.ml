#use "ekimei_t.ml"

(* 目的 : あらかじめひらがなの順に整列している ekimei_t 型のリスト lst と ekimei_t 型の *)
(*       駅 eki を受け取り、 lst を前から順に見ていき、昇順となる位置に eki を挿入する   *)
(*       すでに同じひらがながあったら挿入しない                                      *)
let rec ins_eki lst eki = match lst with
    [] -> [eki]
    | {kanji = kanji0; kana = kana0; romaji = romaji0; shozoku = shozoku0} as first 
        :: rest -> match eki with 
            {kanji = kanji; kana = kana; romaji = romaji; shozoku = shozoku} -> 
            if kana < kana0 then eki :: first :: rest 
            else if kana = kana0 then lst
            else first :: ins_eki rest eki 

(* テスト *)
let ins_eki_test1 = ins_eki []
    {kanji="渋谷"; kana="しぶや"; romaji="shibuya"; shozoku="銀座線"} 
    = [{kanji="渋谷"; kana="しぶや"; romaji="shibuya"; shozoku="銀座線"}]
let ins_eki_test2 = ins_eki 
    [{kanji="渋谷"; kana="しぶや"; romaji="shibuya"; shozoku="銀座線"}]
    {kanji="渋谷"; kana="しぶや"; romaji="shibuya"; shozoku="半蔵門線"}
    = [{kanji="渋谷"; kana="しぶや"; romaji="shibuya"; shozoku="銀座線"}]
let ins_eki_test3 = ins_eki
    [{kanji="九段下"; kana="くだんした"; romaji="kudanshita"; shozoku="半蔵門線"};
    {kanji="半蔵門"; kana="はんぞうもん"; romaji="hanzomon"; shozoku="半蔵門線"}] 
    {kanji="築地"; kana="つきじ"; romaji="tsukiji"; shozoku="日比谷線"} 
    = [{kanji="九段下"; kana="くだんした"; romaji="kudanshita"; shozoku="半蔵門線"};
    {kanji="築地"; kana="つきじ"; romaji="tsukiji"; shozoku="日比谷線"};
    {kanji="半蔵門"; kana="はんぞうもん"; romaji="hanzomon"; shozoku="半蔵門線"}] 


(* 目的 : ekimei_t 型のリストを受け取ったら、ひらがなの順に整列し、駅の重複を取り除いた *)
(*       ekimae_t 型のリストを返す                                            *)
(* seiretsu : ekimei_t list -> ekimei_t list *)
let rec seiretsu lst = match lst with
    [] -> []
    | first :: rest -> ins_eki (seiretsu rest) first 

(* テスト *)
let seiretsu_test1 = seiretsu [] = []
let seiretsu_test2 = seiretsu
    [{kanji="渋谷"; kana="しぶや"; romaji="shibuya"; shozoku="銀座線"}; 
    {kanji="渋谷"; kana="しぶや"; romaji="shibuya"; shozoku="半蔵門線"}] 
    = [{kanji="渋谷"; kana="しぶや"; romaji="shibuya"; shozoku="半蔵門線"}] 
let seiretsu_test3 = seiretsu
    [{kanji="渋谷"; kana="しぶや"; romaji="shibuya"; shozoku="銀座線"}; 
    {kanji="渋谷"; kana="しぶや"; romaji="shibuya"; shozoku="半蔵門線"}; 
    {kanji="表参道"; kana="おもてさんどう"; romaji="omotesandou"; shozoku="半蔵門線"}] 
    = [{kanji="表参道"; kana="おもてさんどう"; romaji="omotesandou"; shozoku="半蔵門線"}; 
    {kanji="渋谷"; kana="しぶや"; romaji="shibuya"; shozoku="半蔵門線"}] 