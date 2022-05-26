library(tidyverse)
library(dplyr)
library(rvest)
years <- list('2020','2019','2018','2017')
  
for(y in years){
  print(y)
  url = glue::glue("https://www.transfermarkt.com/mohamed-salah/leistungsdaten/spieler/148455/plus/1?saison={y}")
  salah_stats = read_html(url) %>%
    html_nodes("table.items") %>%
    html_table() %>%
    data.frame()
  
  
  names(salah_stats) <- c('x', 'y', 'Competition','Apperances' ,'Goals', 'Assists', 'Own Goals', 
                         'Substitutions in', 'Substitutions out', 'Yellow Card', 'Second Yellow Card', 'Red Card',
                         'Penalty Goals', 'Minutes Per Goal', 'Minutes Played')
  
  
  salah_stats <- salah_stats[-c(1),] 
    
  file_path <- sprintf("C:\\Users\\alypr\\OneDrive\\Documents\\scrapping\\%s.csv", y) 
  
  write.table(salah_stats,file = file_path, append = TRUE,sep = ',', col.names = TRUE)
  
}



