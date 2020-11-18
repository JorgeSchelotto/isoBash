Ejercicio shell scripting - T1
Se tiene un archivo con el listado de fiestas y festividades de la República Argentina (archivo adjunto fiestas-y-festivales.csv) con la siguiente Información:
En la primer fila se encuentra el encabezado con el título de las columnas (separados por ","). Por ejemplo:

agente_cultural_id,provincia_id,localidad_id,observaciones,provincia,localidad,nombre,direccion_descripcion,piso,codigo_postal,codigo,telefono,mail,web,latitud,longitud,tipo_latitud_longitud,actividad_especifica,denominacion_especifica,otro_domicilio,fuente,institucion_organizadora,actividades_culturales,mes,como_llegar,anio_de_inicio

Luego, cada fila del archivo contiene la lista de valores para cada columna también separados por coma (,).

Su script va recibir tres parámetros:

1.El nombre de una Provincia
2.Un número de fila (siempre mayor a 1, ya que en la primer fila tenemos el encabezado con el título de las columnas y menor a la cantidad total de lineas del archivo)
3.Un tipo de festividad (columna actividad_específica que no debe ser nulo)

Su script debe retornar:
-La cantidad de festividades en la provincia indicada en el primer parámetro (Cuidado con falsos positivos,en la columna provincia "Buenos Aires" no es igual a "Ciudad de Buenos Aires").
-El nombre de la festividad para la fila indicada en el segundo parámetro (el valor de la columna nombre).

- La cantidad de festividades de ese tipo (ignorando mayúsculas y minúsculas, ej. Festividad es lo mismo que FESTIVIDAD)

Recuerde que la primer fila de datos es la segunda del archivo (la primera es el encabezado con el nombre de columna)

Por ejemplo si recibo:
Salta 2 Festival

Debo imprimir:
254
Fiesta de las Colectividades
1135

Explicación:
Hay 254 festividades en la provincia de Salta.
El valor para la columna nombre en la primer fila de datos es "Fiesta de las Colectividades"
Existen 1135 festividades de tipo Festival en todo el archivo

Por ejemplo si recibo:
Buenos Aires 0

Debo imprimir:
"INVALID PARAMETERS"

Explicación: La primer fila debe ser siempre mayor a 0

Por ejemplo si recibo
"Santa Fé" 5900 Festival

Debo imprimir:
"INVALID PARAMETERS"

Explicación: La fila 5900 no existe en el archivo...

Es imperativo y OBLIGATORIO que su script retorne los valores en el orden indicado y como se detallo anteriormente.

No imprima cosas innecesarias por pantalla. En tal caso el resultado se considera inválido.

Debe validar la correctitud de los parámetros y si los mismos son inválidos su script simplemente debe imprimir en pantalla "INVALID PARAMETERS"(textual, no cambie el mensaje
de error) y finalizar el error con una condición de finalización como corresponde a todo proceso bash que finaliza con error.
