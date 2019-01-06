#use "romaji_to_kanji.ml"
#use "get_ekikan_kyori.ml"

(* 目的 : ローマ字の駅名を二つ受け取ってきたら、その間の距離を調べ、 *)
(*       直接繋がっている場合は                               *)
(*      「A駅からB駅まではx kmです」                          *)
(*       と言う文字列を返し、繋がっている場合は、                *)
(*      「A駅とB駅は繋がっていません」                         *)
(*       と言う文字列を返す                                  *)
(*       そもそも入力されたローマ字の駅名が存在しなかった場合には、 *)
(*      「〜と言う駅は存在しません」                           *)
(*       と言う文字列を返す                                  *)
(* kyori_wo_hyoji : string -> string -> string *)
let kyori_wo_hyoji romaji1 romaji2 = 
    let ekikanji1 = romaji_to_kanji romaji1 global_ekimei_list in 
        if ekikanji1 = "" then romaji1 ^ "と言う駅は存在しません"
        else let ekikanji2 = romaji_to_kanji romaji2 global_ekimei_list in
            if ekikanji2 = "" then romaji2 ^ "と言う駅は存在しません"
            else let kyori = get_ekikan_kyori ekikanji1 ekikanji2 global_ekikan_list in
                if kyori = infinity then ekikanji1 ^ "駅と" ^ ekikanji2 ^ "駅は繋がっていません"
                else ekikanji1 ^ "駅から" ^ ekikanji2 ^ "駅までは" ^ string_of_float kyori ^ "kmです" 
        

(* テスト *)
let test1 = kyori_wo_hyoji "myogadani" "shinotsuka" 
            = "茗荷谷駅から新大塚駅までは1.2kmです"
let test2 = kyori_wo_hyoji "shibuya" "kitasenju"
            = "渋谷駅と北千住駅は繋がっていません"
let test3 = kyori_wo_hyoji "nagoya" "fukuoka"
            = "nagoyaと言う駅は存在しません"
let test4 = kyori_wo_hyoji "hiro" "roppongi"
            = "広尾駅から六本木駅までは1.7kmです"
