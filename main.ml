let () =
  try
    let lexbuf = Lexing.from_channel ~with_positions:(true) stdin in
    while true do
      let result = Lexer.main lexbuf in
      let token_string = Tokens.string_of_token result in
      print_endline token_string
    done
  with Lexer.Eof ->
    exit 0
