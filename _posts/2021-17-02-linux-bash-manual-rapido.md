---
layout: post
title: "Manual rápido Linux - Bash"
date:   2021-02-17 00:00:00 +0000
categories: linux
---
## Linux
Linux é o nome do kernel usados em vários sistemas operacionais de servidores, por exemplo, Ubuntu, Debian, Centos, etc. O sistema operacional nesse caso é composto do Linux mais os programas necessários para o servidor funcionar.

## Bash
Bash é o nome do programa interativo que o usuário usa para passar comandos para o sistema operacional. Para acessar o bash é preciso abrir um emulador de terminal.

![Terminal](/assets/img/terminal.png)

Com o terminal aberto o usuário está pronto para entrar comandos.

```
user@computer:~$
```
Em geral, em um terminal do Ubuntu por exemplo, será mostrado o nome do usuário, antes do `@` seguido do nome do computador, seguido por `:` e o nome do diretório atual. 

O símbolo `~` indica a pasta `home` do usuário. Quando se abre 
o terminal o diretório atual é a pasta `home`.

O símbolo `$` indica um usuário diferente do `root`, este é indicado pelo símbolo `#`.

## Comando
Um comando é uma instrução ao sistema operacional. Para executar um comando no terminal, depois que este está aberto, basta digitar o nome do programa e os argumentos necessários e por fim a tecla `Enter`. Por exemplo
```
user@computer:~$ ls
```
executará o comando `ls`, que lista os arquivos na pasta ou diretório corrente. 

Comandos podem ter opções específicas, iniciando com o caractere `-`. Por exemplo, para o comando `ls`, a opção `-a` mostra todos os arquivos, incluindo os ocultos.

```
user@computer:~$ ls -a
```

Comandos podem receber, além de opções, argumentos, separados por espaço em branco. Por exemplo, para listar outro diretório com o `ls`, podemos usar:

```
user@computer:~$ ls -a /tmp
```

Há comandos que ficam em loop e não terminam por conta própria. Para isso o usuário tem que matá-los apertando `Ctrl-c`.

Cada comando pode ter uma entrada, uma saída normal e uma saída de erro. Podemos conectar a saída de um comando como a entrada de outro com o caractere `|`, cujo nome é `pipe`. Por exemplo, para contar o número de arquivos e subdiretórios dentro de um diretório podemos conectar a saída do comando `ls` com a entrada do comando `wc -l`.

