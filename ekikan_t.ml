(* 駅と駅の接続情報を格納するレコード *)
type ekikan_t = {
    kiten : string;     (* 起点の駅名 *)
    shuten : string;    (* 終点の駅名 *)
    keiyu : string;     (* 経由する路線名 *)
    kyori : float;      (* 2駅間の距離 *)
    jikan : int;        (* 所有時間 *)
}