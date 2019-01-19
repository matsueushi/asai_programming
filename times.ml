(* 0 が見つかったことを示す例外 *)
exception Zero

(* 目的 : lst 中の整数を全て掛け合わせる *)
(* times : int list -> int *)
let times lst = 
    (* 目的 : lst 中の整数を掛け合わせる *)
    (* 0 を見つけたら例外 Zero を起こす *)
    let rec hojo lst = match lst with
        [] -> 1
        | first :: rest ->  if first = 0 then raise Zero
                            else first * hojo rest
    in try
        hojo lst
        with Zero -> 0

(* テスト *)
let test1 = times [] = 1
let test2 = times [1] = 1
let test3 = times [0] = 0
let test4 = times [1; 2; 3; 4; 5] = 120
let test5 = times [1; 2; 0; 3] = 0