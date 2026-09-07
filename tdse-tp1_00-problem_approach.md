# TP1 – Actividad 00 – Problem approach

## 1. Descripción de la solución de COMA Electronics

La solución de referencia corresponde al **Intelligent Parking Management System** de COMA Electronics, un sistema destinado a la gestión automatizada de estacionamientos.

La solución completa está compuesta por diferentes elementos:

* **Parking System Server:** servidor central encargado de la gestión del sistema.
* **Entry Machine:** máquina ubicada en el ingreso del estacionamiento.
* **Exit Machine:** máquina ubicada en el egreso del estacionamiento.
* **Toll Computer y/o Automatic Pay Station:** computadora de cobro y/o estación automática de pago.

Para el presente proyecto de Taller de Sistemas Embebidos se selecciona específicamente la:

**Parking Ticket Dispenser Machine (Entry)**

Esta máquina constituye el sistema de entrada del estacionamiento y permite gestionar el acceso de los vehículos.

El funcionamiento general puede representarse conceptualmente como:

```
Vehículo llega
      ↓
Detección del vehículo
      ↓
Solicitud de ingreso
      ↓
Generación / entrega del ticket
      ↓
Apertura de la barrera
      ↓
Ingreso del vehículo
      ↓
Detección del paso del vehículo
      ↓
Cierre de la barrera
```

---

## 2. Descripción de la implementación de Parking Ticket Dispenser Machine (Entry)

La implementación propuesta consiste en desarrollar una versión simplificada de la **Parking Ticket Dispenser Machine (Entry)** utilizando un sistema embebido.

El comportamiento se divide en tres módulos principales:

```
                 PARKING TICKET DISPENSER
                         (ENTRY)
                              |
             +----------------+----------------+
             |                |                |
          SENSORS           SYSTEM         ACTUATORS
             |                |                |
          Escrutar          Procesar         Actuar
```

### 2.1. Módulo Sensors

El módulo **Sensors** se encarga de escrutar las entradas digitales del sistema y detectar los cambios producidos en los sensores.

Los sensores considerados en la solución son:

* **Camera**
* **Button**
* **Sensor Coil**

El módulo Sensors debe ejecutarse periódicamente mediante una tarea temporizada con un período de **1 ms**.

Su función principal es detectar los eventos producidos por los sensores y comunicar dichos eventos al módulo System.

---

### 2.2. Módulo System

El módulo **System** representa la lógica de control de la máquina de entrada.

Su función es procesar los eventos recibidos desde Sensors y determinar las acciones que deben realizarse sobre los actuadores.

Entre las acciones posibles se encuentran:

* gestionar la solicitud de ingreso;
* gestionar la entrega del ticket;
* controlar el estado de la barrera;
* controlar las indicaciones del sistema;
* coordinar el funcionamiento de los diferentes elementos.

El módulo System también debe ejecutarse periódicamente mediante una tarea temporizada de **1 ms**.

La comunicación entre los módulos se realiza mediante **mensajes/eventos**.

---

### 2.3. Módulo Actuator

El módulo **Actuator** se encarga de actuar sobre las salidas del sistema de acuerdo con las órdenes generadas por System.

Los actuadores reales considerados son:

* **Display**
* **Printer**
* **Barrier**
* **Server**

El módulo Actuator también debe ejecutarse mediante una tarea temporizada con un período de **1 ms**.

Su función consiste en transformar las órdenes provenientes del sistema en acciones sobre las salidas correspondientes.

---

## 3. Arquitectura modular

La aplicación se organiza siguiendo la estructura:

```
ESCRUTAR → PROCESAR → ACTUAR
   |           |          |
 Sensors     System     Actuator
```

El módulo **Sensors** obtiene información de las entradas.

El módulo **System** procesa esa información y determina qué debe hacer el sistema.

El módulo **Actuator** ejecuta las acciones correspondientes sobre las salidas.

Los módulos se comunican y sincronizan mediante **mensajes/eventos**.

Cada módulo funciona como una tarea independiente y temporizada, con un período de actualización de **1 ms**.

---

## 4. Modelos de comportamiento

Para describir el comportamiento de la implementación se utilizarán tres modelos de máquina de estados:

### Sensor Statechart

Representa el comportamiento del módulo **Sensors**.

Su función es escrutar las entradas digitales, detectar cambios de estado y generar los eventos correspondientes para el módulo System.

### System Statechart

Representa el comportamiento del módulo **System**.

Su función es procesar los eventos provenientes de Sensors y determinar las acciones necesarias para controlar el sistema.

### Actuator Statechart

Representa el comportamiento del módulo **Actuator**.

Su función es recibir las órdenes generadas por System y controlar las salidas correspondientes.

La estructura general es:

```
             +----------------+
             |     SENSORS    |
             |    Statechart  |
             +-------+--------+
                     |
                 Eventos
                     ↓
             +----------------+
             |     SYSTEM     |
             |    Statechart  |
             +-------+--------+
                     |
                 Acciones
                     ↓
             +----------------+
             |    ACTUATOR    |
             |    Statechart  |
             +----------------+
```

---

## 5. Sustitución de sensores y actuadores para el prototipo

Para facilitar la implementación del MVP, los sensores y actuadores reales pueden ser reemplazados por elementos simples de entrada y salida digital.

### Sensores

| Elemento real | Sustituto para el prototipo |
| ------------- | --------------------------- |
| Camera        | Llave ON/OFF                |
| Button        | Pulsador                    |
| Sensor Coil   | Llave ON/OFF                |

### Actuadores

| Elemento real | Sustituto para el prototipo |
| ------------- | --------------------------- |
| Display       | LED                         |
| Printer       | LED                         |
| Barrier       | LED                         |
| Server        | LED                         |

De esta manera, es posible desarrollar y verificar la lógica de funcionamiento del sistema sin disponer de los dispositivos comerciales reales.

---

## 6. Requisitos de ejecución

Los módulos deben implementarse como tareas temporizadas con un período de **1 ms**.

La ejecución debe ser:

* cíclica;
* periódica;
* no bloqueante;
* cooperativa.

Ningún módulo debe apropiarse de la CPU durante un tiempo prolongado.

Por lo tanto, no se deben utilizar esperas bloqueantes que impidan la ejecución de los demás módulos.

El funcionamiento general debe seguir:

```
Cada 1 ms:

    Sensors
       ↓
    escrutar entradas
       ↓
    generar eventos
       ↓
    System
       ↓
    procesar eventos
       ↓
    generar acciones
       ↓
    Actuator
       ↓
    actualizar salidas
```
