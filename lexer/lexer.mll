{
open Parser
}


rule main = parse
       [' ' '\009' '\012']+
        { main lexbuf } (* skip whitespace *)
     | ['\n' ]+
        { Lexing.new_line lexbuf; NEWLINE }
     | ['A'-'Z' 'a'-'z' '_']
       ['A'-'Z' 'a'-'z' '_' '0'-'9' '\'']*
        { IDENT (Lexing.lexeme lexbuf) }
     | ['0'-'9']+
       { INT (int_of_string (Lexing.lexeme lexbuf)) }
     | '+'
       { PLUS }
     | '-'
       { MINUS }
     | '='
       { EQUAL }
     | eof
       { EOF }
     | _ { ILLEGAL (Lexing.lexeme lexbuf) }


{
let from_channel channel =
    Lexing.from_channel ~with_positions:(true) channel

let get_tok lb = main lb
}
