# TP1 - Actividad 00 - Paso 10 y 11

## Modelo Actuator - Dos leds

### Eventos

El modelo Actuator recibe mensajes provenientes del modelo System.

Para representar la barrera mediante dos LEDs, se consideran los
siguientes eventos:

| Evento | Descripción |
| :----- | :---------- |
| `EV_ACT_OPEN_BARRIER` | Indica que el System solicita abrir la barrera. |
| `EV_ACT_CLOSE_BARRIER` | Indica que el System solicita cerrar la barrera. |
| `tick` | Evento periódico utilizado para actualizar los tiempos de la transición y el titileo de los LEDs. |

### Acciones

Las acciones del modelo Actuator representan las operaciones realizadas
sobre los dos LEDs que representan la barrera.

| Acción | Descripción |
| :----- | :---------- |
| `LED1_ON` | Enciende el LED 1. |
| `LED1_OFF` | Apaga el LED 1. |
| `LED2_ON` | Enciende el LED 2. |
| `LED2_OFF` | Apaga el LED 2. |
| `LED1_TOGGLE` | Invierte el estado del LED 1. |
| `LED2_TOGGLE` | Invierte el estado del LED 2. |

Durante el estado transitorio, los dos LEDs titilan de forma
asincrónica mediante diferentes tiempos de actualización.

Se consideran las siguientes variables de control:

| Variable | Descripción |
| :------- | :---------- |
| `DEL_ACT_TRANSITION` | Tiempo restante de la transición de la barrera. |
| `DEL_LED1_BLINK` | Tiempo restante para cambiar el estado del LED 1. |
| `DEL_LED2_BLINK` | Tiempo restante para cambiar el estado del LED 2. |

Para la transición de la barrera se considera un tiempo de 1 s.
El LED 1 cambia de estado cada 100 mS y el LED 2 cambia de estado cada
137 mS, produciendo un titileo asincrónico.

La ejecución del módulo es cíclica y no bloqueante, con un período de 1 mS.


## Estados y Excitaciones

| Current State | Event | [Guard] | Next State | Actions |
| :------------ | :---- | :------ | :--------- | :------ |
| `ST_ACT_OFF` | `EV_ACT_OPEN_BARRIER` | — | `ST_ACT_TRANSITION_OPEN` | `LED1_OFF; LED2_OFF; DEL_ACT_TRANSITION = 1000; DEL_LED1_BLINK = 100; DEL_LED2_BLINK = 137` |
| `ST_ACT_OFF` | `EV_ACT_CLOSE_BARRIER` | — | `ST_ACT_OFF` | `LED1_OFF; LED2_OFF` |
| `ST_ACT_TRANSITION_OPEN` | `tick` | `DEL_ACT_TRANSITION > 1` | `ST_ACT_TRANSITION_OPEN` | `DEL_ACT_TRANSITION--; DEL_LED1_BLINK--; DEL_LED2_BLINK--` |
| `ST_ACT_TRANSITION_OPEN` | `tick` | `DEL_LED1_BLINK == 1` | `ST_ACT_TRANSITION_OPEN` | `LED1_TOGGLE; DEL_LED1_BLINK = 100` |
| `ST_ACT_TRANSITION_OPEN` | `tick` | `DEL_LED2_BLINK == 1` | `ST_ACT_TRANSITION_OPEN` | `LED2_TOGGLE; DEL_LED2_BLINK = 137` |
| `ST_ACT_TRANSITION_OPEN` | `tick` | `DEL_ACT_TRANSITION == 1` | `ST_ACT_ON` | `LED1_ON; LED2_ON; DEL_ACT_TRANSITION = 0` |
| `ST_ACT_ON` | `EV_ACT_CLOSE_BARRIER` | — | `ST_ACT_TRANSITION_CLOSE` | `DEL_ACT_TRANSITION = 1000; DEL_LED1_BLINK = 100; DEL_LED2_BLINK = 137` |
| `ST_ACT_ON` | `EV_ACT_OPEN_BARRIER` | — | `ST_ACT_ON` | `LED1_ON; LED2_ON` |
| `ST_ACT_TRANSITION_CLOSE` | `tick` | `DEL_ACT_TRANSITION > 1` | `ST_ACT_TRANSITION_CLOSE` | `DEL_ACT_TRANSITION--; DEL_LED1_BLINK--; DEL_LED2_BLINK--` |
| `ST_ACT_TRANSITION_CLOSE` | `tick` | `DEL_LED1_BLINK == 1` | `ST_ACT_TRANSITION_CLOSE` | `LED1_TOGGLE; DEL_LED1_BLINK = 100` |
| `ST_ACT_TRANSITION_CLOSE` | `tick` | `DEL_LED2_BLINK == 1` | `ST_ACT_TRANSITION_CLOSE` | `LED2_TOGGLE; DEL_LED2_BLINK = 137` |
| `ST_ACT_TRANSITION_CLOSE` | `tick` | `DEL_ACT_TRANSITION == 1` | `ST_ACT_OFF` | `LED1_OFF; LED2_OFF; DEL_ACT_TRANSITION = 0` |
