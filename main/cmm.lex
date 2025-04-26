%option noyywrap
/* Faz com que o analisador rode ate o fim do yyin (arq recebido) e retorne automaticamente. */ 
%option yylineno
/* Contador de linha próprio do flex */

KEYWORDS break|continue|else|for|if|return|struct|while
TYPES char|int|long|short|void
OPERATORS \+|\-|\*|\/|%|\|\||&&|==|!=|<|<=|>|>=|!
ATTRIBUTION =
DIGIT [0-9]
CHARACTER_CONSTANT \'[a-zA-Z0-9!@#\$%\^&*()\-=\+\\]\'
STRING_CONSTANT \"[a-zA-Z0-9!@#\$%\^&*()\-=\+\\]*\"
IDENTIFIER_CONSTANT [a-zA-Z_][a-zA-Z0-9_]*
DELIMITERS [(){}\[\];,]
INVALID_IDENTIFIER {DIGIT}+{IDENTIFIER_CONSTANT}

%%

{KEYWORDS} {
    printf("Found keyword: %s\n", yytext); /* yytext é uma variável propria do flex que guarda o lexema que acabou de ser reconhecido */
}

{TYPES} {
    printf("Found type: %s\n", yytext);
}

{OPERATORS} {
    printf("Found operator: %s\n", yytext);
}

{ATTRIBUTION} {
    printf("Found attribution operator: %s\n", yytext);
}

{CHARACTER_CONSTANT} {
    printf("Found character constant: %s\n", yytext);
}

{STRING_CONSTANT} {
    printf("Found string constant: %s\n", yytext);
}

{INVALID_IDENTIFIER} {
    printf("Error at line %d, Invalid identifier %s.\n", yylineno, yytext);
    exit(1);
}

{IDENTIFIER_CONSTANT} {
    printf("Found identifier: %s\n", yytext);
}

{DIGIT}+ {
    printf("Found numeric constant: %s\n", yytext);
}

{DELIMITERS} {
    printf("Found delimiter: %s\n", yytext);
}

[ \t\n]+   /* eat up whitespace */ /*https://ftp.gnu.org/old-gnu/Manuals/flex-2.5.4/html_mono/flex.html#SEC5*/

. { /* Caso default (Não caiu em nenhum dos anteriores) */
    printf("Error at line %d, %s isn't part of the alphabet\n.", yylineno, yytext);
    exit(1);
}

%%

int main() {
    yylex();
}