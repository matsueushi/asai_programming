#use "insert_ekikan.ml"

(* 目的 : ekikan_tree_t 型の木と ekikan_t list 型の駅間のリストを受けとったら、 *)
(*       リストの中に含まれる駅間を全て挿入した木を返す                         *)
(* inserts_ekikan : ekikan_tree_t -> ekikan_t list -> ekikan_tree_t *)
let inserts_ekikan tree lst = List.fold_left insert_ekikan tree lst

(* テスト *)
let test1 = inserts_ekikan Empty [ekikan1] = tree1
let test2 = inserts_ekikan tree1 [ekikan2; ekikan3] = tree3
let test3 = inserts_ekikan Empty [ekikan1; ekikan2; ekikan3] = tree3