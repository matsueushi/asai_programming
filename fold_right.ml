(* 目的 : init から始めて lst の要素を右から順に f を施しこむ *)
(* fold_right : ('a -> 'b -> 'b) -> 'a list -> 'b -> 'b *)
let rec fold_right f lst init = match lst with
    [] -> init
    | first :: rest -> f first (fold_right f rest init)

