(* 人の情報(名前, 身長(m), 体重(kg), 誕生日(月と日), 血液型の情報)を表すレコード *)
type person_t = {
    name : string;  (* 名前 *)
    height : float; (* 身長 *)
    weight : float; (* 体重 *)
    month : int;    (* 誕生月 *)
    day : int;      (* 誕生日 *)
    blood : string; (* 血液型 *)
}

let person1 = {
    name = "Tanaka";
    height = 1.8;
    weight = 60.5;
    month = 12;
    day = 1;
    blood = "AB";
}

let person2 = {
    name = "Saito";
    height = 1.6;
    weight = 45.0;
    month = 4;
    day = 7;
    blood = "O";
}

let person2 = {
    name = "Kojima";
    height = 1.7;
    weight = 50.0;
    month = 9;
    day = 30;
    blood = "B";
}