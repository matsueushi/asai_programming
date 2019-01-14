#use "tree_t.ml"

(* 目的 : tree_t の型の木を受けとったら、節や葉に入っている値を全て 2 倍にした木を返す *)
(* tree_double : tree_t -> tree_t *)
let rec tree_double tree = match tree with
    Empty -> Empty
    | Leaf (n) -> Leaf (2 * n)
    | Node (t1, n, t2) ->  Node (tree_double t1, 2 * n, tree_double t2)


(* テスト *)
let test1 = tree_double tree1 = Empty
let test2 = tree_double tree2 = Leaf (6) 
let test3 = tree_double tree3 = Node (Empty, 8, Leaf (6))
let test4 = tree_double tree4 = Node (Leaf (6), 10, Node (Empty, 8, Leaf (6)))