---
layout: post
title:  "git fetch não busca todos os branches"
date:   2019-06-07 00:00:00 +0000
categories: git
---
Para buscar branches remotos no git e sincronizar com um branch local geralmente fazemos um `git fetch`. Para ver os branches remotos disponíveis podemos fazer um `git branch -va`. O problema acontece quando o branch 
remoto não aparece no resultado mas você sabe que ele existe.

Execute o comando `git config --get remote.origin.fetch`. No meu caso o resultado foi `+refs/heads/master:refs/remotes/origin/master`. Isso quer dizer que o repositório local está configurado para 'trackear' somente o `master`. Se executar `git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"` configuramos corretamente o remoto para sincronizar com tudo no remoto por causa dos *wildcards*.

Esse problema aconteceu porque clonei o repositório com o Eclipse 2019.03.

