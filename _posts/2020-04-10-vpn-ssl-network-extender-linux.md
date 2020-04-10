---
layout: post
title:  "VPN SSL extender no ubuntu 19.10"
date:   2020-04-10 00:00:00 +0000
categories: linux
---
Passo a passo para usar vpn corporativo CheckPoint no linux, testado no ubuntu 19.10.
Depois que instala o java `sudo apt-get install openjdk-8-jre-headless
`, `snx_install.sh` e o `cshell_install.sh` é preciso abrir a url `https://localhost:14186/id` para aceitar o certificado inválido da empresa.
Sem isso nada funciona. Uma vez que aceitou o certificado basta conectar pelo acesso que a empresa fornece e aceitar o dialog java que irá aparecer. 

