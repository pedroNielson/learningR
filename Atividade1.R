library(tidyverse)
mpg

#Primeiro plot onde displ = tamanho do motor do carro e hwy = eficiencia
# do carro na estrada em milhas por galão

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))

#Adicionando diferentes cores para cada classe para poder detalhar melhor os dados
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

#Separando o plot em facets

ggplot(data = mpg)+
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)

#Usando facet na combinação de variaveis 
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)

##Mudando o geom do plot para diferentes análises com os mesmos parâmetros

#Utilizando o geom_smooth para plotar uma linha de tendências
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))

#Mostrando valores 'unicos' fora da tendencia principal
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, color = drv))

#Plotando diferentes geoms no mesmo gráfico
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth()

##Passando para gráficos de barras 

#Utilizando o geom_bar para plotar o grafico de barras 
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut))

#Sumario dos valores em y para cara valor unico de x 
ggplot(data = diamonds) + 
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.min = min,
    fun.max = max,
    fun = median
  )

##Editando os gráficos de barras 

#Adicionando cores as barras
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, colour = cut))
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = cut))

#Preencher o metodo fill com outra variavel faz o gráfico evidenciar regioes especificas em cada barra
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity))

#Métodos position fill e dodge

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill")

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")

##Sistema de coordenadas

#Método coord_flip que gira os eixos
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
  geom_boxplot() +
  coord_flip()

#Método coord_polar que usa coordenadas polares para plotar o gráfico de barras
bar <- ggplot(data = diamonds) + 
  geom_bar(
    mapping = aes(x = cut, fill = cut), 
    show.legend = FALSE,
    width = 1
  ) + 
  theme(aspect.ratio = 1) +
  labs(x = NULL, y = NULL)

bar + coord_polar()


