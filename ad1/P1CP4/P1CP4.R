library(tidyverse) 
library(calibrate)
# Leitura dos dados de todas as séries obtida pelo IMDB.
dados <- read_csv(file = "../series_from_imdb.csv")



#1- Qual série teve a melhor estreia?(Série com melhor avaliação no seu episódio piloto).

# Para responder essa pergunta é importante primeiramente saber a importância do episódio piloto.
# O episódio piloto funciona quase como um final de semana de estreia para os filmes, ele é crucial para conseguir cativar a audiência e, em alguns casos, até mesmo conquistar executivos de alguma rede. Algumas vezes o piloto é produzido como forma de aprovar uma série, afinal é muito mais barato investir em um episódio e “sentir” a série do que enviá-la para produção e descobrir que terá de ser cancelada por falta de interesse da audiência.

# Agora que sabemos a importância do episódio piloto precisamos saber quais dados são necessários para que se possa obter o resultado.
# Essa análise fez uso de um filto de todos os dados em busca das informações referêntes ao nome das séries("series_name"), ao primeiro episódio de cada série("series_ep == "1"") e a avalição dos usuários referentes a cada episódio(UserRating).
# A partir de todas a informações coletadas foi possível gerar o gráfico abaixo.

dados %>% filter(dados$series_ep == "1") %>%
  mutate(season = as.character(season)) %>% 
  ggplot(aes(x = series_name, y = UserRating)) %>% + 
  geom_line() + 
  geom_point() +
  stat_summary(geom="line", aes(group=1))  + 
  stat_summary(geom="point") + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1, size = 6)) 

# Ao dar uma boa observada no gráfico é possível notar que uma série se destrada, esse série é Mr. Robot  com avaliação de 9.3, sendo ela considera a com melhor episódio piloto segundo o IMDB.
# Como foi dito anteriormente, o episódio piloto acaba tendo um papel de termômetro para as emissoras, a partir disso surge um novo questionamento, a série Mr. Robot acabou realmente se destacando entre as demais séries?

# Para responder esse nova pergunta 


dados %>%
  mutate(season = as.character(season))   %>%
  ggplot(aes(x = series_name, y = UserRating)) +
  stat_summary(fun.y=median, geom="line", aes(group=1))  + 
  stat_summary(fun.y=median, geom="point") +
  geom_text(aes(label= ""),hjust=0, vjust=0) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, size = 6)) +
  coord_cartesian(ylim= c(7,9.0))

```

gfgf
gfgfgf
gfgf
    gfgf
    Série    |  Mediana
    
```{r}

