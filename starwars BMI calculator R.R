library("tidyverse")
view(starwars)
gen <- starwars %>%
  select(name,species,gender,height,mass) %>%
  filter(species=="Human") %>%
  na.omit() %>%
  mutate(height = height/100)%>%
  mutate(BMI = mass/height^2) %>%
  group_by(gender)%>%
  #summarise(average_BMI = mean(BMI)) %>% 
  mutate(gender = recode(gender, masculine="m",feminine="f" ))
write.csv(gen, file = "table.csv", quote = FALSE, row.names = F)
