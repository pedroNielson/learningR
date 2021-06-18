library(tidyverse)

nba_ds <- read.csv("nba_data/nba_dataset.csv", header = TRUE)

#Primeiro - scatter
ggplot(data = nba_ds) +
  geom_point(mapping = aes(x = player_height, y = index))

#Segundo - linha de tendências
ggplot(data = nba_ds) + 
  geom_smooth(mapping = aes(x = player_weight, y = index))

#Terceiro - barras em coordenadas polares
ggplot(data = nba_ds) + 
  geom_bar(mapping = aes(x = player_height))

#Quarto - barras com cores
bar <- ggplot(data = nba_ds) + 
  geom_bar(
    mapping = aes(x = player_height, fill = player_height), 
    show.legend = FALSE,
    width = 1
  ) + 
  theme(aspect.ratio = 1) +
  labs(x = NULL, y = NULL)

bar + coord_polar()

