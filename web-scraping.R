#robotstxt - to get permission, connectivity, etc.....
#rvest - to take the HTML scrapper point
library(robotstxt)
library(rvest)

#scrapping websites
url <- "https://www.graceonline.in"

#allowability
path = paths_allowed(url)

#HTML elements from website
web <- read_html(url)

#segregating item name
Item_Name<- web %>% html_nodes(".item-name a") %>%html_text()
View(Item_Name)

#segregating brand
Brand <- web %>% html_nodes(".item-brand") %>%html_text()
View(Brand)

#segregating price
Price <- web %>% html_nodes(".item-price") %>%html_text()
View(Price)

#creating dataframe
grace<- data.frame(Item_Name,Brand,Price)
View(grace)

#saving data
write.csv(grace,"stock_list.csv")
