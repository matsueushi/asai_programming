(* 目的 : 2次方程式 ax^2 + bx + c = 0 の係数 a, b, c (いずれも実数とする) *)
(*       を与えられたら、判別式を返す                                    *)
(* hanbetsusiki : float -> float -> float -> float *)
let hanbetsushiki a b c = b ** 2.0 -. 4.0 *. a *. c 

(* テスト *)
let hanbetsushiki_test1 = hanbetsushiki   1.0  0.0   1.0  =  -4.0
let hanbetsushiki_test2 = hanbetsushiki   3.0  5.0   2.0  =   1.0
let hanbetsusihki_test3 = hanbetsushiki (-1.0) 2.0 (-1.0) =   0.0


(* 目的 : 2次方程式 ax^2 + bx + c = 0 の係数　a, b, c (いずれも実数とする) *)
(*       を与えられたら、解の個数を返す                                   *)
(* kai_no_kosuu : float -> float -> float -> int *)
let kai_no_kosuu a b c = 
    if hanbetsushiki a b c < 0.0 then 0
                                 else if hanbetsushiki a b c = 0.0 then 1
                                                                   else 2


(* テスト *)
let kai_no_kosuu_test1 = kai_no_kosuu   1.0   0.0   1.0   = 0
let kai_no_kosuu_test2 = kai_no_kosuu   3.0   5.0   2.0   = 2
let kai_no_kosuu_test3 = kai_no_kosuu (-1.0)  2.0 (-1.0)  = 1 