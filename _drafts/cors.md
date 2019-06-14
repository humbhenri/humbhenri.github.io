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

# Preflight requests

# Quando o CORS não acontece

Para que uma requisição não seja obrigada a enviar um CORS preflight ela precisa ter as seguintes condições:
* Só pode usar um dos métodos **GET**, **HEAD** ou **POST**
* Não ter nenhum header além dos definidos pela [especificação](https://fetch.spec.whatwg.org/#cors-safelisted-request-header) como seguros: Accept, Accept-Language, Content-Languague, DPR, Downlink, Save-Data, Viewport-Width, Width e [todos os pré-definidos pelos browsers](https://fetch.spec.whatwg.org/#forbidden-header-name), como Accept-Charset, Connection, etc.

* Content-Type só pode ter os valores **application/x-www-form-urlencoded**, **multipart/form-data** e **text/plain**
* A propriedade **upload** do **XMLHttpRequest** não pode ter event listeners registrados
* A requisição não pode fazer uso do **ReadableStream**


# Quando o CORS acontece
* Uso de **XMLHttpRequest** ou **Fetch* entre domínios diferentes.
* Web Fonts (@font-face no CSS)
* Texturas WebGL
* Imagens ou vídeo desenhados em um canvas

# O que posso fazer para evitar problemas de CORS

# Referências
* [https://www.freecodecamp.org/news/the-story-of-requesting-twice-cors/](https://www.freecodecamp.org/news/the-story-of-requesting-twice-cors/)
* [https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS)
