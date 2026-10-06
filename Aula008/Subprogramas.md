# Aula 08 · Subprogramas: respostas dos exercícios

## 1 · Python: valor padrão mutável

```python
def adicionar(item, lista=[]):
    lista.append(item)
    return lista

print(adicionar(1))
print(adicionar(2))
```

**a) Saída**

```
[1]
[1, 2]
```

**b) Por quê?**

Quem olha rápido espera `[1]` e `[2]`, mas não é isso que acontece. O valor padrão `[]` é avaliado **uma única vez**, na hora em que o `def` é executado, e não a cada chamada. Ou seja, existe uma só lista, guardada junto com a função, e toda chamada que não passa `lista` reaproveita essa mesma lista.

Na primeira chamada ela vira `[1]`. Na segunda, é a mesma lista (agora com o 1 dentro) e o `append(2)` deixa ela em `[1, 2]`. É um caso clássico de **apelido (*alias*)** com **parâmetro padrão mutável**, e a lista funciona como um estado escondido entre chamadas, o que é um efeito colateral bem traiçoeiro.

**Como corrigir:** usar `None` como padrão e criar a lista dentro da função.
```python
def adicionar(item, lista=None):
    if lista is None:
        lista = []
    lista.append(item)
    return lista
```

---

## 2 · Java: passagem por valor com objeto e primitivo

```java
static void zera(int[] v, int n) {
    v[0] = 0;
    n = 0;
}
int[] v = {5, 5}; int n = 5;
zera(v, n);
System.out.println(v[0] + " " + n);
```

**a) Saída**

```
0 5
```

**b) Por quê?**

Em Java **tudo é passado por valor**, mas o que é copiado depende do tipo:

- `n` é primitivo (`int`): a função recebe uma **cópia do número**. Fazer `n = 0` lá dentro só mexe na cópia, então no chamador `n` continua **5**.
- `v` é um array (objeto): a função recebe uma **cópia da referência**. As duas referências (a do chamador e a da função) apontam para o **mesmo array**, então `v[0] = 0` altera o objeto real e o chamador enxerga isso, ficando `v[0] = 0`.

Então o mesmo método altera o conteúdo do objeto, mas não consegue alterar o `int` de quem chamou. Como o Sebesta comenta, o objeto se comporta *na prática* como passagem por referência, embora o mecanismo seja por valor. Se a função fizesse `v = new int[]{...}`, o chamador não veria nada, porque só a cópia da referência mudaria.

---

## 3 · Python: lambdas em compreensão de lista

```python
fs = [lambda: i for i in range(3)]
print([f() for f in fs])
```

**a) Saída**

```
[2, 2, 2]
```

**b) Por quê?**

Cada `lambda` é um **fechamento**, e o fechamento captura a **variável `i`** (a célula de memória), e não uma cópia do valor que ela tinha na hora. Existe um único `i`, compartilhado pelas três lambdas.

O laço termina com `i = 2`. Só depois disso as lambdas são chamadas, e todas leem o `i` atual, que vale 2. É exatamente o mesmo problema do `var` no JavaScript que o slide 16 mostra (`[3, 3, 3]`), com a diferença de que aqui o último valor é 2 porque `range(3)` para em 2.

**Como corrigir:** forçar a captura do valor atual com um parâmetro padrão.

```python
fs = [lambda i=i: i for i in range(3)]   # [0, 1, 2]
```

---

## 4 · C: variável local `static`

```c
int contador(void) {
    static int n = 0;
    return ++n;
}
// em main:
contador(); contador();
printf("%d\n", contador());
```

**a) Saída**

```
3
```

**b) Por quê?**

O `static` muda a **extensão** da variável local: em vez de ficar na pilha e ser criada e destruída a cada chamada (variável dinâmica da pilha), `n` fica numa área de memória **estática**, inicializada **uma vez só** (o `= 0` não roda de novo) e que **mantém o valor entre as chamadas**.

- 1ª chamada: `n` vai de 0 para 1
- 2ª chamada: `n` vai de 1 para 2
- 3ª chamada: `n` vai de 2 para 3, e é esse valor que o `printf` imprime

Sem o `static` (`int n = 0;` comum), a saída seria `1`, porque cada chamada começaria do zero, como no `contador_automatico` do slide 9.

O custo do `static` é que a função deixa de ser reentrante e a recursão passa a compartilhar o mesmo `n`.

---

## 5 · Rust: posse e *move*

```rust
fn dobra(v: Vec<i32>) -> Vec<i32> {
    v.iter().map(|x| x * 2).collect()
}
let v = vec![1, 2, 3];
let d = dobra(v);
println!("{:?} {:?}", v, d);
```

**a) Saída**

**Não compila, então não existe saída.** O erro é o E0382 (*borrow of moved value: `v`*).

**b) Por quê?**

No Rust o padrão de passagem é a **posse (*ownership*)**, e não a cópia. Como `Vec<i32>` não é `Copy`, ao fazer `dobra(v)` a posse do vetor é **movida** para dentro da função. Quando `dobra` termina, o vetor original é liberado, e `v` na `main` deixa de ser válido.

Na linha do `println!`, o código tenta usar `v` depois do *move*, e o compilador barra isso em tempo de compilação. É o jeito do Rust evitar na raiz problemas de apelido e de uso de memória já liberada.

**Duas formas de corrigir:**

```rust
// 1) Emprestar em vez de mover (referência imutável)
fn dobra(v: &Vec<i32>) -> Vec<i32> {
    v.iter().map(|x| x * 2).collect()
}
let d = dobra(&v);
println!("{:?} {:?}", v, d);   // [1, 2, 3] [2, 4, 6]

// 2) Passar uma cópia explícita
let d = dobra(v.clone());
```

A opção 1 é a mais eficiente, porque não copia dado nenhum.

---

## 6 · Python: escopo e atribuição dentro da função

```python
total = 0
def adiciona(x):
    total = total + x
    return total
print(adiciona(5))
```

**a) Saída**

```
UnboundLocalError: cannot access local variable 'total' where it is not associated with a value
```

(a mensagem exata varia conforme a versão do Python, mas o erro é sempre `UnboundLocalError`)

**b) Por quê?**

O que pega aqui é que o Python decide o escopo de uma variável **antes de executar**, olhando o corpo da função. Como existe uma **atribuição** a `total` dentro de `adiciona` (`total = ...`), o Python trata `total` como **variável local** da função inteira, e não como a global.

Só que, na hora de calcular o lado direito (`total + x`), essa variável local ainda **não tem valor nenhum**. Resultado: `UnboundLocalError`. O `total = 0` lá de fora não entra na jogada.

**Como corrigir:**

```python
# a) declarar que é a global
def adiciona(x):
    global total
    total = total + x
    return total

# b) melhor: sem efeito colateral, recebendo e devolvendo o valor
def adiciona(total, x):
    return total + x
```

Uma observação: a tabela de síntese do slide 24 cita `nonlocal`, mas ele serve para variáveis de uma **função externa** (aninhada). Para uma variável do nível do módulo, como aqui, o certo é o `global`. A opção (b) é a preferível, porque evita o efeito colateral que o slide 8 recomenda evitar nas funções.