```
user@computer:~$ ls | wc -l
3136
````


## Árvore de diretórios
No Linux o diretório raiz é indicado por `/`. É como se todos os arquivos e diretórios estivessem dentro desse diretório raiz. Cada subdiretório é separado por outra `/`. O diretório `home` do usuário é indicado por `~`, que é expandido para `/home/user` se o nome do usuário é `user`.

Ao iniciar o terminal o diretório corrente é o `home` do usuário. Para mudar o diretório corrente é preciso usar o comando `cd`. Por exemplo:
```
user@computer:~$ cd /tmp
user@computer:/tmp$
```
Nesse exemplo, mudei o diretório corrente para o diretório `/tmp`. O terminal mostrou isso, mudando a linha de prompt.

O diretório corrente é indicado pelo caractere `.` (ponto final). Por exemplo, para mudar o diretório corrente para um diretório dentro do diretório atual com o nome `foo`, podemos fazer:
```
user@computer:~$ cd ./foo
user@computer:~/foo$
```
Não é obrigatório escrever o `.` antes de um subdiretório. Usando `cd foo` daria no mesmo.

## Comandos básicos

`ls` é usado para listar arquivos e diretórios.

`touch` é usado para criar um arquivo. Exemplo:
```
user@computer:~$ touch a.txt
```
Criará o arquivo `a.txt` dentro do diretório `home` do usuário.

`cat` é usado para mostrar no terminal o conteúdo de um ou mais arquivos. Por exemplo, para mostrar o conteúdo do arquivo `a.txt` basta fazer:
```
user@computer:~$ cat a.txt
```

`cp` é usado para copiar arquivos ou diretórios. Exemplos:

Para copiar um arquivo para outro diretório
```
user@computer:~$ cp a.txt /tmp/
```
Para copiar um arquivo com outro nome
```
user@computer:~$ cp a.txt b.txt
```
Para copiar um diretório e todos os seus arquivos usamos a opção `-R`, que significa recursivo. Por exemplo, para copiar o diretório `/foo` para `/bar` podemos fazer:
```
user@computer:~$ cp -R /foo /bar
```

O `mv` é usado para mover. Ao contrário do `cp` o arquivo original é apagado. Por exemplo, para renomear o arquivo `a.txt` para `b.txt` podemos fazer:
```
user@computer:~$ mv a.txt b.txt
```

`rm` é usado para remover arquivos ou diretórios. **CUIDADO !!!** No terminal não existe lixeira, depois que é removido o arquivo não é recuperável.
Para remover arquivos podemos fazer:
```
user@computer:~$ rm a.txt
```
Para remover um diretório inteiro e seus arquivos junto podemos usar a opção `-r` junto com `f` para não precisar confirmar a remoção de cada arquivo:
```
user@computer:~$ rm -rf ./foo
```

`ping` é usado para enviar um pacote de dados para outro servidor na rede. Se esse servidor responder dá pra dizer que ele está online. Ele aceita como argumento tanto endereços IP ou nomes. Esse comando fica executando até o usuário terminá-lo apertando `Ctrl-C`.

O `ping` tem muitas opções. Uma delas é passar o número de pacotes para enviar, com a opção `-c`. Nesse caso o comando termina sozinho.

```
user@computer:~$ ping google.com
user@computer:~$ ping 10.0.0.1
user@computer:~$ ping -c 1 10.0.1.1
```

`nohup` é usado para deixar um comando executando mesmo ao fechar o terminal.
Também deve-se usar o caractere `&` no fim da linha. Por exemplo:
```
user@computer:~$ nohup ping google.com &
```
Iniciará o comando `ping` e o jogará em segundo plano. Enquanto o comando estiver rodando é possível executar outros comandos ao mesmo tempo. Para matar o comando é preciso executar `fg`, que trás o comando que estiver em segundo plano para frente, e apertar `Ctrl-C`, para efetivamente terminar o comando de forma abrupta.

## Básico de Scripts Bash

Uma variável guarda um valor, que pode ser texto, número, etc. Para criar uma variável no bash usamos `=`. Por exemplo, para criar a variável `x` com o valor 1 usamos:
```
user@computer:~$ x=1
```
Importante: não pode haver espaços entre `=`. Para mostrar o valor de uma variável podemos usar `echo` e o caractere `$` junto ao nome da variável.
```
user@computer:~$ echo $x
1
```
Listas no bash são itens separados por espaço em branco (o que inclui quebra de linha). Por exemplo, para criar uma lista e mostrar cada item em uma nova linha podemos fazer:
```
user@computer:~$ x="a b c"
user@computer:~$ for i in $x; do
> echo $i
> done
a
b
c
```
Perceba que é preciso usar aspas duplas nesse caso e que o terminal insere o caractere `>` quando se aperta `Enter`.

Quando se precisa escrever um script mais elaborado é indicado usar um arquivo. Arquivos de script geralmente devem ter a terminação `.sh`. Por exemplo, um arquivo `a.sh` com o conteúdo abaixo:
```
#!/bin/bash
for i in 1 2 3 4 5; do
  echo "counter: $i"
done
```
A primeira linha chama-se `shebang` e é o que torna o arquivo um script. `for` indica que é um loop. Para executar esse script deve-se atribuir permissão de execução com o comando `chmod` primeiro:

```
user@computer:/~$ chmod +x a.sh
user@computer:/~$ ./a.sh
counter: 1
counter: 2
counter: 3
counter: 4
counter: 5
```
Como o script não está no `$PATH` é preciso usar `./` antes do nome. A variável `$PATH` é uma lista de diretórios. Se um programa ou script estiver em um desses diretórios não é necessário usar o caminho completo para executar o programa. Para ver o conteúdo dessa lista pode-se usar `ech o $PATH`.