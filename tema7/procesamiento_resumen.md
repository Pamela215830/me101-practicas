# Resumen de Procesamiento Básico de Imágenes con Python

## 1. Figuras Dibujadas
Para la imagen sintética de 120x120 píxeles, se configuró un fondo en azul marino (RGB: 20, 30, 70). Sobre este se dibujaron dos figuras:
* **Figura 1:** Un círculo (elipse) relleno de color amarillo brillante (RGB: 255, 215, 0).
* **Figura 2:** Un rectángulo relleno de color rojo carmesí (RGB: 220, 20, 60).

## 2. Comparación de Escala de Grises (Píxel de Fondo)
Se analizó el píxel de coordenadas (5, 5) correspondiente al fondo de la imagen:
* **Pillow (`.convert('L')`):** 29
* **scikit-image (`color.rgb2gray()` * 255):** 30.83

La pequeña discrepancia se debe al uso de diferentes normas de conversión de luminancia RGB a escala de grises (ITU-R 601-2 en Pillow frente a BT.709 en scikit-image).

## 3. Umbral de Otsu y Binarización
* **Umbral de Otsu obtenido:** 0.2223 (equivalente a ~56.7 en la escala 0-255).
* **Proporción de píxeles 'True' (por encima del umbral):** 26.39% de la imagen.

*Nota sobre el reto opcional:* Al comparar `SHARPEN` y `GaussianBlur`, el primero resalta las transiciones drásticas de bordes incrementando el contraste local, mientras que el segundo atenúa el ruido y suaviza las fronteras entre figuras.