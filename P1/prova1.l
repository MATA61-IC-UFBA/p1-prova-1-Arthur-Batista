%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "prova1.tab.h"
%}

%%

"//".*            { }
[ \t]+            { }

\n                return '\n';

"print"           return PRINT;
"concat"          return CONCAT;
"length"          return LENGTH;

"+"               return PLUS;
"-"               return MINUS;
"*"               return TIMES;
"/"               return DIV;
"="               return ASSIGN;

"("               return LPAREN;
")"               return RPAREN;
","               return COMMA;

\"[^\"]*\"        {
                    yylval.str = strdup(yytext);
                    return STRING;
                 }

[0-9]+            {
                    yylval.num = atoi(yytext);
                    return NUM;
                 }

[a-zA-Z][a-zA-Z0-9]* {
                    yylval.str = strdup(yytext);
                    return ID;
                 }

.                 return ERROR;

%%

int yywrap() {
    return 1;
}
