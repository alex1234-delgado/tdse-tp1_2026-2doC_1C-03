# TP1 - Actividad 00 - Paso 08

## Modelo System - Un sistema

### Eventos

Los eventos del modelo System corresponden a mensajes provenientes del
modelo Sensor.

Para el caso de un único botón se consideran los siguientes eventos:

| Evento | Descripción |
| :----- | :---------- |
| `EV_SYS_BTN_PRESSED` | Indica que el Sensor detectó y validó que el botón fue presionado. |
| `EV_SYS_BTN_NOT_PRESSED` | Indica que el Sensor detectó y validó que el botón fue liberado. |

### Acciones

Las acciones del modelo System corresponden a órdenes destinadas a los
modelos Actuator mediante señales/mensajes.

| Acción | Descripción |
| :----- | :---------- |
| `EV_ACT_WELCOME` | Envía al Display la indicación de bienvenida al vehículo. |
| `EV_ACT_PRINT_TICKET` | Envía al Printer la orden de imprimir el ticket. |
| `EV_ACT_OPEN_BARRIER` | Envía al Barrier la orden de abrir la barrera. |
| `EV_ACT_CLOSE_BARRIER` | Envía al Barrier la orden de cerrar la barrera. |

El modelo System procesa los eventos provenientes del Sensor y, de acuerdo
con el estado del sistema, genera las acciones correspondientes sobre los
actuadores.

La implementación se ejecuta mediante un módulo de código C temporizado
(Update by Time Code), con un período de 1 mS.

## TABLA DE ESTADOS Y EXCITACIONES DE SYSTEM 

| Current State            | Event                | [Guard] | Next State               | Actions                                    |
| :----------------------- | :------------------- | :------ | :----------------------- | :----------------------------------------- |
| `ST_SYS_IDLE`            | `EV_SYS_CAR_ARRIVES` | —       | `ST_SYS_WAIT_BUTTON`     | `EV_ACT_WELCOME`                           |
| `ST_SYS_WAIT_BUTTON`     | `EV_SYS_BTN_PRESSED` | —       | `ST_SYS_WAIT_CAR_LEAVES` | `EV_ACT_PRINT_TICKET; EV_ACT_OPEN_BARRIER` |
| `ST_SYS_WAIT_CAR_LEAVES` | `EV_SYS_CAR_LEAVES`  | —       | `ST_SYS_CAR_INSIDE`      | `EV_ACT_CLOSE_BARRIER; EV_ACT_CAR_INSIDE`  |
| `ST_SYS_CAR_INSIDE`      | —                    | —       | `ST_SYS_CAR_INSIDE`      | —                                          |

