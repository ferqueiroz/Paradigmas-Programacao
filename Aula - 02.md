# Evolução das Principais Linguagens de Programação
### Respostas — Capítulo 2, Robert Sebesta

---

## Questão 1
**A genealogia das linguagens não é uma escada de progresso.**

Dizer que a genealogia das linguagens de programação não é uma "escada de progresso" significa que a história das linguagens não é uma sequência linear onde cada linguagem nova substitui e supera completamente a anterior, como degraus rumo a algo "melhor". Na prática, linguagens antigas continuam vivas, coexistindo com as novas, e uma linguagem pode influenciar outra sem que a mais antiga desapareça.

Dois fatores históricos que explicam isso:

1. **Legado de código e custo de migração**: sistemas críticos (bancos, governos, indústria) têm bases de código gigantescas escritas em linguagens como COBOL. Reescrever tudo em uma linguagem "mais moderna" tem custo e risco altíssimos, então a linguagem antiga permanece em uso mesmo décadas depois de surgirem alternativas.
2. **Especialização por domínio**: cada linguagem nasce para resolver um tipo de problema (Fortran para cálculo numérico, Lisp para processamento simbólico, COBOL para processamento comercial). Uma linguagem nova pode ser "melhor" em termos gerais, mas não necessariamente no domínio específico onde a antiga já é otimizada e testada — por isso ela influencia (empresta ideias, sintaxe, conceitos), mas não substitui.

---

## Questão 2
**Plankalkül não foi implementada em sua época — por que é relevante?**

Plankalkül, projetada por Konrad Zuse entre 1943 e 1945, nunca foi implementada na época porque a Alemanha estava em guerra e depois em reconstrução: faltavam recursos, hardware disponível e o próprio meio acadêmico/industrial para divulgar e compilar a linguagem. O trabalho de Zuse só foi publicado décadas depois e uma implementação só foi feita nos anos 1990, como projeto histórico.

Ainda assim, é relevante porque antecipou conceitos que só apareceriam em outras linguagens muito depois:

- **Estruturas de dados complexas**: permitia trabalhar com arrays e estruturas hierárquicas (semelhantes a registros), algo que só se tornaria comum bem mais tarde.
- **Atribuição e controle estruturado**: tinha noção de variáveis, atribuição de valores e estruturas de repetição, sem depender de saltos incondicionais (goto) como base do controle de fluxo.
- **Invariantes/asserções**: incluía mecanismos para expressar condições que deveriam ser verdadeiras em certos pontos do programa, uma ideia próxima da programação por contrato.

O valor de destacar, por exemplo, as **estruturas de dados complexas**: Plankalkül permitia manipular dados agregados décadas antes de linguagens como Fortran (que só trabalhava bem com dados escalares e arrays simples) — mostrando que o "problema" de organizar dados complexos já era pensado antes mesmo de existir hardware capaz de rodar isso de forma prática.

---

## Questão 3
**Short Code, Speedcoding e os sistemas A-0/A-1/A-2**

- **Short Code** (1949, Mauchly): era uma linguagem *interpretada*, não compilada — cada instrução em pseudocódigo era lida e executada em tempo real por um interpretador. Resolvia o problema de programar diretamente em código de máquina/binário, mas era lento, pois a tradução acontecia a cada execução.
- **Speedcoding** (IBM, início dos anos 1950, para o IBM 701): também era um interpretador, focado em oferecer operações de ponto flutuante (que a máquina não tinha nativamente) de forma mais acessível. Resolvia o problema de complexidade aritmética, mas sofria do mesmo problema de lentidão do Short Code, por ser interpretado.
- **Sistemas A-0, A-1, A-2** (Grace Hopper, início dos anos 1950): funcionavam mais como um sistema de **bibliotecas de sub-rotinas** combinadas por um programa "controlador" — o programador escrevia uma sequência de códigos que indicavam quais sub-rotinas pré-compiladas deveriam ser combinadas e executadas. Isso resolvia o problema de reaproveitamento de código, mas ainda não gerava código-máquina novo e otimizado a partir de uma linguagem de alto nível — era essencialmente um "montador de sub-rotinas".

