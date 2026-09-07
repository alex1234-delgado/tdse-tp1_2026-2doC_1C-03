# TP1 - Actividad 00 - Pasos 06 y 07

## Modelo Sensor - Un botón

### Eventos

El modelo Sensor representa el comportamiento de un único botón binario. El botón posee dos posiciones posibles: **not pressed** y **pressed**.

Las posiciones del botón son los triggers (eventos) del modelo Sensor.

| Evento               | Descripción                                                           |
| -------------------- | --------------------------------------------------------------------- |
| `EV_BTN_NOT_PRESSED` | El botón se encuentra en la posición **not pressed** (no presionado). |
| `EV_BTN_PRESSED`     | El botón se encuentra en la posición **pressed** (presionado).        |

### Acciones

Las acciones del modelo Sensor representan la detección de un cambio de posición del botón y permiten comunicar dicho cambio al modelo System.

| Acción                   | Descripción                                                                                                                                                                        |
| ------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `EV_SYS_BTN_PRESSED`     | Envía al modelo System el evento correspondiente a un cambio válido hacia la posición **pressed**.                                                                                 |
| `EV_SYS_BTN_NOT_PRESSED` | Envía al modelo System el evento correspondiente a un cambio válido hacia la posición **not pressed**.                                                                             |
| `DEL_BTN_DEBOUNCE`       | Temporizador utilizado para implementar el antirrebote (*debouncing*) del pulsador. Se inicia ante un cambio de posición y permite esperar 50 ms antes de validar el nuevo estado. |

### Antirrebote del pulsador

El pulsador puede presentar **rebote mecánico**, produciendo múltiples fluctuaciones rápidas entre las posiciones `pressed` y `not pressed`.

Para evitar que estas fluctuaciones sean interpretadas como múltiples cambios de estado, se utiliza un temporizador de antirrebote.

El módulo Sensor se ejecuta periódicamente mediante `tick`, con un período de **1 ms**. Ante la detección de un cambio de posición, se inicia el temporizador `DEL_BTN_DEBOUNCE`. El nuevo estado se valida una vez transcurridos **50 ms**, siempre que la posición del botón continúe siendo la misma.

De esta manera, los cambios producidos durante el período de rebote no generan eventos válidos hacia el modelo System.

### Convenciones de identificadores

* `EV_BTN_NAME`: evento correspondiente al botón.
* `EV_SYS_NAME`: señal/evento destinado al modelo System.
* `tick`: base de tiempo de ejecución del módulo, con período de 1 ms.
* `DEL_BTN_NAME`: variable/temporizador utilizado para controlar el antirrebote.

El modelo Sensor tiene como función **escrutar** el botón, detectar cambios de posición y comunicar al modelo System únicamente los cambios que hayan sido validados luego del tiempo de antirrebote.

## Paso 07

## Sensor Statechart - State transition table

El modelo Sensor para un único botón se encuentra compuesto por cuatro estados:

* `button_up`: botón en reposo, no presionado.
* `button_falling`: se detectó el accionamiento del botón y se encuentra transcurriendo el tiempo de antirrebote.
* `button_down`: botón presionado y estado validado.
* `button_rising`: se detectó la liberación del botón y se encuentra transcurriendo el tiempo de antirrebote.

El módulo Sensor se ejecuta periódicamente mediante `tick`, con un período de **1 ms**. El tiempo de antirrebote establecido es de **50 ms**. Durante los estados `button_falling` y `button_rising` se utiliza el temporizador para verificar que el cambio de posición del botón permanezca estable durante dicho período.

### Sensor Statechart - State transition table

| Current State    | Event                | [Guard]                     | Next State       | Actions                        |
| ---------------- | -------------------- | --------------------------- | ---------------- | ------------------------------ |
| `ST_BTN_UP`      | `EV_BTN_UP`          |    X                        | --               |  --                            |
| `ST_BTN_UP`      | `EV_BTN_DOWN`        |    X                        | `ST_BTN_FALLING` | `tick = DEL_BTN_50MS`          |
| `ST_BTN_FALLING` |    X                 | `tick > 0`                  | --               | `tick--`                       |
| `ST_BTN_FALLING` | `EV_BTN_UP`          | `tick == 0`                 | `ST_BTN_UP`      |  --                            |
| `ST_BTN_FALLING` | `tick`               | `tick == 0`                 | `ST_BTN_DOWN`    | `EV_SYS_DOWN`                  |


### Descripción del funcionamiento

#### `button_up`

Es el estado estable correspondiente al botón no presionado.

Cuando se detecta `EV_BTN_PRESSED`, se inicia el temporizador de antirrebote mediante `DEL_BTN_DEBOUNCE = 0` y se pasa a `button_falling`.

#### `button_falling`

Es el estado transitorio correspondiente al accionamiento del botón.

Mientras el botón permanezca en `pressed`, se espera que transcurran **50 ms**. Como el módulo se ejecuta cada 1 ms, el temporizador permite contabilizar dicho período sin bloquear la ejecución.

Una vez cumplidos los 50 ms, el cambio se considera válido, se genera `EV_SYS_BTN_PRESSED` y se pasa a `button_down`.

Si durante la espera aparece `EV_BTN_NOT_PRESSED`, el cambio se considera rebote y se retorna a `button_up`.

#### `button_down`

Es el estado estable correspondiente al botón presionado.

Cuando se detecta `EV_BTN_NOT_PRESSED`, se inicia nuevamente el temporizador y se pasa a `button_rising`.

#### `button_rising`

Es el estado transitorio correspondiente a la liberación del botón.

Mientras el botón permanezca en `not pressed`, se espera durante **50 ms**. Una vez cumplido este tiempo, se valida la liberación, se genera `EV_SYS_BTN_NOT_PRESSED` y se retorna a `button_up`.

Si durante la espera vuelve a detectarse `EV_BTN_PRESSED`, se considera que se trató de un rebote y se retorna a `button_down`.

### Consideración sobre el `tick`

El `tick` posee un período de **1 ms** y constituye la base temporal para implementar el antirrebote de 50 ms. Por lo tanto, el modelo no utiliza una espera bloqueante de 50 ms, sino que contabiliza el tiempo mediante la ejecución periódica del módulo.

El objetivo es evitar que las fluctuaciones de alta frecuencia producidas por el rebote mecánico del pulsador sean interpretadas como cambios válidos de estado.




