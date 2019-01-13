#use "year_t.ml"

(* 12 星座を示す型 *)
type seiza_t = Ohitsujiza   (* ♈️ *)
             | Oushiza      (* ♉️ *)
             | Futagoza     (* ♊️ *)       
             | Kaniza       (* ♋️ *)
             | Shishiza     (* ♌️ *)
             | Otomeza      (* ♍️ *)
             | Tenbinza     (* ♎️ *)
             | Sasoriza     (* ♏️ *)
             | Iteza        (* ♐️ *)
             | Yagiza       (* ♑️ *)
             | Mizugameza   (* ♒️ *)
             | Uoza         (* ♓️ *)


(* 目的 : year_t 型の値を受け取ってきたら、seiza_t の星座を返す *)
(* seiza : year_t -> seiza_t *)
let seiza date = match date with
    January (n) -> if n <= 19 then Yagiza else Mizugameza
    | February (n) -> if n <= 18 then Mizugameza else Uoza
    | March (n) -> if n <= 20 then Uoza else Ohitsujiza
    | April (n) -> if n <= 19 then Ohitsujiza else Oushiza
    | May (n) -> if n <= 20 then Oushiza else Futagoza
    | June (n) -> if n <= 21 then Futagoza else Kaniza 
    | July (n) -> if n <= 22 then Kaniza else Shishiza
    | August (n) -> if n <= 22 then Shishiza else Otomeza
    | September (n) -> if n <= 22 then Otomeza else Tenbinza
    | October (n) -> if n <= 23 then Tenbinza else Sasoriza
    | November (n) -> if n <= 22 then Sasoriza else Iteza
    | December (n) -> if n <= 22 then Iteza else Yagiza


(* テスト *)
let test1 = seiza (January (1)) = Yagiza
let test2 = seiza (June (21)) = Futagoza
let test3 = seiza (October (22)) = Tenbinza 