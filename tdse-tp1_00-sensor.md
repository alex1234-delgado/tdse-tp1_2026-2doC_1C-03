# TP1 - Actividad 00 - Pasos 06 y 07

## Modelo Sensor - Un botón

### Eventos

El modelo Sensor representa el comportamiento de un único botón binario.
El botón posee dos posiciones posibles: **not pressed** y **pressed**.

Las posiciones del botón son los triggers (eventos) del modelo Sensor.

| Evento | Descripción |
|---|---|
| `EV_BTN_UP` | El botón se encuentra en la posición **not pressed** (no presionado). |
| `EV_BTN_DOWN` | El botón se encuentra en la posición **pressed** (presionado). |

### Acciones

Las acciones del modelo Sensor representan la detección de un cambio válido de posición del botón y permiten comunicar dicho cambio al modelo System.

| Acción | Descripción |
|---|---|
| `EV_SYS_BTN_DOWN` | Envía al modelo System el evento correspondiente a un cambio válido hacia la posición **pressed**. |
| `EV_SYS_BTN_UP` | Envía al modelo System el evento correspondiente a un cambio válido hacia la posición **not pressed**. |
| `DEL_BTN_DEBOUNCE` | Variable de control utilizada para implementar el antirrebote (*debouncing*) del pulsador. Se carga con el tiempo de antirrebote y se decrementa mediante `tick`. |

### Antirrebote del pulsador

El pulsador puede presentar **rebote mecánico**, produciendo múltiples fluctuaciones rápidas entre las posiciones `pressed` y `not pressed`.

Para evitar que estas fluctuaciones sean interpretadas como múltiples cambios de estado, se utiliza una variable de control para el antirrebote.

El módulo Sensor se ejecuta periódicamente mediante `tick`, con un período de **1 ms**. Ante la detección de un cambio de posición, se carga `DEL_BTN_DEBOUNCE` con el tiempo de antirrebote establecido, correspondiente a **50 ms**.

Durante cada ejecución del módulo, `tick` permite contabilizar el transcurso del tiempo mediante el decremento de `DEL_BTN_DEBOUNCE`. El nuevo estado se valida cuando finaliza el período de antirrebote, siempre que la posición del botón continúe siendo la correspondiente al cambio detectado.

De esta manera, los cambios producidos durante el período de rebote no generan eventos válidos hacia el modelo System.

### Convenciones de identificadores

- `EV_BTN_NAME`: evento correspondiente al botón.
- `EV_SYS_NAME`: señal/evento destinado al modelo System.
- `tick`: base de tiempo de ejecución del módulo, con período de 1 ms.
- `DEL_BTN_NAME`: variable/temporizador utilizado para controlar el antirrebote.

El modelo Sensor tiene como función **escrutar** el botón, detectar cambios de posición y comunicar al modelo System únicamente los cambios que hayan sido validados luego del tiempo de antirrebote.

## Paso 07

## Sensor Statechart - State Transition Table

El modelo Sensor para un único botón se encuentra compuesto por cuatro estados:

- `ST_BTN_UP`: botón en reposo, no presionado.
- `ST_BTN_FALLING`: se detectó el accionamiento del botón y se encuentra transcurriendo el tiempo de antirrebote.
- `ST_BTN_DOWN`: botón presionado y estado validado.
- `ST_BTN_RISING`: se detectó la liberación del botón y se encuentra transcurriendo el tiempo de antirrebote.

El módulo Sensor se ejecuta periódicamente mediante `tick`, con un período de **1 ms**. El tiempo de antirrebote establecido es de **50 ms**.

Durante los estados `ST_BTN_FALLING` y `ST_BTN_RISING` se utiliza `DEL_BTN_DEBOUNCE` para verificar que el cambio de posición del botón permanezca estable durante dicho período.

### Sensor Statechart - State transition table

