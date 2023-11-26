# Cargamos el Archivo CSV

data <- read.csv("datat.csv", header = TRUE, sep = ";")

x <- data # Eliminas la ultima columna


# Separar variables numericas de las categoricas (library(dplyr))
numeric_vars <- x %>% select_if(is.numeric)

# aplicar microagregacion 
ag_level = 2

# ma_x = micro_agregration
ma_x_single <- microaggregation(numeric_vars, method = 'single',aggr = ag_level)
ma_x_influence <- microaggregation(numeric_vars, method = 'influence',aggr = ag_level)
ma_x_pca <- microaggregation(numeric_vars, method = 'pca',aggr = ag_level)

# Evaluar Metricas
# 1. dUtility
print('Microagregacion')
print('dUtility[Single]: ')
print( dUtility(ma_x_single$x, ma_x_single$mx, method='IL1'))
print('dUtility[influence]: ')
print(dUtility(numeric_vars, ma_x_influence$mx, method='IL1'))
print('dUtility[pca]: ')
print(dUtility(numeric_vars, ma_x_pca$mx, method='IL1'))
# 2. dRisk
print('dRisk[Single]: ')
print(dRisk(numeric_vars, ma_x_single$mx))
print('dRisk[influence]: ')
print(dRisk(numeric_vars, ma_x_influence$mx))
print('dRisk[pca]: ')
print(dRisk(numeric_vars, ma_x_pca$mx))

## Seleccionar las varibles no numericas

# numeric_columns es un vector con los nombres de las columnas numéricas
numeric_columns <- colnames(numeric_vars)

# Seleccionar las columnas que no están en numeric_columns
non_numeric_columns <- x[, !(colnames(x) %in% numeric_columns)]

# Crear un nuevo conjunto de datos con las columnas seleccionadas
combined_dataset <- cbind(non_numeric_columns, ma_x_single$mx)

# Escribir el conjunto de datos combinado a un archivo CSV
write.csv(combined_dataset, "combined_dataset.csv", row.names = FALSE, sep = ";")