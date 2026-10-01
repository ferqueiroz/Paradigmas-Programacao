# Derivação de um Código a partir da Gramática da Linguagem Java

## 1. Identificação da fonte da gramática

**Linguagem escolhida:** Java

**Fonte consultada:** ***Fonte consultada:** *The Java Language Specification (JLS) mantida pela Oracle. 
https://docs.oracle.com/javase/specs/jls/se6/html/syntax.html 
https://docs.oracle.com/en/java/javase/26/docs/specs/jls/index.html

**Notação utilizada:** A JLS descreve a sintaxe de Java usando uma notação no estilo **BNF (Backus-Naur Form)**, com produções da forma:

```
NãoTerminal:
    alternativa1
    alternativa2
```

Ou seja, a JLS não usa aqueles operadores de repetição do EBNF que a gente às vezes vê por aí (tipo `*`, `+`, `?`). Em vez disso, ela resolve isso de duas formas: usando colchetes `[...]` quando algo é opcional, e usando **recursão** quando algo pode se repetir (é exatamente esse truque que a gente usa mais adiante para gerar números com mais de um dígito).

---

## 2. Produções selecionadas

Da gramática completa de Java, foi selecionado um pequeno subconjunto de regras, simplificado, suficiente para derivar uma declaração local de variável com uma expressão aritmética. As regras abaixo são baseadas diretamente nas produções da JLS (`LocalVariableDeclarationStatement`, `LocalVariableDeclaration`, `VariableDeclarator`, `Type`, `Expression`, etc.), reduzidas ao mínimo necessário:

```
(1) <statement>              ::= <local_var_decl> ";"
(2) <local_var_decl>         ::= <type> <variable_declarator>
(3) <type>                   ::= "int" | "double" | "String"
(4) <variable_declarator>    ::= <identifier> "=" <expression>
(5) <identifier>             ::= "x" | "y" | "z" | "resultado"
(6) <expression>             ::= <term> | <expression> "+" <term>
(7) <term>                   ::= <number>
(8) <number>                 ::= <digit> | <number> <digit>
(9) <digit>                  ::= "0" | "1" | "2" | "3" | "4" | "5"
                                  | "6" | "7" | "8" | "9"
```

### Significado das principais regras

- **Regra (1)** representa um comando de declaração local (`LocalVariableDeclarationStatement` na JLS), que é uma declaração de variável seguida de `;`.
- **Regra (2)** define que uma declaração local é composta por um **tipo** seguido de um **declarador de variável**.
- **Regra (3)** restringe o tipo a `int`, `double` ou `String`, correspondendo à produção `Type` da JLS (aqui simplificada para poucos tipos primitivos/classe).
- **Regra (4)** define o declarador de variável como um identificador, o símbolo `=` e uma expressão de inicialização — corresponde a `VariableDeclarator` da JLS.
- **Regra (5)** restringe o identificador a um pequeno conjunto de nomes válidos (simplificação de `Identifier`), incluindo agora `"resultado"`.
- **Regra (6)** representa uma expressão aritmética simples de adição, correspondendo (de forma simplificada) à produção `AdditiveExpression` da JLS.
- **Regra (7)** reduz um termo a um número literal.
- **Regras (8) e (9)** são **recursivas** e permitem representar números com **mais de um dígito** (como `10`): um `<number>` pode ser um único `<digit>`, ou um `<number>` seguido de mais um `<digit>` — o que corresponde, de forma simplificada, à produção `IntegerLiteral`/`Digits` da JLS.

---

## 3. Código a ser gerado

O trecho de código Java escolhido é uma **declaração de variável com inicialização por meio de uma expressão aritmética**, usando um número de dois dígitos:

```java
int resultado = 10 + 5;
```

---

## 4. Derivação passo a passo

Partindo do símbolo inicial `<statement>` e aplicando sucessivamente as produções (indicando entre parênteses qual regra foi usada):

```
<statement>
⇒ <local_var_decl> ";"                                                (1)
⇒ <type> <variable_declarator> ";"                                     (2)
⇒ "int" <variable_declarator> ";"                                       (3)
⇒ "int" <identifier> "=" <expression> ";"                               (4)
⇒ "int" "resultado" "=" <expression> ";"                                 (5)
⇒ "int" "resultado" "=" <expression> "+" <term> ";"                      (6)
⇒ "int" "resultado" "=" <term> "+" <term> ";"                             (6)
⇒ "int" "resultado" "=" <number> "+" <term> ";"                           (7)
⇒ "int" "resultado" "=" <number> <digit> "+" <term> ";"                    (8)
⇒ "int" "resultado" "=" <digit> <digit> "+" <term> ";"                      (8)
⇒ "int" "resultado" "=" "1" <digit> "+" <term> ";"                           (9)
⇒ "int" "resultado" "=" "1" "0" "+" <term> ";"                                (9)
⇒ "int" "resultado" "=" "1" "0" "+" <number> ";"                              (7)
⇒ "int" "resultado" "=" "1" "0" "+" <digit> ";"                                (8)
⇒ "int" "resultado" "=" "1" "0" "+" "5" ";"                                     (9)
```

