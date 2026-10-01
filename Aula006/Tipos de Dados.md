Exercício - Qual é a saída? O problema é detectado na compilação, na execução ou nunca?

## 1 - JavaScript

console.log(0.1 * 3 === 0.3);

console.log(9007199254740993);

Resposta:

false
9007199254740992

Problema: Nunca ocorre perda de precisão.

## 2 - Python 

p = "maçã"

print(len(p), len(p.encode()))

Resposta:

4 5

Problema: Nunca.

## 3 - Go

var b byte = 255

b++

fmt.Println(b)

Resposta: Não há saída.

Problema: Compilação, ocorre overflow.

## 4 — Java

int[] v = new int[3];

System.out.println(v[0]);

System.out.println(v[3]);

Resposta:

0
ArrayIndexOutOfBoundsException

Problema: Execução, o índice 3 está fora do limite do array.

## 5 — Rust

let s = String::from("oi");

let t = s;

println!("{} {}", s, t);

Resposta: Não há saída.

Problema: Compilação, "s" foi movida para "t" e não pode mais ser utilizada.

## 6 — C

union { int i; float f; } u;

u.f = 1.0f;

printf("%d\n", u.i);

Resposta: O valor depende da implementação e não é portável.

Problema: Nunca, não necessariamente é detectado como erro.