(* 距離と距離の合計を持つ型 *)
type distance_t = {
    kyori : float;  (* 距離 *)
    total : float;  (* 距離の合計 *)
}


(* 目的 : 先頭からリスト内の各点までの距離の合計を返す *)
(* total_distance : distance_t list -> distance_t list *)
let total_distance lst = 
    (* 目的 : 先頭からリストの中の各点までの距離の合計を計算する *)
    (*       ここで total0 はこれまでの距離の合計           *)
    (* hojo : distance_t list -> float -> distance_t list *)
    let rec hojo lst total0 = match lst with
        [] -> []
        | {kyori = k; total = t} :: rest -> 
            {kyori = k; total = total0 +. k} :: hojo rest (total0 +. k)
    in hojo lst 0.0


(* テスト *)
let test1 = total_distance [] = []

(* ちょっとずれる
[{kyori = 0.3; total = 0.3}; {kyori = 0.9; total = 1.2};
 {kyori = 1.4; total = 2.59999999999999964};
 {kyori = 0.8; total = 3.39999999999999947}] *)
let test2 = total_distance 
    [{kyori = 0.3; total = 0.}; {kyori = 0.9; total = 0.};
     {kyori = 1.4; total = 0.}; {kyori = 0.8; total = 0.}]
    = [{kyori = 0.3; total = 0.3}; {kyori = 0.9; total = 1.2};
    {kyori = 1.4; total = 2.6}; {kyori = 0.8; total = 3.4}] 
