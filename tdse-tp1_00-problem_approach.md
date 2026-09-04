DESCRIPCIÓN DE LA SOLUCIÓN DE COMA ELECTRONICS
Referencia: 3.1.- TA134 - TdSE - 1er Proyecto
Intelligent Parking Management System - Automated Parking System
Parking Ticket Dispenser Machine (Entry)

1. ¿QUÉ ES LA SOLUCIÓN DE COMA ELECTRONICS?

La solución propuesta por COMA Electronics es un sistema integral de gestión inteligente de estacionamientos (Intelligent Parking Management System).

La arquitectura general contempla cuatro elementos principales:

- Parking System Server → servidor central del sistema.
- Entry Machine → máquina ubicada en la entrada.
- Exit Machine → máquina ubicada en la salida.
- Toll Computer y/o Automatic Pay Station → computadora de cobro y/o estación de pago automático.

Dentro de las distintas alternativas de máquinas de entrada que ofrece COMA, el proyecto de TdSE toma específicamente como referencia la Parking Ticket Dispenser Machine (Entry), es decir, la máquina ubicada en la entrada que entrega el ticket al vehículo.

2. ¿QUÉ HACE LA MÁQUINA DE ENTRADA?

Conceptualmente, la Parking Ticket Dispenser Machine controla el acceso de un vehículo al estacionamiento.

Su funcionamiento puede entenderse como una secuencia:

Vehículo llega → detección → solicitud de ticket → entrega/validación del ticket → apertura de barrera → ingreso del vehículo → cierre de barrera.

El documento plantea que esta parte del sistema debe ser modelada y desarrollada como un sistema embebido, separando el comportamiento en tres grandes grupos:

SENSORES

Son las entradas que permiten conocer qué está sucediendo en el sistema.

Por ejemplo:
- Camera
- Button
- Sensor coil

El proyecto contempla que, si no se dispone de los sensores reales, puedan ser reemplazados por dispositivos simples de entrada digital:

- Camera → llave ON/OFF
- Button → pulsador
- Sensor coil → llave ON/OFF

SISTEMA

Es la parte lógica que recibe la información de los sensores, procesa los eventos y determina qué acción debe realizarse.

La consigna propone una estructura de aplicación modular, resumida como:

Escrutar → Procesar → Actuar

Los distintos módulos deben comunicarse y sincronizarse mediante mensajes.

ACTUADORES

Son los elementos que producen una acción física.

El ejemplo principal es:

- Barrier → barrera de acceso.

Para el prototipo, si no se dispone del actuador real, la barrera puede representarse mediante un LED.

3. ¿CÓMO SE LLEVA COMA ELECTRONICS AL PROYECTO DE TdSE?

La idea no es copiar toda la solución comercial de COMA, sino tomar una parte de ella y construir un Producto Mínimo Viable (MVP).

El documento indica que se debe elegir una parte del sistema para implementarla y utilizarla para:

- editar el modelo de comportamiento;
- verificarlo;
- validarlo;
- codificarlo;
- depurarlo.

Luego, cada módulo desarrollado se integra progresivamente en la primera versión de la aplicación mediante un SDK.

Por lo tanto, el proyecto queda conceptualmente así:

PARKING SYSTEM
        |
   +----+----+
   |         |
ENTRADA    SALIDA
   |
   v
Parking Ticket
Dispenser Machine
   |
   +-- Sensores
   |    +-- Camera
   |    +-- Button
   |    +-- Sensor coil
   |
   +-- Sistema
   |    +-- Lógica de control
   |
   +-- Actuadores
        +-- Barrier

4. UNA CUESTIÓN MUY IMPORTANTE: EL COMPORTAMIENTO DEBE SER NO BLOQUEANTE

Este es uno de los puntos fundamentales de la consigna.

El sistema debe ejecutar sus tareas cíclicamente cada 1 ms, pero las tareas deben ser no bloqueantes. El documento indica que ningún módulo debe apropiarse de la CPU y que el código bloqueante es inaceptable.

Esto significa que no conviene implementar algo del estilo:

esperar vehículo
    ↓
esperar botón
    ↓
esperar ticket
    ↓
abrir barrera
    ↓
esperar vehículo

con esperas que detengan al procesador.

La idea es más bien:

Cada 1 ms:

    Sensor → leer estado
       ↓
    Sistema → procesar evento
       ↓
    Actuador → actualizar salida
       ↓
    siguiente módulo

Así, todos los módulos tienen oportunidad de ejecutarse y el sistema mantiene un comportamiento cooperativo.

5. ¿CUÁL ES ENTONCES LA SOLUCIÓN QUE PROPONE EL PROYECTO?

Podemos resumirla de esta manera:

COMA Electronics aporta el modelo de referencia comercial de un sistema automatizado de estacionamiento.

TdSE toma solamente la máquina de entrada, la Parking Ticket Dispenser Machine, y la transforma en un prototipo de sistema embebido.

El estudiante debe construir una versión funcional basada en:

Entradas → procesamiento → salidas

donde:

Bloque                  Referencia COMA              Prototipo TdSE
---------------------------------------------------------------------------
Detección vehículo      Camera / Sensor coil        Llave ON/OFF
Solicitud               Button                      Pulsador
Control                 Sistema                     Software embebido
Barrera                 Barrier                     LED
Ejecución               Controlador                 Tareas cada 1 ms
Comunicación            Módulos                     Mensajes
Objetivo                Sistema comercial           MVP funcional

Esto coincide con el enfoque general del proyecto: desarrollar una solución funcional y lo más simple posible, con la documentación y metodología correspondientes.

EN UNA FRASE

La solución de COMA Electronics que sirve de referencia es un sistema automatizado de gestión de estacionamientos, y el proyecto de TdSE implementa como MVP la máquina de entrada que detecta el vehículo, recibe la solicitud, gestiona el ticket y controla la barrera mediante una arquitectura modular de sensores, sistema y actuadores.
