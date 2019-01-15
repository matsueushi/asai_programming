(* 木の節に
- 漢字の駅名
- その駅に直接繋がっている駅名 (漢字) と その駅までの距離 の組 のリスト
を持つ型                                                        *)
type ekikan_tree_t = Empty
    | Node of string * (string * float list)