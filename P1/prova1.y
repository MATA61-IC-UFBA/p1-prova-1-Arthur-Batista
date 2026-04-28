%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
extern int yylex();
void yyerror(const char *msg);
%}

%token NUM STRING ID
%token PRINT LENGTH CONCAT
%token PLUS MINUS TIMES DIV
%token LPAR RPAR ASSIGN COMMA
%token ERROR

%left PLUS MINUS
%left TIMES DIV

%start program

%%

program
    : stmt_list
    ;

stmt_list
    : 
    | stmt_list stmt
    ;

stmt
    : expr
    | ID ASSIGN expr
    | PRINT LPAR args RPAR
    ;

expr
    : expr PLUS  expr
    | expr MINUS expr
    | expr TIMES expr
    | expr DIV   expr
    | LPAR expr RPAR
    | LENGTH LPAR expr RPAR
    | CONCAT LPAR args RPAR
    | atom
    ;

args
    : expr
    | args COMMA expr
    ;

atom
    : NUM
    | STRING
    | ID
    ;

%%