Chamá-los simplesmente de "compiladores modernos" seria impreciso porque nenhum deles fazia o que entendemos hoje por compilação: traduzir uma linguagem de alto nível inteira para código de máquina eficiente, de forma automática e otimizada. Short Code e Speedcoding eram interpretadores (execução indireta, lenta); os sistemas A eram montadores/ligadores de sub-rotinas prontas. O verdadeiro salto para compilação como conhecemos só vem com o Fortran.

---

## Questão 7
**COBOL — domínio comercial, legibilidade, registros e FLOW-MATIC**

COBOL foi desenhada nos anos 1959-60 especificamente para **processamento de dados comerciais** (folha de pagamento, contabilidade, estoques), um domínio muito diferente do cálculo científico do Fortran. Isso moldou diretamente o projeto da linguagem:

- **Legibilidade**: como o público-alvo incluía gerentes e analistas de negócio (não só programadores especialistas), COBOL foi projetada com sintaxe verbosa e próxima do inglês (`ADD AMOUNT TO TOTAL`, `MOVE X TO Y`), para que pessoas não-técnicas pudessem ao menos ler e entender o que o programa fazia.
- **Registros (Data Division)**: para representar dados comerciais reais (uma "ficha de funcionário", uma "nota fiscal"), COBOL introduziu estruturas de registro hierárquicas, permitindo organizar campos e subcampos de forma parecida com formulários do mundo real — algo que Fortran, focado em números e arrays, não priorizava.
- **Relação com FLOW-MATIC**: COBOL se baseou fortemente na linguagem FLOW-MATIC, criada por Grace Hopper, que já usava comandos em inglês e era voltada a processamento de dados comerciais. FLOW-MATIC funcionou como protótipo conceitual: mostrou que era viável (e útil) programar aplicações de negócio usando comandos legíveis, e COBOL formalizou e padronizou essa ideia.

---

## Questão 9
**APL, SNOBOL e SIMULA 67 — focos distintos**

- **APL** (Kenneth Iverson, início dos anos 60): focada em **processamento de arrays e matrizes** de forma extremamente concisa, com um conjunto rico de operadores matemáticos representados por símbolos especiais. Contribuição duradoura: popularizou o conceito de **programação orientada a arrays**, influenciando linguagens posteriores voltadas a computação numérica/vetorial (como ideias que aparecem em R, MATLAB, NumPy).
- **SNOBOL** (também início dos anos 60): focada em **processamento de strings e casamento de padrões (pattern matching)**, muito usada para manipulação de texto. Contribuição duradoura: as técnicas de reconhecimento de padrões influenciaram diretamente o desenvolvimento de expressões regulares e ferramentas de processamento de texto usadas até hoje.
- **SIMULA 67**: criada para **simulação de eventos discretos** (modelar sistemas do mundo real, como filas e processos). Contribuição duradoura: introduziu os conceitos de **classe e objeto**, sendo a linguagem que efetivamente originou a programação orientada a objetos, influenciando diretamente Smalltalk, C++ e, por extensão, quase toda a programação moderna.

---

## Questão 11
**Cadeia de influência ALGOL → Pascal → C, contrastada com Prolog**

**Cadeia imperativa:**
- **ALGOL 60** introduziu blocos estruturados, tipagem mais rigorosa e uma sintaxe formal (BNF) que se tornaria padrão de referência.
- **Pascal** (Niklaus Wirth, 1971) nasceu como evolução didática de ALGOL, reforçando a **programação estruturada**: controle de fluxo sem `goto` excessivo, tipos de dados bem definidos, ênfase em clareza para ensino de boas práticas de programação.
- **C** (Dennis Ritchie, 1972) herda da família ALGOL (via BCPL/B) a estrutura em blocos e a sintaxe de controle de fluxo, mas prioriza **eficiência e proximidade do hardware** (ponteiros, manipulação de memória, tipos mais permissivos), voltada a programação de sistemas (como o próprio Unix).

