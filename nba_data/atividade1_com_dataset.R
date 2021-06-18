library(tidyverse)

nba_ds <- read.csv("nba_data/nba_dataset.csv", header = TRUE)
james_harden <- filter(nba_ds, player_name == "James Harden")

#Primeiro - scatter
ggplot(data = james_harden) +
  geom_point(mapping = aes(x = age, y = pts))

#Segundo - scatter com cor diferenciando os times em que Harden jogou
ggplot(data = james_harden) +
  geom_point(mapping = aes(x = age, y = pts, color = team_abbreviation))

#Terceiro - facet wrap do scatter de pontos com o decorrer da idade 
ggplot(data = james_harden)+
  geom_point(mapping = aes(x = age, y = pts, color = team_abbreviation)) + 
  facet_wrap(~ team_abbreviation, nrow = 2)

#Quarto - linha de tendências
ggplot(data = james_harden) +
  geom_smooth(mapping = aes(x = age, y = pts))

#Quinto - scatter + smooth
ggplot(data = james_harden, mapping = aes(x = age, y = ast)) + 
  geom_point(mapping = aes(color = team_abbreviation)) + 
  geom_smooth()

#Sexto - barras da altura dos jogadores
ggplot(data = nba_ds) + 
  geom_bar(mapping = aes(x = player_height))


#Setimo - barras em coordenadas polares
bar <- ggplot(data = nba_ds) + 
  geom_bar(
    mapping = aes(x = player_height, fill = player_height), 
    show.legend = FALSE,
    width = 1
  ) + 
  theme(aspect.ratio = 1) +
  labs(x = NULL, y = NULL)

bar + coord_polar()

#Oitavo - Box plot da idade pelas assistencias 
ggplot(data = james_harden, mapping = aes(x = age, y = ast)) + 
  geom_boxplot()

