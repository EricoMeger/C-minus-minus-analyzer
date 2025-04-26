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