Essa linhagem é fundamentalmente **imperativa**: o programador descreve uma sequência de comandos que alteram o estado da memória passo a passo, controlando explicitamente o fluxo de execução.

**Contraste com Prolog:**
Prolog (1972) é **declarativo/lógico**: o programador não descreve "como fazer", mas sim **fatos e regras** sobre um domínio, baseados em lógica de predicados (cláusulas de Horn). A execução do programa é uma **consulta**, respondida pelo motor de inferência do Prolog através de unificação e backtracking — não existe uma sequência explícita de comandos como em ALGOL/Pascal/C. Enquanto a linhagem imperativa pergunta "que passos executar?", Prolog pergunta "que fatos e regras tornam esta consulta verdadeira?".

---

## Questão 14
**Objetos em Smalltalk, C++ e Java**

- **Smalltalk** (Alan Kay e equipe, Xerox PARC, anos 70): é orientação a objetos em sua forma mais pura. Absolutamente tudo é objeto (até números e classes), e toda interação acontece por **troca de mensagens** entre objetos. Foi pensada como uma linguagem de exploração de ideias e ensino, com tipagem dinâmica, priorizando expressividade e flexibilidade sobre desempenho bruto.
- **C++** (Bjarne Stroustrup, início dos anos 80): adiciona orientação a objetos (inspirada em Simula 67) *em cima* de C. O ponto central é o **compromisso com compatibilidade com C**: C++ precisava rodar rápido, permitir manipulação de memória de baixo nível e aproveitar o enorme código C já existente. Por isso é uma linguagem **híbrida**: suporta tanto estilo procedural puro quanto OOP, com tipagem estática e sem coletor de lixo automático (na versão clássica), priorizando desempenho e controle.
- **Java** (Sun Microsystems, meados dos anos 90): também orientada a objetos, mas com foco central em **portabilidade** — "escreva uma vez, rode em qualquer lugar". Em vez de compilar para código de máquina nativo como C++, Java compila para bytecode executado pela JVM, o que permite rodar o mesmo programa em diferentes plataformas sem recompilar. Java também simplifica em relação a C++ (sem herança múltipla de implementação, sem ponteiros diretos, com coleta de lixo automática), priorizando segurança e portabilidade em vez de controle máximo de baixo nível.

Em resumo: Smalltalk representa o ideal "puro" de objetos; C++ é o compromisso entre OOP e desempenho/compatibilidade com C; Java é o compromisso entre OOP e portabilidade/segurança.

---

## Questão 15
**Java: da TV interativa para a Web**

O projeto que originou Java (conhecido internamente como "Green Project", na Sun Microsystems, início dos anos 90) tinha como aplicação original **dispositivos eletrônicos de consumo**, como controles remotos inteligentes e set-top boxes para TV interativa — um mercado que, na época, não decolou como esperado.

Quando a Web explodiu em popularidade em meados dos anos 90, a Sun percebeu que as características que tinham sido projetadas para os tais dispositivos (portabilidade entre plataformas de hardware diferentes, segurança na execução de código, tamanho reduzido) eram **exatamente** o que faltava para rodar programas confiáveis dentro de navegadores em qualquer computador. Java foi então reposicionada como linguagem para **applets** executados em páginas Web, encontrando ali sua verdadeira explosão de adoção.

Isso mostra como uma mudança de contexto — o surgimento de um novo mercado (a Web) — pode dar um novo propósito e um novo impulso de adoção a uma tecnologia que havia sido criada para outro fim completamente diferente, sem que a linguagem em si precisasse mudar sua essência técnica.

---

## Questão 16
**Perl, JavaScript, PHP, Python, Ruby e Lua**

