# 1. Reconstruir el degradado con matrix()
# Creamos una secuencia de 0 a 255 con 5 valores, repetida en 5 filas
fila <- seq(0, 255, length.out = 5)
gris <- matrix(rep(fila, each = 5), nrow = 5, ncol = 5, byrow = TRUE)

cat("Dimensiones (dim):", dim(gris), "\n")
cat("Promedio (mean):", mean(gris), "\n")

# 2. Reconstruir la imagen RGB con los mismos colores (4x4x3)
rgb <- array(0, dim = c(4, 4, 3))

# Asignar Rojo [255, 0, 0] a la mitad izquierda (columnas 1 y 2)
rgb[, 1:2, 1] <- 255  # R
rgb[, 1:2, 2] <- 0    # G
rgb[, 1:2, 3] <- 0    # B

# Asignar Azul [0, 0, 255] a la mitad derecha (columnas 3 y 4)
rgb[, 3:4, 1] <- 0    # R
rgb[, 3:4, 2] <- 0    # G
rgb[, 3:4, 3] <- 255  # B

# Verificar píxeles extremos (Recordar que R indexa desde 1)
cat("Pixel [1,1,] (Rojo):", rgb[1, 1, ], "\n")
cat("Pixel [1,4,] (Azul):", rgb[1, 4, ], "\n")

# 3. Aplicar fórmula de luminosidad ponderada en R
R_ch <- rgb[, , 1]
G_ch <- rgb[, , 2]
B_ch <- rgb[, , 3]

gris_luminosidad <- 0.299 * R_ch + 0.587 * G_ch + 0.114 * B_ch

cat("\nGris Luminosidad en R:\n")
print(gris_luminosidad)

