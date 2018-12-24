(* 目的 : 国語 kokugo, 数学 suugaku, 英語 eigo, 理科 rika, 社会 shakai *)
(*       の5教科の点数を与えられたら、その合計点を返す                    *)
(* goukei_to_heikin : int -> int -> int -> int -> int -> int *)
let goukei kokugo suugaku eigo rika shakai = 
    kokugo + suugaku + eigo + rika + shakai

(* テスト *)
let goukei_test1 = goukei   0   0   0   0   0 =   0
let goukei_test2 = goukei 100 100 100 100 100 = 500
let goukei_test3 = goukei  80  85  90  95  91 = 441


(* goukei_to_heikin : int -> int -> int -> int -> int -> int * float *)
(*       の5教科の点数を与えられたら、その合計点と平均点を組みにして返す     *)
(* goukei_to_heikin : int -> int -> int -> int -> int -> int * int *)
let goukei_to_heikin kokugo suugaku eigo rika shakai =
   (goukei kokugo suugaku eigo rika shakai,
    goukei kokugo suugaku eigo rika shakai / 5) 

(* テスト *)
let goukei_to_heikin_test1 = goukei_to_heikin   0   0   0   0   0 = (  0,   0)
let goukei_to_heikin_test2 = goukei_to_heikin 100 100 100 100 100 = (500, 100)
let goukei_to_heikin_test3 = goukei_to_heikin  80  85  90  95  91 = (441,  88)