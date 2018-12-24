(* 目的 : 名前 name と 成績 seiseki の組を受け取ったら、 *)
(*       「〇〇さんの評価は△です」という文字列を返す      *)
(* seiseki : string * string -> string *)
let seiseki x = match x with
    (name, seiseki) -> name ^ "さんの評価は" ^ seiseki ^ "です"

(* テスト *)
let test1 = seiseki ("山田", "不可") = "山田さんの評価は不可です"
let test2 = seiseki ("佐藤", "良")   = "佐藤さんの評価は良です" 
let test3 = seiseki ("田中", "優")   = "田中さんの評価は優です"