| Linguagem | Domínio inicial | Estrutura de dados central | Estratégia de implementação |
|---|---|---|---|
| **Perl** | Administração de sistemas / processamento de texto | Arrays e hashes (arrays associativos) nativos, regex embutida | Interpretada, com compilação interna para bytecode antes da execução |
| **JavaScript** | Scripting no lado do cliente, dentro do navegador (manipulação de páginas Web) | Objetos e arrays, baseada em protótipos | Interpretada/JIT, executada pelo motor do navegador |
| **PHP** | Geração de páginas Web dinâmicas no lado do servidor, embutido em HTML | Arrays associativos como estrutura universal | Interpretada, executada a cada requisição no servidor |
| **Python** | Propósito geral, com forte ênfase em legibilidade | Listas, dicionários e tuplas como tipos ricos e distintos | Interpretada (bytecode via CPython) |
| **Ruby** | Propósito geral, orientação a objetos pura, influenciada por Perl e Smalltalk | Tudo é objeto; arrays e hashes como métodos de objetos | Interpretada |
| **Lua** | Linguagem de script embutida em aplicações hospedeiras (jogos, sistemas embarcados) | Uma única estrutura universal, a *table*, unifica arrays e dicionários | Interpretador muito pequeno, projetado para ser embutido via API C |

Apesar de todas serem rotuladas como "linguagens de scripting", elas não são equivalentes: cada uma nasceu para um domínio bem diferente (Perl para automação de sistemas, JavaScript para o navegador, PHP para o servidor Web, Lua para ser embutida dentro de outros programas, Python/Ruby para uso geral) e isso se reflete diretamente em decisões de projeto — por exemplo, Lua opta por uma única estrutura de dados universal (a table) por precisar ser minimalista para embutir em outros sistemas, enquanto Python oferece múltiplos tipos especializados por priorizar clareza para uso geral.

---

## Questão 19
**Linha do tempo — oito linguagens, quatro paradigmas**

1. **Fortran (1957)** — paradigma **imperativo**, primeira linguagem de alto nível com compilador real, focada em cálculo numérico/científico.
2. **Lisp (1958)** — paradigma **funcional**, surge quase em paralelo, focada em processamento simbólico (IA). *Tipo de influência sobre o restante da lista*: introduz o paradigma funcional como alternativa independente ao caminho imperativo.
3. **ALGOL 60 (1960)** — paradigma **imperativo/estruturado**. *Influência*: herda de Fortran a ideia de compilação de alto nível, mas formaliza sintaticamente (BNF) e introduz blocos estruturados — torna-se a referência sintática de toda a família imperativa seguinte.
4. **Simula 67 (1967)** — paradigma **orientado a objetos** (nascente). *Influência*: parte da base sintática de ALGOL 60 e adiciona os conceitos de classe e objeto, criando um novo paradigma em cima de uma base imperativa existente (influência estrutural/sintática + inovação conceitual).
5. **C (1972)** — paradigma **imperativo/procedural** (sistemas). *Influência*: descende da família ALGOL (via BCPL/B) quanto à estrutura de blocos e controle de fluxo, mas se afasta priorizando proximidade do hardware (influência sintática, não filosófica).
6. **Smalltalk (1972)** — paradigma **orientado a objetos puro**. *Influência*: pega o conceito de classes/objetos de Simula 67 e o leva ao extremo, eliminando qualquer resquício procedural (influência conceitual direta, radicalizando a ideia original).
7. **Prolog (1972)** — paradigma **lógico/declarativo**. *Influência*: emerge da mesma comunidade de pesquisa em IA que originou o Lisp, mas rompe com o paradigma funcional/imperativo ao basear-se em lógica de predicados (influência de comunidade/domínio, não de sintaxe).
8. **C++ (1983)** — paradigma **orientado a objetos híbrido**. *Influência*: combina diretamente a base de C (item 5) com os conceitos de classes de Simula 67 (item 4) — um caso claro de influência por combinação de duas linhagens distintas, não uma simples sucessão cronológica.

Paradigmas cobertos: **imperativo** (Fortran, ALGOL 60, C), **funcional** (Lisp), **orientado a objetos** (Simula 67, Smalltalk, C++) e **lógico** (Prolog).

---