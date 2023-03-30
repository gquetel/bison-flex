%{
	#include <stdio.h>
	#include <stdlib.h>

	extern int yylex();
	extern int yyparse();
	extern FILE* yyin;
    extern int yylineno;
	void yyerror(const char* s);
%}

%union {
	int ival;
}

%token COMMENT "#"
%token PLUS MINUS
%token NEWLINE 
%token <ival> INT
%type  <ival> expr

%left PLUS MINUS

%%

input: %empty
    | input line
;

line: NEWLINE
    | expr NEWLINE { printf("ival: %i\n", $1); }
    | COMMENT { printf("All following inputs will be ignored.\n");}
;

expr: INT				            { $$ = $1; }
	  | expr PLUS expr	            { $$ = $1 + $3; }
	  | expr MINUS expr 	        { $$ = $1 - $3; }
;

%%

int main() {
    yylineno = 1;
	return yyparse();
}

void yyerror(const char* s) {
	fprintf(stderr, "Parse error: %s line: %d \n", s, yylineno);
	exit(1);
}