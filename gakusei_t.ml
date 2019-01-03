(* 学生一人分のデータ (名前、点数、成績) を表す型 *)
type gakusei_t = {
    name : string;  (* 名前 *)
    score : int;    (* 点数 *)
    grade : string; (* 成績 *)
}

(* gakusei_t 型のデータの例 *) 
let gakusei1 = {name = "asai"; score = 70; grade = "B"} 
let gakusei2 = {name = "kaneko"; score = 85; grade = "A"}
let gakusei3 = {name = "yoshida"; score = 80; grade = "A"}
let gakusei4 = {name = "tanaka"; score = 10; grade = "D"}
let gakusei5 = {name = "saito"; score = 50; grade = "C"}

(* gakusei_t list 型のデータの例 *)
let lst1 = []
let lst2 = [gakusei1]
let lst3 = [gakusei1; gakusei2]
let lst4 = [gakusei3; gakusei1; gakusei2]
let lst5 = [gakusei2; gakusei3; gakusei4]
let lst6 = [gakusei1; gakusei2; gakusei3; gakusei4; gakusei5]