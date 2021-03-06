(* 木を表す型 *)
(* tree は
    - Empty     空の木
    - Leaf (n)  値が n の葉
    - Node (t1, n, t2) 左の木が t1, 値が n, 右の木が t2 である節 *)
(* Section 17.3 version *)
(* type tree_t = Empty                             (* 空の木 *)
            | Leaf of int                       (* 葉 *)
            | Node of tree_t * int * tree_t     節 *)

(* Section 17.5 version *)
type 'a tree_t = Empty                                (* 空の木 *)
               | Leaf of 'a                           (* 葉 *)
               | Node of 'a tree_t * 'a * 'a tree_t   (* 節 *)


(* 木の例 *)
let tree1 = Empty
let tree2 = Leaf (3)
let tree3 = Node (tree1, 4, tree2)
let tree4 = Node (tree2, 5, tree3)


(* 目的 : tree に含まれる整数を全て加える *)
(* sum_tree : tree_t -> int *)
let rec sum_tree tree = match tree with
    Empty -> 0
    | Leaf (n) -> n 
    | Node (t1, n, t2) -> sum_tree t1 + n + sum_tree t2 

(* テスト *)
let test1 = sum_tree tree1 = 0
let test2 = sum_tree tree2 = 3
let test3 = sum_tree tree3 = 7
let test4 = sum_tree tree4 = 15