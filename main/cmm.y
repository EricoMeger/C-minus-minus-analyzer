%{
#include <stdio.h>
#include <stdlib.h>

extern int yyparse();
extern FILE* yyin;

int yylex();
void yyerror(const char *s);
    
%}
// Declaração de tokens do flex
%token BREAK CONTINUE ELSE FOR IF RETURN WHILE
%token CHAR INT LONG SHORT VOID
%token PLUS MINUS STAR SLASH MOD OR REFERENCE AND EQUAL NOT_EQUAL LESS LESS_EQUAL GREATER GREATER_EQUAL NOT
%token ASSIGN
%token CHAR_CONSTANT STRING IDENTIFIER
%token LPAREN RPAREN LBRACKET RBRACKET COMMA SEMICOLON
%token NUMERIC_CONSTANT

%%

source:
    | source declaration
    | source statement
    | 
    ;

// Declaração de funções, variáveis, ponteiros
declaration:
    type_specifier IDENTIFIER SEMICOLON
    | type_specifier IDENTIFIER ASSIGN initializer SEMICOLON
    | type_specifier pointer IDENTIFIER ASSIGN initializer SEMICOLON
    | type_specifier pointer IDENTIFIER SEMICOLON
    | type_specifier IDENTIFIER LPAREN RPAREN SEMICOLON
    | type_specifier IDENTIFIER LPAREN parameter_list RPAREN SEMICOLON
    | type_specifier IDENTIFIER LPAREN RPAREN block
    | type_specifier IDENTIFIER LPAREN parameter_list RPAREN block
    ;

initializer:
    NUMERIC_CONSTANT
    | IDENTIFIER
    | STRING
    | CHAR_CONSTANT

//declaracao de parametros da funcao, ela pode receber um ou mais parametros
parameter_list:
    | parameter_list COMMA type_specifier IDENTIFIER
    | type_specifier IDENTIFIER
    | type_specifier pointer IDENTIFIER
    ;

// *, &, *&, **, **&
pointer:
    STAR
    | REFERENCE
    | STAR pointer
    ;

type_specifier:
    CHAR
    | INT 
    | LONG
    | SHORT
    | VOID
    ;

statement:
    expression_statement SEMICOLON
    | if_statement
    | while_statement
    | for_statement
    | block
    ;

block:
    LBRACKET RBRACKET
    | LBRACKET source RBRACKET
    ;

if_statement:
    IF LPAREN expression_statement RPAREN statement
    | IF LPAREN expression_statement RPAREN statement ELSE statement
    | IF LPAREN expression_statement RPAREN statement ELSE if_statement

while_statement:
    WHILE LPAREN expression_statement RPAREN statement
    ;

//for(int i = 0; i< 10; i++)
for_statement:
    FOR LPAREN expression_statement SEMICOLON expression_statement SEMICOLON expression_statement RPAREN statement
    ;

expression_statement:
    IDENTIFIER ASSIGN expression_statement
    | expression_statement PLUS expression_statement
    | expression_statement MINUS expression_statement
    | expression_statement STAR expression_statement
    | expression_statement SLASH expression_statement
    | expression_statement MOD expression_statement
    | expression_statement OR expression_statement
    | expression_statement AND expression_statement
    | expression_statement EQUAL expression_statement
    | expression_statement NOT_EQUAL expression_statement
    | expression_statement LESS expression_statement
    | expression_statement LESS_EQUAL expression_statement
    | expression_statement GREATER expression_statement
    | expression_statement GREATER_EQUAL expression_statement
    | NOT expression_statement
    | LPAREN expression_statement RPAREN
    | IDENTIFIER
    | NUMERIC_CONSTANT

%%

int main(int argc, char** argv) {
    if (argc > 1) {
        FILE *fp = fopen(argv[1], "r");
        yyin = fp;
    }
    // Tenta ler um arquivo, caso contrario lê do terminal
    if(yyin == NULL) {
        yyin = stdin;
    }

    int parserResult = yyparse();

    if(!parserResult){
        printf("the program respect the c-- rules!");
        return 0;
    } 
}

void yyerror(const char *s) {
    fprintf(stderr, "syntax error: %s\n", s);
    exit(1);
}