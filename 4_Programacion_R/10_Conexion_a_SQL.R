# Qué vamos a hacer:
# - Crear una base de datos SQLite
# - Añadir dos tablas: who y population (basado en los datasets homónimos de tidyr y tuberculosis)
# - Crear un dataframe con las columnas: país, año, grupo de edad, población total (de cada año)
# - Solo algunos países:
#     * Estados Unidos y México
# - Solo datos entre 2001 y 2008
# - Solo datos de mujeres entre 45 y 54 años
# - Hacer toda esta operación usando dplyr y mostrar qué consulta SQL construye

install.packages("RSQLite")
install.packages("tidyverse_conflicts")
install.packages("DBI")

# Cargar librerías necesarias
library(RSQLite)
library(tidyverse)
library(DBI)

# Nombrando la bd
db <- "tuberculosis.db"

# Crear conexión
con <- dbConnect(RSQLite::SQLite(), dbname = db)

# Ver tablas actuales (debería estar vacío)
dbListTables(con)

# Añadir información a la base de datos
dbWriteTable(con = con, name = "population", value = population)
dbWriteTable(con = con, name = "who", value = who)

# Verificación
dbListTables(con)

# Referenciar la tabla como objeto dplyr
tbl(con, "population")
tbl(con, "who")

# Construir nuestra sentencia SQL
select <- "SELECT who.year, who.country, who.new_sp_f4554, population.population"
from <- "FROM who"
left_join <- "LEFT JOIN population ON who.country = population.country AND who.year = population.year"
where <- "WHERE (who.country = 'Spain' OR who.country = 'Mexico') AND who.year >= 2001 and who.year <= 2008"

query <-paste(select, from,left_join,where)
query

resultados <- RSQLite::dbGetQuery(con,query)
class(resultados)
resultados

# Usando dpylr

ql <- tbl(con, "who") %>%
    filter(country %in% c("Spain", "Mexico"), year >= 2001, year <= 2008) %>%
    select(country, year, new_sp_f4554) %>%
    left_join(tbl(con, "population"), by = c("country", "year"))

show_query(ql)
resultados2 <- ql %>% collect()
class(resultados2)
resultados2

# Agrupamos por país y por año y que nos haga un resumen de casos
# por millon de habitantes
# Usando dplyr
q1 <- tbl(con, "who") %>%
  filter(country %in% c("Spain", "Mexico"), year >= 2001, year <= 2008) %>%
  select(country, year, new_sp_f4554) %>%
  left_join(tbl(con, "population"), by = c("country", "year")) %>%
  group_by(country, year) %>%
  summarise(`Casos por millón` = new_sp_f4554 / population * 1000000)

# Ver la consulta SQL generada
show_query(q1)

# Ejecutar la consulta y traer los datos a memoria
resultados3 <- q1 %>% collect()
class(resultados3)
resultados3

