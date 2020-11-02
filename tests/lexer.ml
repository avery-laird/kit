let () =
  let file = open_in "/home/avery/Projects/kit-ocaml-compiler/tests/fib.kit" in
  let lexbuf = Lexer.from_channel file in
  while true do
    match Lexer.get_tok lexbuf with
    | Tokens.EOF (_) -> exit 0
    | tok -> print_endline (Tokens.string_of_token tok)
  done
