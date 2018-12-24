(* 目的 : x 座標 と y 座標のの組みで表された平面座標 point を受け取ったら、 *)
(*       x 軸に関して対象な点の座標を返す                               *)
(* taisho_x : float * float -> float * float *)
let taisho_x point = match pointwith
    (x, y) -> (-.x, y)

(* テスト *)
let test1 = taisho_x (0.0, 0.0) = (0.0, 0.0)
let test2 = taisho_x (1.0, -3.4) = (-1.0, -3.4)
let test3 = taisho_x (-0.1, 2.4) = (0.1, 2.4)