(* 赤か黒かを示す型 *)
type color_t = Red | Black

(* 各節に 'a 型のキーと 'b 型の値、そして色を示す color_t　型の値を持つ木の型 *)
type ('a, 'b) rb_tree_t =
    Empty
    | Node of ('a, 'b) rb_tree_t * 'a * 'b * color_t * ('a, 'b) rb_tree_t

(* サンプル *)
let rb_tree1_left = 
    Node (
        Node (
            Node (
                Empty,
                "A", 1, Black,
                Empty
            ), 
            "X", 2, Red, 
            Node (
                Empty,
                "B", 3, Black,
                Empty
            )
        ),
        "Y", 4, Red,
        Node (
            Empty,
            "C", 5, Black,
            Empty
        )
    )
let rb_tree1_right =
    Node (
        Empty,
        "D", 7, Black,
        Empty
    )
let rb_tree1 = Node (rb_tree1_left, "Z", 6, Black, rb_tree1_right)
let rb_tree2_left =
    Node (
        Node (
            Empty,
            "A", 1, Black,
            Empty
        ),
        "X", 2, Red,
        Node (
            Node (
                Empty,
                "B", 3, Black,
                Empty
            ),
            "Y", 4, Red, 
            Node (
                Empty,
                "C", 5, Black,
                Empty
            ) 
        )
    )
let rb_tree2_right =
    Node (
        Empty,
        "D", 7, Black,
        Empty
    )
let rb_tree2 = Node (rb_tree2_left, "Z", 6, Black, rb_tree2_right)
let rb_tree3_left =
    Node (
        Empty,
        "A", 1, Black,
        Empty
    )
let rb_tree3_right =
    Node (
        Node (
            Node (
                Empty,
                "B", 3, Black,
                Empty
            ),
            "Y", 4, Red,
            Node (
                Empty,
                "C", 5, Black,
                Empty
            )
        ),
        "Z", 6, Red,
        Node (
            Empty,
            "D", 7, Black,
            Empty    
        )
    )
let rb_tree3 = Node (rb_tree3_left, "X", 2, Black, rb_tree3_right)
let rb_tree4_left = 
    Node (
        Empty,
        "A", 1, Black,
        Empty
    )
let rb_tree4_right =
    Node (
        Node (
            Empty,
            "B", 3, Black,
            Empty
        ),
        "Y", 4, Red,
        Node (
            Node (
                Empty,
                "C", 5, Black,
                Empty
            ), 
            "Z", 6, Red,
            Node (
                Empty,
                "D", 7, Black,
                Empty
            )
        )
    )
