# Leer de una web (página de Wikipedia)
install.packages("lubridate")
library(lubridate)
library(stringr)
library(rvest)
library (dplyr)
# URL de la página
url <- "https://en.wikipedia.org/wiki/Men%27s_high_jump_world_record_progression"
# Leer el contenido HTML de la página
page <- read_html(url)

# Extraer todas las tablas
tables <- html_table(html_elements(page,"table"))
raw <-as.data.frame(tables[3]) # Escoge la tabla de interes

summary(raw)
head(raw)
# Limpieza de datos

meters <- str_sub(raw$Mark,1,4)
head(meters)
class(meters)
meters <- as.numeric(meters)

country <- str_sub(raw$Athlete,-4,-2)
head(country)

athlete <- str_sub(raw$Athlete,1,-6)
head(athlete)
athlete <- str_trim(athlete)# eliminar espacio
athlete <-str_to_upper(athlete)

dates <- raw$Date
head(dates, n=5)
dates <- str_replace(dates, "\\[[1-9]\\]","") # poner \\ delante del []para que nos lo detecte,
# sino lo usará como una expresión regular.
class(dates)

dates <- dmy(dates)


year <- year(dates)
head(year)
month <- month(dates)
day <- day(dates)
head(day)

record_time_elapsed <-year(today())-year(dates)
head(record_time_elapsed)

clean_data <-data.frame("Record" = meters,
                        "Athlete" = athlete,
                        "Country" = country,
                        "Record Date" = dates,
                        "Record Year" = year,
                        "Record Month" = month,
                        "Record Day" = day,
                        "Record Time Elapsed" = record_time_elapsed,
                        "City" = raw$Venue
                        )

head(clean_data, n=5)

info <- clean_data %>% mutate("Multiple Records" = ifelse(duplicated(Athlete),TRUE, FALSE)) %>%
      select(Record, Athlete, Record.Year, "Multiple Records", Country)

info <- clean_data %>%  select(Record, "Athlete", Record.Year, Country) %>%
  filter(Record >= 2.30) %>% group_by(Country) %>%
  summarise("maxRecord" = max(Record),"N. of Record" = n()) %>% arrange(desc(maxRecord))

info
