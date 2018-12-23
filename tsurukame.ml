(* 目的 : 鶴の数 x に応じた足の数を計算する *)
(* tsuru_no_ashi : int -> int *)
let tsuru_no_ashi x = 2 * x

(* テスト *)
let tsuru_no_ashi_test1 = tsuru_no_ashi  0 = 0
let tsuru_no_ashi_test2 = tsuru_no_ashi  5 = 10
let tsuru_no_ashi_test3 = tsuru_no_ashi 13 = 26


(* 目的 : 亀の数 x に応じた足の数を計算する *)
(* kame_no_ashi : int -> int *)
let kame_no_ashi x = 4 * x

(* テスト *)
let kame_no_ashi_test1 = kame_no_ashi  0 = 0
let kame_no_ashi_test2 = kame_no_ashi  4 = 16
let kame_no_ashi_test3 = kame_no_ashi 10 = 40


(* 目的 : 鶴の数 x と　亀の数 y に応じた足の数を計算する *)
(* tsururukame_no_ashi : int -> int -> int *)
let tsurukame_no_ashi x y = tsuru_no_ashi x + kame_no_ashi y

(* テスト *)
let tsurukame_no_ashi_test1 = tsurukame_no_ashi 3 4 = 22 
let tsurukame_no_ashi_test2 = tsurukame_no_ashi 5 2 = 18
let tsurukame_no_ashi_test3 = tsurukame_no_ashi 8 1 = 20 


(* 目的 : 鶴と亀の数の合計 x と 足の数の合計 y を与えられたときに、*)
(*       鶴の数を返す                                       *)
(* tsurukame : int -> int -> int *)
let tsurukame x y = (4 * x - y) / 2

(* テスト *)
let tsurukame_test1 = tsurukame 7 22 = 3
let tsurukame_test2 = tsurukame 7 18 = 5
let tsurukame_test3 = tsurukame 9 20 = 8
