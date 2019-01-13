(* 年号を表す型 *)
type nengou_t = Meiji of int  (* 明治 *)
              | Taisho of int (* 大正 *)
              | Showa of int  (* 昭和 *)
              | Heisei of int (* 昭和 *)


(* 目的 : 年号を受け取ったら対応する西暦年を返す *)
(* to_seireki_ : nengou_t -> int *)
let to_seireki nengou = match nengou with
    Meiji (n) -> n + 1867
    | Taisho (n) -> n + 1911
    | Showa (n) -> n + 1925
    | Heisei (n) -> n + 1988
            

(* 誕生年と現在の年をnengou_t の型として受け取ったら、年齢を返す *)
(* nenewi -> nengou_t -> nengou_t -> int *)
let nenrei tanjounen genzainen =
    to_seireki genzainen - to_seireki tanjounen

(* テスト *)
let test1 = nenrei (Heisei (1)) (Heisei (30)) = 29
let test2 = nenrei (Showa (23)) (Heisei (31)) = 71

