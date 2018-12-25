(* お小遣い帳の情報 *)
type okozukai_t = {
    name : string;  (* 名前 *)
    price : float;  (* 値段 *)
    place : string; (* 買った場所 *)
    date : string;  (* 日付 *)
}

let book okozukai_t = {
    name = "book";
    price = 30.0;
    place = "bookstore";
    date = "2018-12-24";
}

let vinyl okozukai_t = {
    name = "vinyl";
    price = 22.98;
    place = "record store";
    date = "2018-12-1";
}

let water okozukai_t = {
    name = "water";
    price = 2.2;
    place = "cvs";
    date = "2018-11-15";
}