Concatenando os terminais obtidos na ordem em que aparecem:

```java
int resultado = 10 + 5;
```

**Observação sobre o número `10`:** ele foi obtido aplicando a regra recursiva (8) uma vez — `<number> ::= <number> <digit>` — para expandir `<number>` em `<number> <digit>`, e então reduzindo o `<number>` interno a um único `<digit>` (regra 8, primeira alternativa) e resolvendo os dois dígitos individualmente pela regra (9) como `"1"` e `"0"`. Isso mostra como a recursão permite gerar números com quantos dígitos forem necessários, e não apenas dígitos únicos.

---

## 5. Explicação do processo

A derivação começou pelo símbolo não terminal inicial `<statement>`, que representa "um comando qualquer" na nossa gramática simplificada. A cada passo, um não terminal presente na forma sentencial foi substituído pelo lado direito de uma de suas produções, até que **todos os símbolos restantes fossem terminais** — ou seja, tokens reais da linguagem Java (palavras-chave, identificadores, operadores e literais).

Primeiro, a regra (1) expandiu o comando em uma declaração local seguida de `;`. Em seguida, a regra (2) separou essa declaração em **tipo** + **declarador**. O tipo foi resolvido para o terminal `"int"` pela regra (3). O declarador foi então expandido pela regra (4) em identificador + `=` + expressão, e o identificador foi resolvido para `"resultado"` pela regra (5).

A expressão foi tratada em duas partes. Primeiro, a regra (6) é **recursiva** (`<expression> ::= <expression> "+" <term>`), o que permite representar uma soma. Ela foi aplicada uma vez para gerar a estrutura `<expression> "+" <term>`, e depois o `<expression>` restante foi reduzido a um único `<term>` (segunda alternativa da regra 6). Cada `<term>` foi então resolvido em `<number>` pela regra (7).

O ponto mais interessante desta versão da atividade é a geração do número `10`, que tem **dois dígitos**. Isso só é possível porque a regra (8) também é recursiva (`<number> ::= <number> <digit>`), permitindo "empilhar" quantos dígitos forem necessários. Ela foi aplicada uma vez para separar o número em `<number> <digit>`, o `<number>` interno foi reduzido a um único `<digit>` (primeira alternativa da regra 8), e cada `<digit>` foi então resolvido para um terminal pela regra (9), gerando `"1"` e `"0"`. Já o segundo número, `5`, precisou de apenas uma aplicação das regras (7)-(9), pois é um único dígito.

Ao final, a concatenação de todos os terminais produzidos, na ordem em que a derivação os gerou, forma exatamente o código-alvo:

```java
int resultado = 10 + 5;
```

---

## 6. Terminais e não terminais utilizados

**Não terminais** (símbolos que ainda podem ser expandidos por outras regras):

| Não terminal | Papel |
|---|---|
| `<statement>` | símbolo inicial; representa um comando |
| `<local_var_decl>` | declaração local de variável |
| `<type>` | tipo da variável |
| `<variable_declarator>` | identificador + inicialização |
| `<identifier>` | nome da variável |
| `<expression>` | expressão aritmética |
| `<term>` | termo dentro da expressão |
| `<number>` | número literal (um ou mais dígitos) |
| `<digit>` | um único dígito |

**Terminais** (símbolos finais, que aparecem literalmente no código-fonte e não podem mais ser expandidos):

| Terminal | Papel |
|---|---|
| `"int"` | palavra-chave de tipo |
| `"resultado"` | nome do identificador |
| `"="` | operador de atribuição |
| `"+"` | operador de adição |
| `"1"`, `"0"`, `"5"` | dígitos que compõem os literais numéricos `10` e `5` |
| `";"` | fim de comando |

---

## 7. Conclusão

A atividade demonstrou, de forma simplificada mas fiel ao espírito da *Java Language Specification*, como um pequeno subconjunto de regras de produção em notação BNF pode ser usado para derivar, passo a passo, um trecho de código Java sintaticamente válido — no caso, a declaração `int resultado = 10 + 5;`. O uso de produções recursivas para `<expression>` e para `<number>` mostrou como uma gramática finita de regras é capaz de gerar construções de tamanho variável (somas encadeadas, números com múltiplos dígitos), evidenciando a relação direta entre teoria de linguagens formais (símbolos terminais/não terminais, produções, derivação) e a definição precisa da sintaxe de uma linguagem de programação real.
