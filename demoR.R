#Prueba Demo R 

#Importo el fichero de excel
La_liga_Player_stats <- read_excel("Desktop/Demo R/La liga Player stats.xlsx")

#570 observaciones (filas) y 30 Variables (Columnas)

#Muestro nombres de las variables (columnas del excel)
names(La_liga_Player_stats)

#Si deseamos renombrar una variable
names(La_liga_Player_stats)[5]<-"Equipo"
names(La_liga_Player_stats)[2]<-"Jugador"
names(La_liga_Player_stats)[3]<-"Nacionalidad"
names(La_liga_Player_stats)[11]<-"Goles"

#Para un vistazo rápido, de los primeros registros o de los últimos del dataset
head(La_liga_Player_stats)
tail(La_liga_Player_stats)

#Abro el dataset en una ventana de exploración
View(La_liga_Player_stats)

################################################
#Si deseamos filtrar un subconjunto de los datos
################################################

#Ver valores únicos de una variable
unique(La_liga_Player_stats$Equipo)
unique(La_liga_Player_stats$Nacionalidad)

#Ejemplo, crear un dataset solamente con los valores de un equipo [Filas,Columnas]
Barcelona <- La_liga_Player_stats[La_liga_Player_stats$Equipo == "Barcelona",]
Betis <- La_liga_Player_stats[La_liga_Player_stats$Equipo == "Betis",]

#Mostrar Goles del equipo
sum(Barcelona$Goles)
sum(Betis$Goles)


################################################
#Si deseamos realizar gráficos con librería ggplot2
################################################

#Nota: existe una evolución de ggplot2 como puede ser plotly
#que permite gráficos un poco más interactivos. Se instalaría igual.

#La primera vez hay que instalarla
#Desde comando o desde el asistente Packages - Install
install.packages("ggplot2")

#Una vez instalada, hay que cargarla en nuestro proyecto
#Desde que se instale y referencie ya se pueden usar sus funciones
library(ggplot2)


#Ejemplo: graficar comportamiento de Números Goles respecto a Edad
plot(Barcelona$Goles, Barcelona$Age)
plot(Betis$Goles, Betis$Age)

#Mismo ejemplo pero con GGPLOT
#Datos, estética (colores, tamaños), geometría (layers, formas)
ggplot(Barcelona, aes(x=Goles, y=Age))+geom_point()

#Ejemplo, calculo densidad, Histograma de una sola variable
ggplot(Barcelona, aes(x=Goles))+geom_density()
ggplot(Barcelona, aes(x=Goles))+geom_histogram()

#Mostrar gráfico de barras de las Nacionalidades y de las posiciones
ggplot(Barcelona, aes(x=Nacionalidad))+geom_bar()
ggplot(Barcelona, aes(x=Pos))+geom_bar()


#Segmentar el histograma anterior por una variable, por ejemplo la nacionalidad
ggplot(Barcelona, aes(x=Goles))+geom_histogram()+facet_wrap(~Nacionalidad)
ggplot(Barcelona, aes(x=Goles))+geom_histogram()+facet_wrap(~Age)


#Modificar barras de verticales a horizontales
ggplot(Barcelona, aes(x=Pos))+geom_bar()+coord_flip()


#Utilizar colores para agregar más información
ggplot(Barcelona, aes(x=Pos,fill=Age))+geom_bar()+coord_flip()
ggplot(Barcelona, aes(x=Pos,fill=Pos))+geom_bar()+coord_flip()



