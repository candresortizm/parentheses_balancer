# README

Proyecto de rails API para conocer si un string tiene parèntesis balanceados.

* Ruby version: 3.0.2

Ejemplos:

"((:):)" # balanceado
"((:():)" # balanceado
"(:)" # balanceado
"(:))" # balanceado
"(:()" # balanceado
"hola(mundo:nuevo :))" # balanceado
"hola(mundo:)" # balanceado
"hola(mundo:nuevo))" # desbalanceado
"hola" # balanceado
"(hola)" # balanceado
"(()" # desbalanceado
"no voy (:()" # balanceado
"hoy pm: fiesta :):)" # balanceado
":((" # desbalanceado
"a (b (c (d) c) b) a :)" # balanceado

Para hacer uso del balanceador se debe hacer una peticiòn POST al endpoint: /api/v1/balancer/balance con un json que contenga la llave "text" cuayo valor es el texto a verificar, ejemplo de json:

      {"text":"hola:este es un ejemplo :)"}
      
la respuesta que se obtiene si es un consumo exitoso en un json con la siguiente estructura:

      {"message": "balanceado"}
