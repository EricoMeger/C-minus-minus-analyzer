# C-- (C-minus-minus) Analyzer

Este projeto é um analisador léxico e sintático para uma linguagem fictícia chamada C--, inspirada na linguagem C. Foi desenvolvido como parte de um trabalho acadêmico de Linguagens Formais e Autômatos, utilizando as ferramentas **Flex** e **Bison**.
<p>O analisador lê um arquivo-fonte, identifica e classifica tokens (palavras-chave, identificadores, operadores, delimitadores, etc.), e valida se o código respeita as regras sintáticas do C--. Além disso, reporta erros léxicos (como símbolos inválidos) e erros sintáticos com indicação de linha.</p>

# Como rodar o projeto:

O projeto utiliza um **Makefile** para facilitar a compilação e testes.

#### 1. Compilação

Para compilar o analisador, execute:

```sh
$ make
```

#### 2. Rodar testes

Existem testes prontos em `test_cases/valid/` e `test_cases/invalid/`.

- Para rodar um teste válido:

```sh
$ make test_valid
```

- Para rodar um teste inválido:

```sh
$ make test_invalid
```

Esses comandos irão executar o analisador `cmm` com os exemplos como entrada.

#### 3. Executar manualmente

Você também pode rodar manualmente:

```sh
$ ./cmm ./caminho/para/seu_codigo.cmm
```

Ou via cin:

```sh
$ ./cmm < caminho/para/seu_codigo.cmm
```

# 📜 Sobre o Flex

O arquivo `cmm.lex` segue a estrutura padrão dos arquivos Flex, dividida em três seções separadas por linhas contendo apenas `%%`:

```bash
Definições
%%
Regras
%%
Código de apoio
```

- **Definições:** Declarações de variáveis, imports de bibliotecas, configurações de opções.
- **Regras:** Expressões regulares associadas a ações de código para reconhecer os tokens.
- **Código de apoio:** Funções auxiliares ou o main() que chama yylex(). Para trabalhar com o Bison, a main do lex não é definida e, portanto, essa seção não é mais utilizada.

# 🎯 Sobre o Bison

O arquivo cmm.y define:

- Tokens recebidos do Flex.
- As construções sintáticas aceitas:
  - if, if-else, if-else-if, etc..
  - while, for
  - Declaração de variáveis e funções
  - Ponteiros e Referências
  - Expressões aritméticas, de lógica e de comparação
  - Atribuições
  
Se a entrada não respeitar a gramática, o Bison gera uma mensagem de erro sintático informando a linha e o caractere.

# Gramática

```
S → SOURCE

SOURCE → SOURCE DECLARATION 
       | SOURCE STATEMENT 
       | λ

DECLARATION → TYPE_SPECIFIER identifier ;
            | TYPE_SPECIFIER identifier = INITIALIZER ;
            | TYPE_SPECIFIER POINTER identifier = INITIALIZER ;
            | TYPE_SPECIFIER POINTER identifier ;
            | TYPE_SPECIFIER identifier ( PARAMETER_LIST ) ;
            | TYPE_SPECIFIER identifier ( PARAMETER_LIST ) BLOCK

INITIALIZER → numeric_constant
            | identifier
            | string
            | char_constant

PARAMETER_LIST → λ
               | PARAMETER_LIST , TYPE_SPECIFIER identifier
               | TYPE_SPECIFIER identifier
               | TYPE_SPECIFIER POINTER identifier

POINTER → *
        | &
        | * POINTER

TYPE_SPECIFIER → char | int | long | short | void

STATEMENT → EXPRESSION_STATEMENT ;
          | IF_STATEMENT
          | WHILE_STATEMENT
          | FOR_STATEMENT
          | BLOCK
          | break ;
          | continue ;
          | return EXPRESSION_STATEMENT ;
          | return ;

BLOCK → { }
      | { SOURCE }

IF_STATEMENT → if ( EXPRESSION_STATEMENT ) STATEMENT
             | if ( EXPRESSION_STATEMENT ) STATEMENT else STATEMENT

WHILE_STATEMENT → while ( EXPRESSION_STATEMENT ) STATEMENT

FOR_STATEMENT → for ( EXPRESSION_STATEMENT ; EXPRESSION_STATEMENT ; EXPRESSION_STATEMENT ) STATEMENT

EXPRESSION_STATEMENT → EXPRESSION

EXPRESSION → identifier = EXPRESSION
           | EXPRESSION + EXPRESSION
           | EXPRESSION - EXPRESSION
           | EXPRESSION * EXPRESSION
           | EXPRESSION / EXPRESSION
           | EXPRESSION % EXPRESSION
           | EXPRESSION || EXPRESSION
           | EXPRESSION && EXPRESSION
           | EXPRESSION == EXPRESSION
           | EXPRESSION != EXPRESSION
           | EXPRESSION < EXPRESSION
           | EXPRESSION <= EXPRESSION
           | EXPRESSION > EXPRESSION
           | EXPRESSION >= EXPRESSION
           | ! EXPRESSION
           | ( EXPRESSION )
           | POINTER EXPRESSION
           | identifier ( ARGUMENT_LIST )
           | identifier
           | numeric_constant
           | char_constant
           | string

ARGUMENT_LIST → EXPRESSION
              | ARGUMENT_LIST , EXPRESSION
              | λ
```

# Referências

### Flex
- [Manual do Flex (GNU)](https://ftp.gnu.org/old-gnu/Manuals/flex-2.5.4/html_mono/flex.html#SEC5)
- [Flex - Fast Lexical Analyzer Generator (GeeksforGeeks)](https://www.geeksforgeeks.org/flex-fast-lexical-analyzer-generator/)
- [Introduction of lexical analysis (GeeksforGeeks)](https://www.geeksforgeeks.org/introduction-of-lexical-analysis/)
- [Working of lexical analyzer in compiler (GeeksforGeeks)](https://www.geeksforgeeks.org/working-of-lexical-analyzer-in-compiler/)
- [Explicação prática do uso de Lex (IME-USP)](https://www.ime.usp.br/~kon/MAC211/2002/lista/msg00071.html)


### Bison
- [ANSI C grammar, Lex specification](https://www.quut.com/c/ANSI-C-grammar-l.html)
- [Writing a Parser using (F)LEX and YACC/BISON](https://sayef.tech/post/writing-a-parser-using-flex-and-yaccbison/)
- [Bison: Creating Syntax Analyzer of Simple Simple C](https://www.youtube.com/watch?v=avXZE-Kgc-U)
- [Building a Simple C Compiler Using Lex](https://medium.com/@princedonda4489/building-a-simple-c-compiler-using-lex-96869fbb1e39)
- [Bison learning notes](https://github.com/ifding/flex-bison/blob/master/bison-learning-notes.md)
- [Bison Manual](https://www.gnu.org/software/bison/manual/html_node/Recursion.html)

# Autor

Projeto desenvolvido por Érico Meger.