| Current State | Event | [Guard] | Next State | Actions |
|---|---|---|---|---|
| `ST_BTN_UP` | `EV_BTN_UP` | — | `ST_BTN_UP` | — |
| `ST_BTN_UP` | `EV_BTN_DOWN` | — | `ST_BTN_FALLING` | `DEL_BTN_DEBOUNCE_50` |
| `ST_BTN_FALLING` | `tick` | `DEL_BTN_DEBOUNCE > 1` | `ST_BTN_FALLING` | `DEL_BTN_DEBOUNCE--` |
| `ST_BTN_FALLING` | `tick` | `DEL_BTN_DEBOUNCE == 1` | `ST_BTN_DOWN` | `DEL_BTN_DEBOUNCE = 0; EV_SYS_BTN_DOWN` |
| `ST_BTN_FALLING` | `EV_BTN_UP` | — | `ST_BTN_UP` | `DEL_BTN_DEBOUNCE = 0` |
| `ST_BTN_DOWN` | `EV_BTN_DOWN` | — | `ST_BTN_DOWN` | — |
| `ST_BTN_DOWN` | `EV_BTN_UP` | — | `ST_BTN_RISING` | `DEL_BTN_DEBOUNCE_50` |
| `ST_BTN_RISING` | `tick` | `DEL_BTN_DEBOUNCE > 1` | `ST_BTN_RISING` | `DEL_BTN_DEBOUNCE--` |
| `ST_BTN_RISING` | `tick` | `DEL_BTN_DEBOUNCE == 1` | `ST_BTN_UP` | `DEL_BTN_DEBOUNCE = 0; EV_SYS_BTN_UP` |
| `ST_BTN_RISING` | `EV_BTN_DOWN` | — | `ST_BTN_DOWN` | `DEL_BTN_DEBOUNCE = 0` |

### Descripción del funcionamiento

#### `ST_BTN_UP`

Es el estado estable correspondiente al botón no presionado.

Cuando se detecta `EV_BTN_DOWN`, se inicia el período de antirrebote cargando `DEL_BTN_DEBOUNCE_50` y se pasa a `ST_BTN_FALLING`.

#### `ST_BTN_FALLING`

Es el estado transitorio correspondiente al accionamiento del botón.

Mientras transcurre el período de antirrebote, el módulo se ejecuta cada **1 ms** mediante `tick` y decrementa `DEL_BTN_DEBOUNCE`.

Cuando `DEL_BTN_DEBOUNCE == 1`, el siguiente `tick` completa los 50 ms de antirrebote. Se valida entonces el cambio, se genera `EV_SYS_BTN_DOWN` y se pasa a `ST_BTN_DOWN`.

Si durante la espera aparece `EV_BTN_UP`, el cambio no se valida y se retorna a `ST_BTN_UP`.

#### `ST_BTN_DOWN`

Es el estado estable correspondiente al botón presionado.

Cuando se detecta `EV_BTN_UP`, se inicia nuevamente el período de antirrebote cargando `DEL_BTN_DEBOUNCE_50` y se pasa a `ST_BTN_RISING`.

#### `ST_BTN_RISING`

Es el estado transitorio correspondiente a la liberación del botón.

Mientras transcurre el período de antirrebote, el módulo se ejecuta cada **1 ms** mediante `tick` y decrementa `DEL_BTN_DEBOUNCE`.

Cuando `DEL_BTN_DEBOUNCE == 1`, el siguiente `tick` completa los 50 ms de antirrebote. Se valida entonces la liberación, se genera `EV_SYS_BTN_UP` y se retorna a `ST_BTN_UP`.

Si durante la espera vuelve a detectarse `EV_BTN_DOWN`, la liberación no se valida y se retorna a `ST_BTN_DOWN`.

### Consideración sobre el `tick`

El `tick` posee un período de **1 ms** y constituye la base temporal para implementar el antirrebote de **50 ms**.

Por lo tanto, el modelo no utiliza una espera bloqueante de 50 ms, sino que contabiliza el tiempo mediante la ejecución periódica del módulo.

El objetivo es evitar que las fluctuaciones de alta frecuencia producidas por el rebote mecánico del pulsador sean interpretadas como cambios válidos de estado.
