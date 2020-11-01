type tpos = {
  fname: string;
  line: int;
  col: int
}

type tokens
  = EOF of tpos
  | ILLEGAL of tpos * string
  | IDENT of tpos * string
  | INT of tpos * int
  | SEMICOLON of tpos
  | PLUS of tpos
  | MINUS of tpos
  | STAR of tpos
  | FORWARD_SLASH of tpos
  | EQUAL of tpos
  | NEWLINE of tpos

let string_of_tpos tpos = (string_of_int tpos.line) ^ ":" ^ (string_of_int tpos.col)

let string_of_token t =
  match t with
  | EOF (pos) -> string_of_tpos pos ^ "\t" ^ "eof"
  | ILLEGAL (pos, string) -> string_of_tpos pos ^ "\t" ^ "illegal token: " ^ string
  | IDENT (pos, name) -> string_of_tpos pos ^ "\t" ^ "ident { " ^ name ^ " }"
  | INT (pos, value) -> string_of_tpos pos ^ "\t" ^ "int { " ^ string_of_int value ^ " }"
  | SEMICOLON (pos) -> string_of_tpos pos ^ "\t" ^ "semicolon"
  | PLUS (pos) -> string_of_tpos pos ^ "\t" ^ "plus"
  | MINUS (pos) -> string_of_tpos pos ^ "\t" ^ "minus"
  | STAR (pos) -> string_of_tpos pos ^ "\t" ^ "star"
  | FORWARD_SLASH (pos) -> string_of_tpos pos ^ "\t" ^ "FORWARD_SLASH"
  | EQUAL (pos) -> string_of_tpos pos ^ "\t" ^ "equal"
  | NEWLINE (pos) -> string_of_tpos pos ^ "\t" ^ "newline"


let info (lb : Lexing.lexbuf) : tpos =
  let pos = lb.lex_start_p in
  {
    fname=pos.pos_fname;
    line=pos.pos_lnum;
    col=pos.pos_cnum-pos.pos_bol
  }
