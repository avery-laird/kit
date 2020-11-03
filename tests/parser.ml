(* let std = Parser.parse_test stdin *)

let () =
  let expr = Parser.expression Lexer.get_tok (Lexer.from_channel stdin) in
  Pprint_ast.pprint_expr Fmt.stdout ~indent:"" expr
