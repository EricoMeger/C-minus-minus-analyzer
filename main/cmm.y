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
    source declaration
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

// açoes / instrucoes do codigo; x = 5, if, return, etc.
statement:
    expression_statement SEMICOLON
    | if_statement
    | while_statement
    | for_statement
    | block
    | BREAK SEMICOLON
    | CONTINUE SEMICOLON
    | RETURN expression_statement SEMICOLON
    | RETURN SEMICOLON
    ;

block:
    LBRACKET RBRACKET
    | LBRACKET source RBRACKET
    ;

if_statement:
    IF LPAREN expression_statement RPAREN statement
    | IF LPAREN expression_statement RPAREN statement ELSE statement
    ;

while_statement:
    WHILE LPAREN expression_statement RPAREN statement
    ;

//for(int i = 0; i< 10; i++)
for_statement:
    FOR LPAREN expression_statement SEMICOLON expression_statement SEMICOLON expression_statement RPAREN statement
    ;

expression_statement:
    expression
    ;

expression:
    IDENTIFIER ASSIGN expression
    | expression PLUS expression
    | expression MINUS expression
    | expression STAR expression
    | expression SLASH expression
    | expression MOD expression
    | expression OR expression
    | expression AND expression
    | expression EQUAL expression
    | expression NOT_EQUAL expression
    | expression LESS expression
    | expression LESS_EQUAL expression
    | expression GREATER expression
    | expression GREATER_EQUAL expression
    | NOT expression
    | LPAREN expression RPAREN
    | IDENTIFIER
    | NUMERIC_CONSTANT
    | CHAR_CONSTANT
    | STRING
    ;

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
        printf("the program respect the c-- rules!\n");
        return 0;
    } 
}

void yyerror(const char *s) {
    extern int yylineno;
    extern char *yytext;
    fprintf(stderr, "syntax error at line %d: unexpected token '%s'\n", yylineno, yytext);
    exit(1);
}