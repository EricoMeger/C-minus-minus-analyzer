# C-- (C-minus-minus) Lexical Analyzer

<p>Este projeto é um analisador léxico para uma linguagem fictícia chamada C--, baseada na linguagem C. Foi desenvolvido como parte de um trabalho acadêmico de Linguagens formais e autômatos, utilizando a ferramenta Flex para geração automática do scanner.</p>
<p>O analisador lê um arquivo fonte, identifica e classifica seus tokens (como palavras-chave, identificadores, operadores, delimitadores, etc.), e reporta possíveis erros léxicos, como identificadores inválidos ou símbolos desconhecidos.</p>

# Como rodar o projeto:

O projeto utiliza um **Makefile** para facilitar a compilação e testes.

#### 1. Compilação

Para compilar o analisador, execute:

```sh
$ make
```

#### 2. Rodar testes

Existem testes de exemplo para códigos validos e inválidos localizados em `main/test_cases`.
- Testar um código válido:

```sh
$ make test_valid
```

- Testar um código inválido:


```sh
$ make test_invalid
```

Esses comandos irão executar o analisador `cmm` passando arquivos de teste como entrada padrão.

#### 3. Executar manualmente

Você também pode rodar manualmente:

```sh
$ ./cmm < caminho/para/seu_codigo.*
```

# Notas sobre Flex

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
- **Código de apoio:** Funções auxiliares ou o main() que chama yylex().

# Referências

- [Manual do Flex (GNU)](https://ftp.gnu.org/old-gnu/Manuals/flex-2.5.4/html_mono/flex.html#SEC5)
- [Flex - Fast Lexical Analyzer Generator (GeeksforGeeks)](https://www.geeksforgeeks.org/flex-fast-lexical-analyzer-generator/)
- [Introduction of lexical analysis (GeeksforGeeks)](https://www.geeksforgeeks.org/introduction-of-lexical-analysis/)
- [Working of lexical analyzer in compiler (GeeksforGeeks)](https://www.geeksforgeeks.org/working-of-lexical-analyzer-in-compiler/)
- [Explicação prática do uso de Lex (IME-USP)](https://www.ime.usp.br/~kon/MAC211/2002/lista/msg00071.html)


--- BISON

https://begriffs.com/posts/2021-11-28-practical-parsing.html

https://www.quut.com/c/ANSI-C-grammar-l.html

https://sayef.tech/post/writing-a-parser-using-flex-and-yaccbison/

https://www.youtube.com/watch?v=avXZE-Kgc-U

https://medium.com/@princedonda4489/building-a-simple-c-compiler-using-lex-96869fbb1e39

https://github.com/ifding/flex-bison/blob/master/bison-learning-notes.md

https://www.quut.com/c/ANSI-C-grammar-l.html

https://www.gnu.org/software/bison/manual/html_node/Recursion.html

# Autor

Projeto desenvolvido por Érico Meger.
