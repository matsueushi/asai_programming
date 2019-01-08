(* 目的 : リスト lst の中から条件 p を満たす要素のみを取り出す *)
(* filter : ('a -> bool) -> 'a list -> 'a list *)
let rec filter p lst = match lst with
    [] -> []
    | first :: rest -> if p first then first :: filter p rest
                       else filter p rest

(* Section 14.1 version *)

(* 目的 : 整数 n が 3 で割ると 1 余るかを調べる *)
(* is_mod3_1 : int -> bool *)
(* let is_mod3_1 n = n mod 3 = 1 *)

(* 目的 : リスト lst から 3 で割ると 1　余る要素のみを取り出す *)
(* filter_mod3_1 : int list -> int list *)
(* let filter_mod3_1 lst = filter is_mod3_1 lst *)


(* 目的 : 整数 n が正かどうかを調べる *)
(* is_positive : int -> bool *)
(* let is_positive n = n > 0 *)

(* 目的 : 受け取ったリスト lst から正の要素のみを取り出す *)
(* filter_positive : int list -> int list *)
(* let filter_positive lst = filter is_positive lst *)


(* Ex 14.5 version *)

(* 目的 : リスト lst から 3 で割ると 1　余る要素のみを取り出す *)
(* filter_mod3_1 : int list -> int list *)
(* let filter_mod3_1 lst =  *)
    (* 目的 : 整数 n が 3 で割ると 1 余るかを調べる *)
    (* is_mod3_1 : int -> bool *)
    (* let is_mod3_1 n = n mod 3 = 1 in filter is_mod3_1 lst *)


(* 目的 : 受け取ったリスト lst から正の要素のみを取り出す *)
(* filter_positive : int list -> int list *)
(* let filter_positive lst =  *)
    (* 目的 : 整数 n が正かどうかを調べる *)
    (* is_positive : int -> bool *)
    (* let is_positive n = n > 0 in filter is_positive lst *)


(* Ex 14.10 version *)

(* 目的 : リスト lst から 3 で割ると 1　余る要素のみを取り出す *)
(* filter_mod3_1 : int list -> int list *)
let filter_mod3_1 lst = filter (fun n -> n mod 3 = 1) lst


(* 目的 : 受け取ったリスト lst から正の要素のみを取り出す *)
(* filter_positive : int list -> int list *)
let filter_positive lst = filter (fun n -> n > 0) lst

(* テスト *)
let filter_mod3_1_test = filter_mod3_1 [1; 2; 3; 4] = [1; 4]

let filter_positive_test = filter_positive [-2; -1; 0; 1; 3] = [1; 3]