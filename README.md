https://ftp.gnu.org/old-gnu/Manuals/flex-2.5.4/html_mono/flex.html#SEC5
https://www.geeksforgeeks.org/flex-fast-lexical-analyzer-generator/
https://www.geeksforgeeks.org/introduction-of-lexical-analysis/
https://www.geeksforgeeks.org/working-of-lexical-analyzer-in-compiler/
https://www.ime.usp.br/~kon/MAC211/2002/lista/msg00071.html

o input de um arquivo flex consiste de três seções, separadas por uma linha com somente %% nela

```
definições (variaveis, imports, etc.)
%%
regras (palavras-chave, coisas q precisam existir na linguagem)
%%
codigo para rodar o analisador léxico
```

%option noyywrap // Faz com que o analisador rode ate o fim do yyin (arq recebido) e retorne automaticamente.
%option yylineno // Contador de linha próprio do flex
yytext é uma variável propria do flex que guarda o lexema que acabou de ser reconhecido

falta fazer string coom \n nao ser reconhecida