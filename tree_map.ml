#use "tree_t.ml"

(* 目的 : int -> int 型の関数 f と tree_t の型の木を受けとったら、 *)
(*       節や葉に入っているにを全て f を適用した木を返す            *)
(* tree_map : (int -> int) -> tree_t -> tree_t *)
let rec tree_map f tree = match tree with
    Empty -> Empty
    | Leaf (n) -> Leaf (f n)
    | Node (t1, n, t2) ->  Node (tree_map f t1, f n, tree_map f t2)


(* テスト *)
let test1 = tree_map (fun x -> x * 2) tree1 = Empty
let test2 = tree_map (fun x -> x - 3) tree2 = Leaf (0) 
let test3 = tree_map (fun x -> x mod 2) tree3 = Node (Empty, 0, Leaf (1))
let test4 = tree_map (fun x -> x + 1) tree4 = 
                Node (Leaf (4), 6, Node (Empty, 5, Leaf (4)))