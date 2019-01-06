#use "make_eki_list.ml"

(* 目的 : eki_t 型のリストと起点(漢字の文字列)を受け取ったら、起点のみ *)
(*       saitan_kyori は 0                                    *)
(*       temae_list は始点の駅名のみからなるリスト                 *)
(*       となっている eki_t 型のリストを返す                      *)
(* shokika : eki_t list -> eki_t list *)
let rec shokika lst kiten = match lst with 
    [] -> []
    |{namae = n; saitan_kyori = s; temae_list = t} as first :: rest ->
        if kiten = n then
            {namae = n; saitan_kyori = 0.0; temae_list = [n]}
            :: shokika rest kiten
        else first :: shokika rest kiten

(* テスト *)
let test1 = shokika [] "代々木上原" = []
let test2 = shokika 
    [{namae = "代々木上原"; saitan_kyori = infinity; temae_list = []}] "代々木上原"
    = [{namae = "代々木上原"; saitan_kyori = 0.0; temae_list = ["代々木上原"]}] 
let test3 = shokika
    [{namae = "代々木上原"; saitan_kyori = infinity; temae_list = []};
    {namae = "代々木公園"; saitan_kyori = infinity; temae_list = []}] "代々木公園"
    = [{namae = "代々木上原"; saitan_kyori = infinity; temae_list = []};
    {namae = "代々木公園"; saitan_kyori = 0.0; temae_list = ["代々木公園"]}]