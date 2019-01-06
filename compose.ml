(* 目的 : 関数を2つ受け取り、2つの関数を合成した関数を返す *)
(* compose : ('a -> 'b) -> ('c -> 'a) -> 'c -> 'b *)
let compose g f =
    let h x = g (f x) in h

let times2 x = x * 2
let add3 x = x + 3

(* テスト *)
let test1 = (compose times2 add3) 4 = 14 
