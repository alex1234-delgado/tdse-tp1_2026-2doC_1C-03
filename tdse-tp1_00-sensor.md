# TP1 - Actividad 00 - Paso 06

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

