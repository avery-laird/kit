type pattern
  = Int of int

type kitexpr
  = Function of string * pattern * kitexpr list
