(* 目的 : x 座標と y 座標の組みで表された平面座標を二つ受け取り、 *)
(*       中点の座標を返す                                   *)
(* chuten : float * float -> float * float -> float * float *)
let chuten point1 point2 = match point1 with
    (x1, y1) -> match point2 with 
        (x2, y2) -> ((x1 +. x2) /. 2.0, (y1 +. y2) /. 2.0)

(* テスト *)
let test1 = chuten (1.0, 2.0) (3.0, -4.0) = (2.0, -1.0)
let test2 = chuten (0.0, 0.0) (4.0, -2.0) = (2.0, -1.0)
let test3 = chuten (3.5, -1.0) (-0.5, 5.0) = (1.5, 2.0)