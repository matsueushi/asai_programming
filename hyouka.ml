#use "gakusei_t.ml"

(* 目的 : 学生のデータ gakusei を受け取り成績のついたデータを返す *)
(* hyouka : gakusei_t -> gakusei_t *)
let hyouka gakusei = match gakusei with
    {name = n; score = s; grade = g} ->
        if      s >= 80 then {name = n; score = s; grade = "A"}
        else if s >= 70 then {name = n; score = s; grade = "B"}
        else if s >= 60 then {name = n; score = s; grade = "C"}
        else                 {name = n; score = s; grade = "D"}

(* テスト *)
let test1 = hyouka {name = "asai"; score = 90; grade = ""}
                 = {name = "asai"; score = 90; grade = "A"}
let test2 = hyouka {name = "asai"; score = 80; grade = ""}
                 = {name = "asai"; score = 80; grade = "A"}
let test3 = hyouka {name = "asai"; score = 75; grade = ""}
                 = {name = "asai"; score = 75; grade = "B"}
let test4 = hyouka {name = "asai"; score = 70; grade = ""}
                 = {name = "asai"; score = 70; grade = "B"}
let test5 = hyouka {name = "asai"; score = 65; grade = ""}
                 = {name = "asai"; score = 65; grade = "C"}
let test6 = hyouka {name = "asai"; score = 60; grade = ""}
                 = {name = "asai"; score = 60; grade = "C"}
let test7 = hyouka {name = "asai"; score = 55; grade = ""}
                 = {name = "asai"; score = 55; grade = "D"}