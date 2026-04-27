%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex();
void yyerror(const char *s);
%}

%union {
    int num;
    char* str;
}

%token ERROR 
%token <num> NUM
%token <str> ID STRING
%token PRINT CONCAT LENGTH
%token ASSIGN
%token PLUS MINUS TIMES DIV
%token LPAREN RPAREN COMMA

%left PLUS MINUS
%left TIMES DIV

%start program

%%

program:
    stmt_list
;

stmt_list:
      stmt
    | stmt_list stmt
;

stmt:
      ID ASSIGN expr '\n'
    | PRINT expr '\n'
    | PRINT string_expr '\n'
    | expr '\n'
;

expr:
      NUM
    | ID
    | expr PLUS expr
    | expr MINUS expr
    | expr TIMES expr
    | expr DIV expr
    | LPAREN expr RPAREN
    | LENGTH LPAREN string_expr RPAREN
;

string_expr:
      STRING
    | CONCAT LPAREN string_expr COMMA string_expr RPAREN
;

%%
