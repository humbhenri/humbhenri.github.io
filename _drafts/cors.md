---
layout: post
title: "Entendendo de uma vez por todas o tal do 'Cors'"
tags: [html, cors, http]
---

# O que é o CORS

CORS, ou Cross-Origin Resource Sharing, é um mecanismo em que os **browsers**, através de cabeçalhos HTTP específicos, 
conseguem acessar determinados recursos de um domínio diferente do seu domínio de origem. 
Por exemplo, um código javascript do domínio _A_ acessando uma api hospedada no domínio _B_, se executado em um browser, 
não conseguirá completar a requisição a não ser que o servidor do domínio _B_ permita o acesso a partir do domínio _A_.

# Requisições preflight

São requisições do tipo **OPTIONS** para o recurso no outro domínio a fim de determinar se é seguro enviar a requisição.
Quando a requisição preflight completar a requisição real é enviada. O cliente envia na requisição os cabeçalhos corretos de 
acordo com a especifiação:
* **Origin** - Indica a origem da requisição, isto é, o nome do domínio de origem, pode ser **null** ou uma **URI**.
* **Access-Control-Request-Method** - diz ao servidor qual método HTTP será usado.
* **Access-Control-Request-Headers** - indica os cabeçalhos que serão utilizados, pode ser mais de um desde que separado por vírgula.

Em resposta o cliente recebe nos cabeçalhos qual a origem, ou origens, permitida no valor do cabeçalho **Access-Control-Allow-Origin**.
O cabeçalho **Access-Control-Expose-Headers** informa quais os cabeçalhos HTTP são permitidos. Já o cabeçalho **Access-Control-Allow-Methods** informa quais os métodos permitidos.

# Quando o CORS não acontece

Para que uma requisição não seja obrigada a enviar um CORS preflight ela precisa ter as seguintes condições:
* Só pode usar um dos métodos **GET**, **HEAD** ou **POST**
* Não ter nenhum header além dos definidos pela [especificação](https://fetch.spec.whatwg.org/#cors-safelisted-request-header) como seguros: Accept, Accept-Language, Content-Languague, DPR, Downlink, Save-Data, Viewport-Width, Width e [todos os pré-definidos pelos browsers](https://fetch.spec.whatwg.org/#forbidden-header-name), como Accept-Charset, Connection, etc.

* Content-Type só pode ter os valores **application/x-www-form-urlencoded**, **multipart/form-data** e **text/plain**
* A propriedade **upload** do **XMLHttpRequest** não pode ter event listeners registrados
* A requisição não pode fazer uso do **ReadableStream**

# Quando o CORS acontece

* Uso de **XMLHttpRequest** ou **Fetch** entre domínios diferentes.
* Web Fonts (@font-face no CSS)
* Texturas WebGL
* Imagens ou vídeo desenhados em um canvas

# O que posso fazer para evitar problemas de CORS

De preferência, se possível, realizar requisições de recursos dentro do mesmo domínio. Ao tentar utilizar um recurso 
em um domínio diferente tentar usar requisições simples, aquelas que são seguras como as do tipo **GET** e que não utilizem 
cabeçalhos inseguros, de modo que ela não seja barrada 
se o servidor do outro domínio não permitir compartilhamento de recurso de outros domínios.

Ao desenvolver uma API para ser utilizada por terceiros deve-se permitir o compartilhamento de recursos entre origens diferentes 
configurando o servidor para isso. Em geral, para uma requisição do tipo **OPTIONS**, o servidor deve enviar os cabeçalhos 
habilitando o **CORS** na resposta.

# Referências
* [https://www.freecodecamp.org/news/the-story-of-requesting-twice-cors/](https://www.freecodecamp.org/news/the-story-of-requesting-twice-cors/)
* [https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS)
