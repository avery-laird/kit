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

%start pattern

%type <Ast.pattern> pattern

%%

pattern:
| i=INT {Int i}
