(* 本に関する情報を格納する型 *)
type book_t = {
    title : string;     (* タイトル *)
    author : string;    (* 著者名 *)
    publisher : string; (* 出版社 *)
    price : float;      (* 値段 *)
    isbn : string;      (* ISBN *)
}

let book1 book_t = {
    title = "Abstract logo";
    author = "Leterme Dowling";
    publisher = "Counter-Print";
    price = 7.5;
    isbn = "978-0-9935812-0-5";
}

let book2 book_t = {
    title = "The Art of Readable Code";
    author = "Dustin Boswell and Trevor Foucher";
    publisher = "O'Reilly";
    price = 34.99;
    isbn = "978-0-596-80229-5";
}

let book3 book_t = {
    title = "R.Cruml's Dream Diary";
    author = "Robert Crumb";
    publisher = "Elara Press";
    price = 25.0;
    isbn = "978-194288433-0";
}