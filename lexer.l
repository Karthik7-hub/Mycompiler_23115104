%{
#include <cstring>
#include "parser.tab.h"
%}
%%
[ \t\r\n]+            ;
"="                   { return ASSIGN; }
"+"                   { return PLUS; }
"-"                   { return MINUS; }
"*"                   { return STAR; }
"/"                   { return SLASH; }
"("                   { return LPAREN; }
")"                   { return RPAREN; }
";"                   { return SEMICOLON; }
[0-9]+                { yylval.num = atoi(yytext); return NUMBER; }
[a-zA-Z_][a-zA-Z0-9_]* {
                        yylval.str = strdup(yytext);
                        return IDENTIFIER;
                      }
.                     { return UNKNOWN; }
%%

int yywrap() { return 1; }


