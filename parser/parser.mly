%{
open Ast
%}

%token EOF
%token <string> ILLEGAL
%token <string> IDENT
%token <int> INT
%token SEMICOLON
%token PLUS
%token MINUS
%token STAR
%token FORWARD_SLASH
%token EQUAL
%token NEWLINE

%start expression

%type <Ast.constant> constant
%type <Ast.pattern> pattern
%type <Ast.kitexpr> expression

%%

expression:
| i=IDENT; left=pattern; EQUAL; right=constant { Function($startpos, i, left, [EInt(right)])  }

pattern:
| i=constant { Pat_constant(i) }

constant:
| i=INT { Integer($startpos, i) }
