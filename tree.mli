(* 2 分探索木を表すモジュールのシグネチャ *)
type ('a, 'b) t
    (* キーが 'a 型, 値が 'b 型の木の型。型の中身は非公開 *)

(* 空の木 *)
val empty : ('a, 'b) t
    (* 使い方 : empty *)
    (* 空の木 *)

val insert : ('a, 'b) t -> 'a -> 'b -> ('a, 'b) t
    (* 使い方 : insert tree key value  *)
    (* 木 tree にキー key と値 value を挿入した木を返す *)
    (* キーがすでに存在してたら新しい値に置き換える *)

val search : ('a, 'b) t -> 'a -> 'b
    (* 使い方 : search tree key *)
    (* tree の中のキー k に対応する値を探して返す *)
    (* 見つからなければ例外 Not_found を起こす *)