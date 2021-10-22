%{
	#include <ctype.h>
	#include <stdio.h>
	
	extern int yylex();
	void yyerror(char *msg);	
%}
%token Or And Not Boolean

%%

lines	:	lines bexpr '\n'	{ if ($2 != 0) { printf("true (1)\n"); } else { printf("false (0)\n" ); } };
		|	lines '\n'
		|	/* empty */;

bexpr	:	bexpr Or bterm		{ $$ = $1 || $3 }
		|	bterm;
		
bterm	:	bterm And bfactor	{ $$ = $1 && $3 }
		|	bfactor;
		
bfactor	:	Not bfactor			{ $$ = !$2 }
		|	'(' bexpr ')'		{ $$ = $2 }
		|	Boolean;			
%%

#include "lex.yy.c"

void yyerror(char *msg)
{
	printf("Error de Sintaxis");
	exit(0);
}

main()
{
	yyparse();
	return 0;
}