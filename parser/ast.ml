type loc = Lexing.position

(* somewhat shadow OCaml's pattern type:
 * https://ocaml.org/releases/4.10/htmlman/compilerlibref/Parsetree.html#TYPEpattern
 *
 * type pattern_desc =
 *  | Ppat_any
 *  | Ppat_var of string Asttypes.loc
 *  | Ppat_alias of pattern * string Asttypes.loc
 *  | Ppat_constant of constant
 *  | Ppat_interval of constant * constant
 *  | Ppat_tuple of pattern list
 *  | Ppat_construct of Longident.t Asttypes.loc * pattern option
 *  | Ppat_variant of Asttypes.label * pattern option
 *  | Ppat_record of (Longident.t Asttypes.loc * pattern) list * Asttypes.closed_flag
 *  | Ppat_array of pattern list
 *  | Ppat_or of pattern * pattern
 *  | Ppat_constraint of pattern * core_type
 *  | Ppat_type of Longident.t Asttypes.loc
 *  | Ppat_lazy of pattern
 *  | Ppat_unpack of string option Asttypes.loc
 *  | Ppat_exception of pattern
 *  | Ppat_extension of extension
 *  | Ppat_open of Longident.t Asttypes.loc * pattern
 *  *)

type constant
  = Integer of loc * int

type pattern
  = Pat_constant of constant

type kitexpr
  = Function of loc * string * pattern * kitexpr list
  | EInt of constant
