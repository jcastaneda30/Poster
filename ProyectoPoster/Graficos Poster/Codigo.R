# Especifica la ubicación del archivo CSV
archivo_csv <- "Intento_suicidio.csv"

# Lee el archivo CSV
datos <- read.csv(archivo_csv, sep = ";")
# Ahora 'datos' contiene los datos del archivo CSV en un marco de datos (data frame)
library(dplyr)


datos <- datos %>% select(-id, -semana,-uni_med_,-nombre_barrio,-comuna, -tipo_ss_,-cod_ase_, -fec_con_,
                          -ini_sin_,-tip_cas_,-pac_hos_,-inten_prev,-intentos,-estado_civ, -prob_parej
                          , -enfermedad_cronica, -prob_econo, -muerte_fam, -esco_educ, -prob_legal, -suici_fm_a,
                          -maltr_fps, -prob_labor, -prob_consu, -hist_famil, -idea_suici, -plan_suici, -antec_v_a,
                          -abuso_alco, -ahorcamien, -arma_corto, -arma_fuego, -inmolacion, -lanz_vacio, -lanz_vehic,
                          -lanz_agua, -intoxicaci, -gp_psiquia, -psiquiatri, -trab_socia, -evento)

# Supongamos que has modificado el marco de datos 'datos'

# Especifica la ruta y el nombre del archivo de salida
archivo_de_salida <- "Intento_suicidioLimpio.csv"

# Guarda el marco de datos modificado en un archivo CSV
write.csv(datos, file = archivo_de_salida, row.names = FALSE)


# Especifica la ubicación del archivo CSV
archivo_csv <- "Intento_suicidioLimpio.csv"

# Lee el archivo CSV
datos <- read.csv(archivo_csv)

#Si para esquizofrenia y si para depresion

Esquizofrenia_Depresion <- datos[datos$trast_bipolaridad == 1 &
                                 datos$tran_depre == 1,]

#Si para esquizofrenia y no para depresion

Esquizofrenia <- datos[datos$trast_bipolaridad == 1 &
                       datos$tran_depre == 2,]

#no para esquizofrenia y si para depresion

Depresion <- datos[datos$trast_bipolaridad == 2 &
                   datos$tran_depre == 1,]

#no para esquizofrenia y no para depresion

NoDepresion_NoEsquizofrenia <- datos[datos$trast_bipolaridad == 2 &
                                     datos$tran_depre == 2,]



Depresion_SexoM <- datos[datos$tran_depre == 1 &
                          datos$sexo_ == 'M',]

Depresion_SexoF <- datos[datos$tran_depre == 1 &
                          datos$sexo_ == 'F',]

DepresionDatos <- datos[datos$tran_depre == 1,]
DepresionDatos <- DepresionDatos[DepresionDatos$escolarid != "SD",]
DepresionDatos$sexo_ <- factor(DepresionDatos$sexo_)
# Crear un resumen de las frecuencias
tabla_frecuencias <- table(DepresionDatos$sexo_)
tabla_frecuencias

# Crear un diagrama de barras
barplot(tabla_frecuencias, 
        beside = TRUE,
        col = c("blue", "pink"),
        legend.text = TRUE,
        main = "Diagrama de Barras de Depresión por Género",
        xlab = "Trastorno de Depresión",
        ylab = "Frecuencia")

# Agregar leyenda
legend("topright", legend = levels(DepresionDatos$sexo_), fill = c("blue", "pink"))

levels(DepresionDatos$sexo_)


length(DepresionDatos$escolaridad)
class(DepresionDatos$escolaridad)
DepresionDatos$escolaridad <- factor(DepresionDatos$escolaridad)
DepresionDatos$escolarid
tabla_frecuenciasEscolaridad <- table(DepresionDatos$escolaridad)

