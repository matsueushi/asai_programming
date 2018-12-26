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

let person3 = {
    name = "Kojima";
    height = 1.7;
    weight = 50.0;
    month = 9;
    day = 21;
    blood = "B";
}

let person4 = {
    name = "Ogawa";
    height = 1.9;
    weight = 75.3;
    month = 8;
    day = 23;
    blood = "A";
}

let person5 = {
    name = "Ishikawa";
    height = 1.55;
    weight = 43.9;
    month = 6;
    day = 18;
    blood = "A"
}


let lst1 = []
let lst2 = [person1]
let lst3 = [person4]
let lst4 = [person1; person2; person3]
let lst5 = [person3; person5]
let lst6 = [person1; person2; person4; person5]
let lst7 = [person1; person2; person3; person4; person5]