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

/* {KEYWORDS} {
    printf("Found keyword: %s\n", yytext); /* yytext é uma variável propria do flex que guarda o lexema que acabou de ser reconhecido */
} */

"break" {return BREAK;}
"continue" {return CONTINUE;}
"else" {return ELSE;}
"for" {return FOR;}
"if" {return IF;}
"return" {return RETURN;}
/* "struct" {return STRUCT;} Bison nao precisa aceitar */
"while" {return WHILE;}

/* {TYPES} {
    printf("Found type: %s\n", yytext);
} */

"char" {return CHAR;}
"int" {return INT;}
"long" {return LONG;}
"short" {return SHORT;}
"void" {return VOID;}

/* {OPERATORS} {
    printf("Found operator: %s\n", yytext);
} */

"+" {return PLUS;}
"-" {return MINUS;}
"*" {return MULTIPLY;}
"/" {return SLASH;}
"%" {return MOD;}
"||" {return OR;}
"&&" {return AND;}
"==" {return EQUAL;}
"!=" {return NOT_EQUAL;}
"<" {return LESS;}
"<=" {return LESS_EQUAL;}
">" {return GREATER;}
">=" {return GREATER_EQUAL;}
"!" {return NOT;}

{ASSIGNMENT} {
    return ASS;
}

{CHARACTER_CONSTANT} {
    return CHAR;
}

{STRING_CONSTANT} {
    return STRING;
}

/* {INVALID_IDENTIFIER} {
    printf("Error at line %d, Invalid identifier %s.\n", yylineno, yytext);
    exit(1);
} */

{IDENTIFIER_CONSTANT} {
    return IDENTIFIER;
}

{DIGIT}+ {
    printf("Found numeric constant: %s\n", yytext);
}

/* {DELIMITERS} {
    printf("Found delimiter: %s\n", yytext);
} */

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