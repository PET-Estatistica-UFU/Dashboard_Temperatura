library(stringr)
library(rvest)

url <- "https://www.cptec.inpe.br/previsao-tempo/mg/uberlandia"
page <- read_html(url)

temperaturas <- page %>%
  html_elements(".col-md-2") %>%
  html_text2() %>%
  str_replace_all("\n", ", ") %>%
  str_replace_all(" ", "") %>%
  str_extract("\\d+°\\,\\d+°")

temperaturas <- str_split(temperaturas, ",")
temperaturas <- as.data.frame(do.call(rbind, temperaturas))
colnames(temperaturas) <- c("min", "max")
temperaturas$data <- seq.Date(as.Date(Sys.Date()), length.out = nrow(temperaturas), by = "day")
temperaturas$min <- as.numeric(str_replace(temperaturas$min, "°", ""))
temperaturas$max <- as.numeric(str_replace(temperaturas$max, "°", ""))
temperaturas$media <- (temperaturas$min + temperaturas$max) / 2

saveRDS(temperaturas, "temperaturas.rds")
