library(tidyverse)
library(dplyr)
library(rvest)

competitions <- list('eng-premier-league','bundesliga','fra-ligue-1','esp-primera-division'
                     ,'ita-serie-a','den-superligaen','swe-allsvenskan','tur-sueperlig',
                     'ukr-premyer-liga','sco-premiership','jpn-j1-league','chn-super-league',
                     'ind-indian-super-league','ned-eredivisie','rou-liga-1','rus-premier-liga')
for(c in competitions){
  print(c)
  url = glue::glue("https://www.worldfootball.net/alltime_table/{c}/")
  all_time = read_html(url) %>%
    html_nodes("table.standard_tabelle") %>%
    html_table() %>%
    data.frame()
  
  write.table(all_time,file = "C:\\Users\\alypr\\OneDrive\\Documents\\scrapping\\alltimetables.csv",
              append = TRUE,sep = ',', col.names = TRUE)
  
}

data <- read.csv2("alltimetables.csv",header = FALSE)
colnames(data) <- c('x')


print(colnames(data))