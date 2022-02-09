
## read data;
library(tidyverse)
grosses <- read.csv("grosses.csv")

##create month category and year category
mnths <- c("JAN","FEB","MAR","APR","MAY","JUNE","JULY","AUG","SEPT","OCT","NOV","DEC")
new_grosses <- grosses %>%
  mutate(year = as.numeric(str_sub(week_ending,1,4))) %>%
  mutate(month = as.numeric(str_sub(week_ending,6,7))) %>%
  mutate(preview_status = ifelse(previews>0,"Previewed", "No Previews")) %>%
  mutate(month_name = mnths[month]) %>%
  select(year, month,month_name, avg_ticket_price, seats_sold, preview_status)
