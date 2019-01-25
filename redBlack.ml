(* 赤黒木を示すモジュール *)

(* 赤か黒かを示す型 *)
type color_t = Red | Black

(* 各節に 'a 型のキーと 'b 型の値、そして色を示す color_t　型の値を持つ木の型 *)
type ('a, 'b) t = Empty
                | Node of ('a, 'b) t * 'a * 'b * color_t * ('a, 'b) t

(* 空の木 *)
let empty = Empty

(* 目的　: tree にキーが k で値が v を挿入した木を返す *)
(* insert : ('a, 'b) t -> 'a -> 'b -> ('a, 'b) t *)
let insert tree k v =
    (* 目的 : rb_tree_t 型の木を受け取り、図の木が本文図20.2の左側のようになっているか調べ、 *)
    (*        なっていたら右側の木を返す。なっていなかったらそのまま返す。                  *)
    (* balance : ('a, 'b) rb_tree_t -> ('a, 'b) rb_tree_t *)
    let balance rb_tree = match rb_tree with
        Node (
            Node (
                Node (a, xa, xb, Red, b),
                ya, yb, Red,
                c 
            ),
            za, zb, Black,
            d
        )
        | Node (
            Node (
                a,
                xa, xb, Red,
                Node (b, ya, yb, Red, c)
            ),
            za, zb, Black,
            d
        )
        | Node (
            a,
            xa, xb, Black,
            Node (
                Node (b, ya, yb, Red, c),
                za, zb, Red,
                d
            )
        )
        | Node (
            a,
            xa, xb, Black,
            Node (
                b,
                ya, yb, Red,
                Node (c, za, zb, Red, d)
            )
        ) -> Node (
                Node (a, xa, xb, Black, b),
                ya, yb, Red,
                Node (c, za, zb, Black, d)
            )
        | _ -> rb_tree
    (* 目的　: tree にキーが k で値が v を挿入した木を返す補助関数 *)
    (* insert1 : ('a, 'b) t -> 'a -> 'b -> ('a, 'b) t *)
    in let rec insert1 tree k v = match tree with
        Empty -> Node (Empty, k, v, Red, Empty)
        | Node (left, key, value, color, right) ->
            if k = key then Node (left, key, v, color, right)
            else let tree0 = 
                if k < key then Node (insert1 left k v, key, value, color, right)
                else Node (left, key, value, color, insert1 right k v)
                in if color = Black then balance tree0
                else tree0
    in match insert1 tree k v with
    Empty -> Empty (* 起こらない *)
    | Node (left, key, value, color, right)
        -> Node (left, key, value, Black, right)

(* 目的 : tree の中のキー k に対応する値を探して返す *)
(* 見つからなければ例外 Not_found を起こす *)
(* search : ('a, 'b) t -> 'a -> 'b *)
let search tree k = match tree with
    Empty -> raise Not_found
    | Node (left, key, value, color, right) ->
        if k = key then value
        else if k < key then search left k
        else search right k


let test1 = insert Empty 3 3
let test2 = insert test1 4 4