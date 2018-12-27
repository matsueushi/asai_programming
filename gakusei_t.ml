(* 学生一人分のデータ (名前、点数、成績) を表す型 *)
type gakusei_t = {
    name : string;  (* 名前 *)
    score : int;    (* 点数 *)
    grade : string; (* 成績 *)
}

(* gakusei_t list 型のデータの例 *)
let lst1 = []
let lst2 = [{name = "asai"; score = 70; grade = "B"}]
let lst3 = [{name = "asai"; score = 70; grade = "B"};
            {name = "kaneko"; score = 85; grade = "A"}]
let lst4 = [{name = "yoshida"; score = 80; grade = "A"};
            {name = "asai"; score = 70; grade = "B"};
            {name = "kaneko"; score = 85; grade = "A"}]