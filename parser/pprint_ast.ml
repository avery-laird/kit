open Ast
open Core

let indent_space = "    "


let rec pprint_expr ppf ~indent expr =
  let print_expr = Fmt.pf ppf "%sExpr: %s@." indent in
  let new_indent = indent_space ^ indent in
  match expr with
  | Function (_, name, _, _) ->
    print_expr (Fmt.str "%s Function: %s@." indent (name))
  | EInt (_) -> print_expr (Fmt.str "Integer")
