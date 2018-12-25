(* お小遣い帳のレコード *)
type okozukai_t = {
    name : string;  (* 名前 *)
    price : float;  (* 値段 *)
    place : string; (* 買った場所 *)
    date : string;  (* 日付 *)
}

let book = {
    name = "book";
    price = 30.0;
    place = "bookstore";
    date = "2018-12-24";
}

let vinyl = {
    name = "vinyl";
    price = 22.98;
    place = "record store";
    date = "2018-12-1";
}

let water = {
    name = "water";
    price = 2.2;
    place = "cvs";
    date = "2018-11-15";
}