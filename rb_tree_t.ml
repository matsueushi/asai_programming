(* 赤か黒かを示す型 *)
type color_t = Red | Black

(* 各節に 'a 型のキーと 'b 型の値、そして色を示す color_t　型の値を持つ木の型 *)
type ('a, 'b) rb_tree_t =
    Empty
    | Node of ('a, 'b) rb_tree_t * 'a * 'b * color_t * ('a, 'b) rb_tree_t

