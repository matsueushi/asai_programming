(* 目的 : 身長 m と 体重 kg を与えられたら、BMI指数を返す *)
(* bmi : float -> float -> float *)
let bmi m kg = kg /. (m ** 2.0)

(* テスト *)
let bmi_test1 = bmi 2.0   80.0   = 20.0
let bmi_test2 = bmi 1.5   57.6   = 25.6
let bmi_test3 = bmi 1.75  67.375 = 22.0 
let bmi_test4 = bmi 1.5   33.75  = 15.0
let bmi_test5 = bmi 1.8  113.4   = 35.0


(* 目的 : 身長 m と 体重 kg が与えられたら、BMI指数を計算し、 *)
(*       数値によって体形を返す                           *)
(* taikei : float -> float -> string *)
let taikei m kg = 
    if bmi m kg < 18.5 then "やせ"
                       else if bmi m kg < 25.0 then "標準"
                                               else if bmi m kg < 30.0 then "肥満"
                                                                       else "高度肥満"

(* テスト *)
let taikei_test1 = taikei 2.0   80.0   = "標準"
let taikei_test2 = taikei 1.5   57.6   = "肥満"
let taikei_test3 = taikei 1.75  67.375 = "標準" 
let taikei_test4 = taikei 1.5   33.75  = "やせ" 
let taikei_test5 = taikei 1.8  113.4   = "高度肥満" 