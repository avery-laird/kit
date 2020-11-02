(* let std = Parser.parse_test stdin *)

let () =
  match Parser.pattern Lexer.get_tok (Lexer.from_channel stdin) with
  | Ast.Int (i) -> print_endline ("match int: " ^ (string_of_int i))
