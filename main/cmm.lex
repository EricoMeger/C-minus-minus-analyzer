%{
#include "cmm.tab.h" 
%}

%option noyywrap
/* Faz com que o analisador rode ate o fim do yyin (arq recebido) e retorne automaticamente. */ 
%option yylineno
/* Contador de linha próprio do flex */

/* KEYWORDS break|continue|else|for|if|return|struct|while */
/* TYPES char|int|long|short|void */
/* OPERATORS \+|\-|\*|\/|%|\|\||&&|==|!=|<|<=|>|>=|! */
ASSIGNMENT =
DIGIT [0-9]
CHARACTER_CONSTANT \'[a-zA-Z0-9!@#\$%\^&*()\-=\+\\]\'
STRING_CONSTANT \"[a-zA-Z0-9!@#\$%\^&*()\-=\+\\]*\"
IDENTIFIER_CONSTANT [a-zA-Z_][a-zA-Z0-9_]*
/* DELIMITERS [(){}\[\];,] */
/* INVALID_IDENTIFIER {DIGIT}+{IDENTIFIER_CONSTANT} */

%%

%x /* Keywords */
"break" {return BREAK;}
"continue" {return CONTINUE;}
"else" {return ELSE;}
"for" {return FOR;}
"if" {return IF;}
"return" {return RETURN;}
"while" {return WHILE;}

%x /* Types */
"char" {return CHAR;}
"int" {return INT;}
"long" {return LONG;}
"short" {return SHORT;}
"void" {return VOID;}

%x /* Operators */
"+" {return PLUS;}
"-" {return MINUS;}
"*" {return STAR;}
"/" {return SLASH;}
"%" {return MOD;}
"||" {return OR;}
"&" {return REFERENCE;}
"&&" {return AND;}
"==" {return EQUAL;}
"!=" {return NOT_EQUAL;}
"<" {return LESS;}
"<=" {return LESS_EQUAL;}
">" {return GREATER;}
">=" {return GREATER_EQUAL;}
"!" {return NOT;}

{ASSIGNMENT} {
    return ASSIGN;
}

{CHARACTER_CONSTANT} {
    return CHAR_CONSTANT;
}

{STRING_CONSTANT} {
    return STRING;
}

{IDENTIFIER_CONSTANT} {
    return IDENTIFIER;
}

{DIGIT}+ {
    return NUMERIC_CONSTANT;
}

%x /* Delimiters */
"(" {return LPAREN;}
")" {return RPAREN;}
"{" {return LBRACKET;}
"}" {return RBRACKET;}
"," {return COMMA;}
";" {return SEMICOLON;}

[ \t\n]+   /* eat up whitespace */ /*https://ftp.gnu.org/old-gnu/Manuals/flex-2.5.4/html_mono/flex.html#SEC5*/

. { /* Caso default (Não caiu em nenhum dos anteriores) */
    printf("Error at line %d, %s isn't part of the alphabet\n.", yylineno, yytext);
}

%%