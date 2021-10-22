/*%{
	#define True	251
	#define False	252
	#define Or		253
	#define And		254
	#define Not		255
%}*/

true 	[Tt][Rr][Uu][Ee]
false 	[Ff][Aa][Ll][Ss][Ee]
or		[Oo][Rr]
and		[Aa][Nn][Dd]
not		[Nn][Oo][Tt]
%%

[ \t]		; {/* Espacios en blanco */}
[()\n]		return yytext[0];
{true}		{
	yylval = 1;
	return Boolean;
};
{false}		{
	yylval = 0;
	return Boolean;
};
{or}		return Or;
{and}		return And;
{not}		return Not;
.			printf("Error\n");

%%

int yywrap(void)
{
	return 0;
}

/*main(){
	int token;
	token = yylex();
	while (token)
	{
		printf("%d\n", token);
		token = yylex();
	}
}
*/