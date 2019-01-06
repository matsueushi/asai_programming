#use "hyouka.ml"

(* 目的 : 関数 f とリスト lst を受け取り f を施したリストを返す *)
(* map : ('a -> 'b) -> 'a list -> b' list *)
let rec map f lst = match lst with
    [] -> []
    | first :: rest -> f first :: map f rest


(* 目的 : 実数のリスト lst を受け取り各要素の平方根のリストを返す *)
(* map_sqrt : float list -> float list *)
(* let rec map_sqrt lst = match lst with
    [] -> []
    | first :: rest -> sqrt first :: map_sqrt rest *)
let rec map_sqrt lst = map sqrt lst

(* テスト *)
let map_sqrt_test1 = map_sqrt [] = []
let map_sqrt_test2 = map_sqrt [1.0] = [1.0]
let mpa_sqrt_test3 = map_sqrt [1.0; 4.0] = [1.0; 2.0]


(* 目的 : 学生のリスト lst を受け取り成績を入れたリストを返す *)
(* map_hyouka : gakusei_t list -> gakusei_t list *)
(* let rec map_hyouka lst = match lst with
    [] -> []
    | first :: rest -> hyouka first :: map_hyouka rest *)
let rec map_hyouka lst = map hyouka lst

let map_hyouka_test1 = map_hyouka [] = []
let map_hyouka_test2 = map_hyouka [{name = "asai"; score = 90; grade = ""}]
                     = [{name = "asai"; score = 90; grade = "A"}]
let map_hyouka_test3 = map_hyouka [{name = "asai"; score = 90; grade = ""};
                                   {name = "asai"; score = 55; grade = ""}]
                     = [{name = "asai"; score = 90; grade = "A"};
                        {name = "asai"; score = 55; grade = "D"}]  