{
open Tokens
exception Eof
}


rule main = parse
       [' ' '\009' '\012']+
        { main lexbuf } (* skip whitespace *)
     | ['\n' ]
        { Lexing.new_line lexbuf; NEWLINE (info lexbuf) }
     | ['A'-'Z' 'a'-'z' '_']
       ['A'-'Z' 'a'-'z' '_' '0'-'9' '\'']*
        { IDENT (info lexbuf, Lexing.lexeme lexbuf) }
     | ['0'-'9']+
       { INT (info lexbuf, int_of_string (Lexing.lexeme lexbuf)) }
     | '+'
       { PLUS (info lexbuf) }
     | '-'
       { MINUS (info lexbuf) }
     | '='
       { EQUAL (info lexbuf) }
     | eof
       { EOF (info lexbuf) }
     | _ { ILLEGAL (info lexbuf, Lexing.lexeme lexbuf) }
