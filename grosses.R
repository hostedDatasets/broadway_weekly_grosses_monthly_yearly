
## read data;
library(tidyverse)
grosses <- read.csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-04-28/grosses.csv")

##create month category and year category
new_grosses <- grosses %>%
  mutate(year = as.numeric(str_sub(week_ending,1,4))) %>%
  mutate(month = as.numeric(str_sub(week_ending,6,7))) %>%
  mutate(preview_status = ifelse(previews>0,"Previewed", "No Previews")) %>%
  mutate(month_name = month.name[month]) %>%
  select(year, month,month_name, avg_ticket_price, seats_sold, preview_status)



write.csv(new_grosses,"newGrosses.csv", row.names = FALSE)
