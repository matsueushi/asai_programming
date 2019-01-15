#use "ekikan_tree_t.ml"
#use "ekikan_t.ml"

(* 目的 : eki1 が ekikan_tree_t 型の木 tree にあるか調べ、なければ追加する。 *)
(*       その上で、(eki2, x) という組を eki1 の節のリストに加える           *)
(* insert1 : ekikan_tree_t -> string -> string * float -> ekikan_tree_t *)
let rec insert1 tree eki1 (eki2, x) = match tree with
    Empty -> Node (Empty, eki1, [(eki2, x)], Empty)
    | Node (t1, eki, lst, t2) -> 
        if eki1 = eki then Node (t1, eki, (eki2, x)::lst, t2)
        else if eki1 < eki then Node (insert1 t1 eki1 (eki2, x), eki, lst, t2)
        else Node (t1, eki, lst, insert1 t2 eki1 (eki2, x))


(* 目的 : ekikan_tree_t 型の木と ekikan_t 型の駅間を受けとったら、その情報を挿入した木を返す *)
(* insert_ekikan : ekikan_tree_t -> ekikan_t -> ekikan_tree_t *)
let insert_ekikan tree ekikan = match ekikan with
    {kiten = kiten; shuten = shuten; keiyu = keiyu; kyori = kyori; jikan = jikan} -> 
    let tree1 = insert1 tree kiten (shuten, kyori) in
    insert1 tree1 shuten (kiten, kyori)


(* テスト *)
let ekikan1 = 
    {kiten="代々木上原"; shuten="代々木公園"; keiyu="千代田線"; kyori=1.0; jikan=2}
let ekikan2 =
    {kiten="代々木公園"; shuten="明治神宮前"; keiyu="千代田線"; kyori=1.2; jikan=2}
let ekikan3 = 
    {kiten="湯島"; shuten="根津"; keiyu="千代田線"; kyori=1.2; jikan=2}
let tree1 = insert_ekikan Empty ekikan1
let test1 = tree1 = Node (Empty, "代々木上原", [("代々木公園", 1.0)],
    Node (Empty, "代々木公園", [("代々木上原", 1.0)], Empty))
let tree2 = insert_ekikan tree1 ekikan2
let test2 = tree2 = Node (Empty, "代々木上原", [("代々木公園", 1.0)],
    Node (Empty, "代々木公園", [("明治神宮前", 1.2); ("代々木上原", 1.0)], 
        Node (Empty, "明治神宮前", [("代々木公園", 1.2)], Empty)))
let tree3 = insert_ekikan tree2 ekikan3
let test3 = tree3 = 
  Node (Empty, "代々木上原", [("代々木公園", 1.)],
   Node (Empty, "代々木公園",
    [("明治神宮前", 1.2); ("代々木上原", 1.)],
    Node (Empty, "明治神宮前", [("代々木公園", 1.2)],
     Node (Node (Empty, "根津", [("湯島", 1.2)], Empty), "湯島",
      [("根津", 1.2)], Empty))))