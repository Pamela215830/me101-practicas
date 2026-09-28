library(tidyverse)

# Lectura del archivo CSV
df <- read_csv("estudiantes.csv")
# Estructura del dataset y recuento de valores NA
glimpse(df)
colSums(is.na(df))

# Limpieza encadenada con el operador pipe
df_limpio <- df %>%
  drop_na(nota) %>%
  mutate(asistencia_pct = replace_na(asistencia_pct, mean(asistencia_pct, na.rm = TRUE)))

# Verificación de valores NA
colSums(is.na(df_limpio))

# Promedio de nota agrupado por curso
promedio_por_curso <- df_limpio %>%
  group_by(curso) %>%
  summarise(promedio_nota = mean(nota))

print(promedio_por_curso)

# Exportación del DataFrame limpio
write_csv(df_limpio, "estudiantes_limpio_R.csv")

