#use "rb_tree_t.ml"

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


(* テスト *)
let rb_tree_answer = 
    Node (
        Node (
            Node (Empty, "A", 1, Black, Empty), 
            "X", 2, Black,
            Node (Empty, "B", 3, Black, Empty)),
        "Y", 4, Red,
        Node (
            Node (Empty, "C", 5, Black, Empty), 
            "Z", 6, Black,
            Node (Empty, "D", 7, Black, Empty))
    )
let test1 = balance rb_tree1 = rb_tree_answer 
let test2 = balance rb_tree2 = rb_tree_answer 
let test3 = balance rb_tree3 = rb_tree_answer 
let test4 = balance rb_tree4 = rb_tree_answer 
let test5_tree = Node (Empty, "X", 1, Black, Empty)
let test5 = balance test5_tree = test5_tree