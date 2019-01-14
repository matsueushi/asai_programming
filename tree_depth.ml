#use "tree_t.ml"

(* 目的 : tree_t 型の木を受けとったら、木の深さを返す *)
(* tree_depth : tree_t -> int *)
let rec tree_depth tree = match tree with
    Empty -> 0
    | Leaf (n) -> 1
    | Node (t1, n, t2) -> 1 + max (tree_depth t1) (tree_depth t2) 

(* テスト *)
let test1 = tree_depth tree1 = 0
let test2 = tree_depth tree2 = 1
let test3 = tree_depth tree3 = 2 
let test4 = tree_depth tree4 = 3