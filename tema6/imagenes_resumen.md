# Resumen del Tema 6 — Imágenes como Datos

**Estudiante:** [Tu Nombre y Apellidos]
**Curso:** Programación Estadística y Visualización de Datos (ME101)
**Semana:** 6 — Unidad II
**Fecha:** 9 de octubre de 2026

---

## (a) Dimensiones (shape) de mis dos imágenes sintéticas

Construí dos imágenes sin descargar ningún archivo, solamente usando arrays.

**Imagen 1 — Escala de grises (Tarea 1):**
Es una matriz 2D de **5 filas × 5 columnas**, es decir, `shape = (5, 5)`. Cada
celda guarda un número entre 0 y 255 que representa un nivel de gris. El
degradado es horizontal: cada fila contiene los mismos cinco valores
(0, 63.75, 127.5, 191.25 y 255) repetidos hacia abajo. Al calcular la media de
todos los píxeles obtengo **127.5**, que es justamente el valor central del
rango 0–255. Esto me confirma que el degradado está bien balanceado.

**Imagen 2 — Color RGB (Tarea 2):**
Es un array 3D de **4 filas × 4 columnas × 3 canales**, es decir,
`shape = (4, 4, 3)`. La tercera dimensión son los tres canales de color
(Rojo, Verde y Azul). La imagen está dividida en dos mitades verticales:
las dos primeras columnas (índices 0 y 1 en Python, 1 y 2 en R) forman la
mitad izquierda, y las dos últimas columnas (índices 2 y 3 en Python,
3 y 4 en R) forman la mitad derecha. Cada píxel es entonces un pequeño
vector de tres números `[R, G, B]`.

---

## (b) Colores elegidos y sus valores de luminosidad

Para la imagen RGB elegí dos colores puros, muy fáciles de distinguir a
simple vista y muy útiles para comparar las dos fórmulas de conversión a
grises:

| Mitad | Color | (R, G, B) | Luminosidad (0.299·R + 0.587·G + 0.114·B) |
|-------|-------|-----------|---------------------------------------------|
| Izquierda | Rojo puro | (255, 0, 0) | **76.245** |
| Derecha   | Azul puro | (0, 0, 255) | **29.07**  |

**Cálculo del rojo:** 0.299·255 + 0.587·0 + 0.114·0 = **76.245**
**Cálculo del azul:**  0.299·0   + 0.587·0 + 0.114·255 = **29.07**

Un detalle que me pareció muy importante: si hubiera usado el **promedio
simple** (R+G+B)/3, ambos colores habrían dado **85**, es decir, el mismo
valor. El promedio simple no distingue el rojo del azul. En cambio, la
**luminosidad ponderada** sí los separa, porque le da mucho más peso al
verde (0.587) y al rojo (0.299) que al azul (0.114), reflejando así cómo
percibe el ojo humano la intensidad de la luz.

Verifiqué estos mismos valores en R, reconstruyendo la imagen con
`array(dim = c(4,4,3))` y aplicando la misma fórmula. Los resultados
coincidieron **exactamente** con los de Python (76.245 y 29.07), lo cual
tiene sentido porque la fórmula es idéntica; el único cambio fue recordar
que R indexa desde 1 y no desde 0.

---

## (c) Umbral usado para la binarización y por qué

Elegí un umbral de **50**.

**Justificación:** necesitaba un valor que cayera **entre** las dos
luminosidades que obtuve (29.07 para el azul y 76.245 para el rojo). El
número 50 cumple esa condición perfectamente: está por encima del azul y
por debajo del rojo. Al aplicar la binarización con `gris > 50`:

- Los píxeles rojos (76.245 > 50) se convierten en **1 (blanco)**.
- Los píxeles azules (29.07 ≤ 50) se convierten en **0 (negro)**.

De esta forma la imagen binarizada queda dividida limpiamente en dos
mitades contrastantes, que es justamente lo que buscaba.

**¿Por qué NO usé el umbral 128?** Porque 128 es mayor que ambas
luminosidades (76.245 y 29.07). Si lo hubiera usado, **todos** los píxeles
habrían quedado en 0 y la imagen binarizada sería completamente negra, sin
ninguna información útil. Esto me enseñó que el umbral no se elige al azar:
depende de los valores reales que tengan los píxeles de la imagen, y hay
que mirarlos antes de decidir.

En el reto opcional, con cuatro cuadrantes (rojo, verde, azul y amarillo),
las luminosidades fueron 76.25, 149.7, 29.07 y 225.9 respectivamente. Ahí
un umbral de 100 funcionó mejor, dejando en blanco solo el verde y el
amarillo. Esto confirma que el umbral óptimo cambia según cuántos colores
distintos haya en la imagen.