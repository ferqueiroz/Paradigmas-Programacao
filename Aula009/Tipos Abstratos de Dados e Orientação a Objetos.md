# Aula 009 – TADs e OO

## 1 · Java

**a) Saída:** `au`

**b) Explicação:**
A variável foi declarada como `Animal`, mas o objeto que ela realmente guarda é um `Cachorro`. Como o método é de instância, o Java verifica qual é o tipo real do objeto na hora da execução. Por isso, ele chama o método do `Cachorro`, que imprime `au`.

## 2 · C++

**a) Saída:** `A`

**b) Explicação:**
O método `f` não foi declarado como `virtual`. Por isso, o C++ considera o tipo do ponteiro (`A*`) para decidir qual método será chamado. Nesse caso, ele chama o método de `A`, mesmo que o objeto seja do tipo `B`.

Se o método fosse declarado como `virtual void f()`, aí o C++ usaria o tipo real do objeto e a saída seria `B`.

## 3 · Java

**a) Saída:** `A B`

**b) Explicação:**
Nesse caso acontece uma diferença importante entre atributo e método.

O `x.nome` é resolvido na compilação. Como `x` foi declarado como `A`, o Java acessa o `nome` definido em `A`.

Já o `x.getNome()` funciona de outra forma. Como `getNome()` é um método que foi sobrescrito em `B`, o Java verifica o tipo real do objeto durante a execução. Como o objeto é `B`, ele chama o método de `B` e retorna o nome de `B`.

Por isso, o resultado é `A B`.

## 4 · Python

**a) Saída:** `1 2 2`

**b) Explicação:**
O `total` é um atributo da classe, então ele é compartilhado entre os objetos. Já o `id` pertence a cada objeto individualmente.

Quando o Python procura um atributo, ele primeiro verifica se ele existe no próprio objeto. Caso não encontre, procura na classe. Como essa busca acontece durante a execução, o valor encontrado depende do estado atual do objeto e da classe.

## 5 · Java

**a) Saída:** `A`

**b) Explicação:**
Métodos `static` não funcionam como os métodos normais de instância. Eles não são sobrescritos; quando uma classe filha declara um método `static` com o mesmo nome, dizemos que ela está apenas ocultando o método da classe pai (*method hiding*).

Por isso, a chamada é definida pelo tipo declarado da variável (`A`) e não pelo tipo real do objeto. Nesse caso, o método de `A` é chamado e a saída é `A`.

## 6 · Go

**a) Saída:** `faz ... au`

**b) Explicação:**
No Go, colocar `Animal` dentro de `Cao` é uma forma de composição, e não de herança tradicional.

Dentro do método `Falar`, o receptor `a` é um `Animal`. Por isso, quando `a.Som()` é chamado, o Go executa o `Som()` definido em `Animal`. Não existe nesse caso o mesmo mecanismo de métodos virtuais encontrado em Java.

Por outro lado, quando chamamos `Cao{}.Som()`, o método `Som()` do próprio `Cao` é utilizado. Ele acaba escondendo o método que veio do `Animal`.
