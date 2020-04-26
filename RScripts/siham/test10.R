dbDisconnect(con)
library(dbConnect)
library(ggplot2)
library(dplyr)
library(hrbrthemes)

con = dbConnect(MySQL(),dbname='hopital',user='root',password='Racheletmoi2',host='localhost')
#**********************************nombre de patient pour le 01/2014  par semaine *****************

rq0=dbGetQuery(con,"SELECT convert(DATE_FORMAT(v.entry_date, \" %U\"),integer) as semaine , COUNT(*) FROM visit_details v where YEAR(v.entry_date)=2004 and v.department=1 and month(v.entry_date)=1 GROUP by DATE_FORMAT(v.entry_date, \" %U\") 
")
rq0

# Barplot basique
p<-ggplot(data=rq0, aes(x=semaine, y=`COUNT(*)`)) +
  geom_bar(stat="identity" ,width=0.5, color="blue", fill="#9400D3")+
  scale_x_continuous(name="Semaine") +scale_y_continuous(name="Nombre de patients ") +ggtitle("Nombres d'arrivées par semaine ")+ theme(
    plot.title = element_text(color="black", size=14, face="bold.italic",hjust = 0.5),
    plot.subtitle = element_text(color="grey", size=14, face="bold",hjust = 0.5),
    axis.title.x = element_text(color="blue", size=10, face="bold"),
    axis.title.y = element_text(color="blue", size=14, face="bold")
  )
p

ggplot(rq0, aes(semaine, `COUNT(*)`)) +
  geom_line( colour = "#9400D3")+
  scale_x_continuous(name="Semaine") +scale_y_continuous(name="Nombre de patients ") +ggtitle("Nombres d'arrivées par semaine ")+ theme(
    plot.title = element_text(color="black", size=14, face="bold.italic",hjust = 0.5),
    plot.subtitle = element_text(color="grey", size=14, face="bold",hjust = 0.5),
    axis.title.x = element_text(color="blue", size=10, face="bold"),
    axis.title.y = element_text(color="blue", size=14, face="bold")
  )



#**********************************nombre de patient pour le 01/2014 par jour *****************

rq0=dbGetQuery(con,"SELECT CONVERT(DATE_FORMAT(v.entry_date, \" %e\"),integer) as jour,COUNT(*) FROM visit_details v where YEAR(v.entry_date)=2004 and v.department=1 and month(v.entry_date)=1 GROUP by DATE_FORMAT(v.entry_date, \" %e\") order by jour
")
rq0

# Barplot basique
p<-ggplot(data=rq0, aes(x=jour, y=`COUNT(*)`)) +
  geom_bar(stat="identity" ,width=0.5, color="blue", fill="#00FFFF")+
  scale_x_continuous(name="Jours") +scale_y_continuous(name="Nombre de patients ") +ggtitle("Nombres d'arrivées par les jours de mois ")+ theme(
    plot.title = element_text(color="black", size=14, face="bold.italic",hjust = 0.5),
    plot.subtitle = element_text(color="grey", size=14, face="bold",hjust = 0.5),
    axis.title.x = element_text(color="blue", size=10, face="bold"),
    axis.title.y = element_text(color="blue", size=14, face="bold")
  )
p
ggplot(rq0, aes(jour, `COUNT(*)`)) +
  geom_line( colour = "#00FFFF")+
  scale_x_continuous(name="Jours") +scale_y_continuous(name="Nombre de patients ") +ggtitle("Nombres d'arrivées par les jours de mois ")+ theme(
    plot.title = element_text(color="black", size=14, face="bold.italic",hjust = 0.5),
    plot.subtitle = element_text(color="grey", size=14, face="bold",hjust = 0.5),
    axis.title.x = element_text(color="blue", size=10, face="bold"),
    axis.title.y = element_text(color="blue", size=14, face="bold")
  )



#********************************* nombre de patient pour le 18/01/2014 par heure********************

rq0=dbGetQuery(con,"SELECT CONVERT(DATE_FORMAT(v.entry_date, \" %k\"),integer) as heure,COUNT(*) FROM visit_details v where YEAR(v.entry_date)=2004 and v.department=1 and month(v.entry_date)=1  and DATE_FORMAT(v.entry_date, \" %e\")=18 GROUP by DATE_FORMAT(v.entry_date, \" %k\") order by heure
")
rq0

# Barplot basique
p<-ggplot(data=rq0, aes(x=heure, y=`COUNT(*)`)) +
  geom_bar(stat="identity" ,width=0.5, fill="#FF1493")+
  scale_x_continuous(name="Heures") +scale_y_continuous(name="Nombre de patients ") +ggtitle("Nombres d'arrivées  pour 18/01/2004 par heures  ")+ theme(
    plot.title = element_text(color="black", size=14, face="bold.italic",hjust = 0.5),
    plot.subtitle = element_text(color="grey", size=14, face="bold",hjust = 0.5),
    axis.title.x = element_text(color="blue", size=10, face="bold"),
    axis.title.y = element_text(color="blue", size=14, face="bold"))
p
ggplot(rq0, aes(heure, `COUNT(*)`)) +

  geom_line(size=2, colour = "#FF1493")+
  scale_x_continuous(name="Heures") +scale_y_continuous(name="Nombre de patients ") +ggtitle("Nombres d'arrivées  pour 18/01/2004 par heures  ")+ theme(
    plot.title = element_text(color="black", size=14, face="bold.italic",hjust = 0.5),
    plot.subtitle = element_text(color="grey", size=14, face="bold",hjust = 0.5),
    axis.title.x = element_text(color="blue", size=10, face="bold"),
    axis.title.y = element_text(color="blue", size=14, face="bold"))



#**********************************************nombre de patient pour le 18/01/2014 a 10h par minute *********************************************
rq0=dbGetQuery(con,"SELECT convert(DATE_FORMAT(v.entry_date, \" %i\"),integer) as minute,COUNT(*) FROM visit_details v where YEAR(v.entry_date)=2004 and v.department=1 and month(v.entry_date)=1 and HOUR(v.entry_date)=10 and DATE_FORMAT(v.entry_date, \" %e\")=18  GROUP by DATE_FORMAT(v.entry_date, \" %i\")
")
rq0

# Barplot basique
p<-ggplot(data=rq0, aes(x=minute, y=`COUNT(*)`)) +
  geom_bar(stat="identity" ,width=0.5, fill="#800080") +
  scale_x_continuous(name="Minutes") +scale_y_continuous(name="Nombre de patients ") +ggtitle("Nombres d'arrivées pour le 18/01/2004 à 10h par les minutes  ")+ theme(
    plot.title = element_text(color="black", size=14, face="bold.italic",hjust = 0.5),
    plot.subtitle = element_text(color="grey", size=14, face="bold",hjust = 0.5),
    axis.title.x = element_text(color="blue", size=10, face="bold"),
    axis.title.y = element_text(color="blue", size=14, face="bold")
  )
p

ggplot(rq0, aes(minute, `COUNT(*)`)) +

  geom_line( size=2,colour = "#800080")+
  scale_x_continuous(name="Minutes") +scale_y_continuous(name="Nombre de patients ") +ggtitle("Nombres d'arrivées le 18/01/2004 à 10h par les minutes  ")+ theme(
    plot.title = element_text(color="black", size=14, face="bold.italic",hjust = 0.5),
    plot.subtitle = element_text(color="grey", size=14, face="bold",hjust = 0.5),
    axis.title.x = element_text(color="blue", size=10, face="bold"),
    axis.title.y = element_text(color="blue", size=14, face="bold")
  )

#**********************************************nombre de patient pour le 18/01/2014 a 10h par secondes *********************************************
rq0=dbGetQuery(con,"SELECT convert(DATE_FORMAT(v.entry_date, \" %s\"),integer) as secondes,COUNT(*) FROM visit_details v where YEAR(v.entry_date)=2004 and v.department=1 and month(v.entry_date)=1 and HOUR(v.entry_date)=10 and DATE_FORMAT(v.entry_date, \" %e\")=18  GROUP by DATE_FORMAT(v.entry_date, \" %s\")
")
rq0

# Barplot basique
p<-ggplot(data=rq0, aes(x=secondes, y=`COUNT(*)`)) +
  geom_bar(stat="identity" ,width=1.1, fill="#FFD700")+
  scale_x_continuous(name="Secondes") +scale_y_continuous(name="Nombre de patients ") +ggtitle("Nombres d'arrivées   le 18/01/2004 à 10h par secondes  ")+ theme(
    plot.title = element_text(color="black", size=14, face="bold.italic",hjust = 0.5),
    plot.subtitle = element_text(color="grey", size=14, face="bold",hjust = 0.5),
    axis.title.x = element_text(color="blue", size=10, face="bold"),
    axis.title.y = element_text(color="blue", size=14, face="bold")
  )

p

ggplot(rq0, aes(secondes, `COUNT(*)`))+

  geom_line(size=2, colour = "#FFD700")+
  scale_x_continuous(name="Secondes") +scale_y_continuous(name="Nombre de patients ") +ggtitle("Nombres d'arrivées le 18/01/2004 à 10h par secondes   ")+ theme(
    plot.title = element_text(color="black", size=14, face="bold.italic",hjust = 0.5),
    plot.subtitle = element_text(color="grey", size=14, face="bold",hjust = 0.5),
    axis.title.x = element_text(color="blue", size=10, face="bold"),
    axis.title.y = element_text(color="blue", size=14, face="bold")
  )

#******************************nombre de patient  pour 18/01/2014 par minutes ********************

rq0=dbGetQuery(con,"SELECT convert(DATE_FORMAT(v.entry_date, \" %i\"),integer) as minute,COUNT(*) FROM visit_details v where YEAR(v.entry_date)=2004 and v.department=1 and month(v.entry_date)=1  and DATE_FORMAT(v.entry_date, \" %e\")=18  GROUP by DATE_FORMAT(v.entry_date, \" %i\")
")
rq0

# Barplot basique
p<-ggplot(data=rq0, aes(x=minute, y=`COUNT(*)`)) +
  geom_bar(stat="identity" ,width=0.5, fill="#00FA9A")+
  scale_x_continuous(name="Minutes") +scale_y_continuous(name="Nombre de patients ") +ggtitle("Nombres d'arrivées  le 18/01/2004 par minutes  ")+ theme(
    plot.title = element_text(color="black", size=14, face="bold.italic",hjust = 0.5),
    plot.subtitle = element_text(color="grey", size=14, face="bold",hjust = 0.5),
    axis.title.x = element_text(color="blue", size=10, face="bold"),
    axis.title.y = element_text(color="blue", size=14, face="bold")
  )
p


ggplot(rq0, aes(minute, `COUNT(*)`)) +
  geom_line( size=1.3,colour = "#00FA9A")+
  scale_x_continuous(name="Minutes") +scale_y_continuous(name="Nombre de patients ") +ggtitle("Nombres d'arrivées  le 18/01/2004 par minutes  ")+ theme(
    plot.title = element_text(color="black", size=14, face="bold.italic",hjust = 0.5),
    plot.subtitle = element_text(color="grey", size=14, face="bold",hjust = 0.5),
    axis.title.x = element_text(color="blue", size=10, face="bold"),
    axis.title.y = element_text(color="blue", size=14, face="bold")
  )


#******************************nombre de patient  pour 18/01/2014 par secondes ********************

rq0=dbGetQuery(con,"SELECT convert(DATE_FORMAT(v.entry_date, \" %s\"),integer) as secondes,COUNT(*) FROM visit_details v where YEAR(v.entry_date)=2004 and v.department=1 and month(v.entry_date)=1  and DATE_FORMAT(v.entry_date, \" %e\")=18  GROUP by DATE_FORMAT(v.entry_date, \" %s\")
")
rq0

# Barplot basique
p<-ggplot(data=rq0, aes(x=secondes, y=`COUNT(*)`)) +
  geom_bar(stat="identity" ,width=0.5, fill="#2E8B57")+
  scale_x_continuous(name="Secondes") +scale_y_continuous(name="Nombre de patients ") +ggtitle("Nombres  arrivées  le 18/01/2019 par secondes ")+ theme(
    plot.title = element_text(color="black", size=14, face="bold.italic",hjust = 0.5),
    plot.subtitle = element_text(color="grey", size=14, face="bold",hjust = 0.5),
    axis.title.x = element_text(color="blue", size=10, face="bold"),
    axis.title.y = element_text(color="blue", size=14, face="bold")
  )
p


ggplot(rq0, aes(secondes, `COUNT(*)`)) +
  geom_line(size=1.3, colour = "#2E8B57")+
  scale_x_continuous(name="Secondes") +scale_y_continuous(name="Nombre de patients ") +ggtitle("Nombres d'arrivées  le 18/01/2019 par secondes ")+ theme(
    plot.title = element_text(color="black", size=14, face="bold.italic",hjust = 0.5),
    plot.subtitle = element_text(color="grey", size=14, face="bold",hjust = 0.5),
    axis.title.x = element_text(color="blue", size=10, face="bold"),
    axis.title.y = element_text(color="blue", size=14, face="bold")
  )
#********************************nobre de patient de dimanche par semaine de 01/2004***************************

#**********************************heures*************************************************************


rq0=dbGetQuery(con," SELECT convert(DATE_FORMAT(v.entry_date, \"%k\"),integer) as heure, COUNT(*)FROM visit_details v WHERE  YEAR(v.entry_date)=2004 and v.department=1 and month(v.entry_date)=1 and  dayofweek(v.entry_date)=1 and  DATE_FORMAT(v.entry_date, \"%U\") =1
 GROUP by DATE_FORMAT(v.entry_date, \"%k\") order by heure;")
rq1=dbGetQuery(con,"SELECT convert(DATE_FORMAT(v.entry_date, \"%k\"),integer) as heure, COUNT(*)FROM visit_details v WHERE  YEAR(v.entry_date)=2004 and v.department=1 and month(v.entry_date)=1 and  dayofweek(v.entry_date)=1 and  DATE_FORMAT(v.entry_date, \"%U\") =2
 GROUP by DATE_FORMAT(v.entry_date, \"%k\") order by heure;")
rq2=dbGetQuery(con,"SELECT convert(DATE_FORMAT(v.entry_date, \"%k\"),integer) as heure, COUNT(*)FROM visit_details v WHERE  YEAR(v.entry_date)=2004 and v.department=1 and month(v.entry_date)=1 and  dayofweek(v.entry_date)=1 and  DATE_FORMAT(v.entry_date, \"%U\") =3
 GROUP by DATE_FORMAT(v.entry_date, \"%k\") order by heure;")
rq3=dbGetQuery(con,"SELECT convert(DATE_FORMAT(v.entry_date, \"%k\"),integer) as heure, COUNT(*)FROM visit_details v WHERE  YEAR(v.entry_date)=2004 and v.department=1 and month(v.entry_date)=1 and  dayofweek(v.entry_date)=1 and  DATE_FORMAT(v.entry_date, \"%U\") =4
 GROUP by DATE_FORMAT(v.entry_date, \"%k\") order by heure;")


rq0
rq1
rq2
rq3
ggplot() + 
  geom_line(data=rq0,aes(heure,`COUNT(*)`), size=1, colour = "green")+ 
  geom_line(data=rq1,aes(heure,`COUNT(*)`), size=1, colour = "blue")+ 
  geom_line(data=rq2,aes(heure,`COUNT(*)`), size=1, colour = "red")+ 
  geom_line(data=rq3,aes(heure,`COUNT(*)`), size=1, colour = "Gold")+
scale_x_continuous(name="Minutes") +scale_y_continuous(name="Nombre de patients ") +ggtitle("Nombres d'arrivées pour les 4 dimanches \n de janvier par heures")+ theme(
    plot.title = element_text(color="black", size=14, face="bold.italic",hjust = 0.5),
    plot.subtitle = element_text(color="grey", size=14, face="bold",hjust = 0.5),
    axis.title.x = element_text(color="blue", size=10, face="bold"),
    axis.title.y = element_text(color="blue", size=14, face="bold")
  )
#******************************************par minutes ******************************************
rq0=dbGetQuery(con," SELECT convert(DATE_FORMAT(v.entry_date, \"%i\"),integer) as heure, COUNT(*)FROM visit_details v WHERE  YEAR(v.entry_date)=2004 and v.department=1 and month(v.entry_date)=1 and  dayofweek(v.entry_date)=1 and  DATE_FORMAT(v.entry_date, \"%U\") =1
 GROUP by DATE_FORMAT(v.entry_date, \"%i\") order by heure;")
rq1=dbGetQuery(con,"SELECT convert(DATE_FORMAT(v.entry_date, \"%i\"),integer) as heure, COUNT(*)FROM visit_details v WHERE  YEAR(v.entry_date)=2004 and v.department=1 and month(v.entry_date)=1 and  dayofweek(v.entry_date)=1 and  DATE_FORMAT(v.entry_date, \"%U\") =2
 GROUP by DATE_FORMAT(v.entry_date, \"%i\") order by heure;")
rq2=dbGetQuery(con,"SELECT convert(DATE_FORMAT(v.entry_date, \"%i\"),integer) as heure, COUNT(*)FROM visit_details v WHERE  YEAR(v.entry_date)=2004 and v.department=1 and month(v.entry_date)=1 and  dayofweek(v.entry_date)=1 and  DATE_FORMAT(v.entry_date, \"%U\") =3
 GROUP by DATE_FORMAT(v.entry_date, \"%i\") order by heure;")
rq3=dbGetQuery(con,"SELECT convert(DATE_FORMAT(v.entry_date, \"%i\"),integer) as heure, COUNT(*)FROM visit_details v WHERE  YEAR(v.entry_date)=2004 and v.department=1 and month(v.entry_date)=1 and  dayofweek(v.entry_date)=1 and  DATE_FORMAT(v.entry_date, \"%U\") =4
 GROUP by DATE_FORMAT(v.entry_date, \"%i\") order by heure;")
rq0
rq1
rq2
rq3
ggplot() + 
  geom_line(data=rq0,aes(heure,`COUNT(*)`), size=0.6, colour = "green")+ 
  geom_line(data=rq1,aes(heure,`COUNT(*)`), size=0.6,colour = "blue")+ 
  geom_line(data=rq2,aes(heure,`COUNT(*)`),size=0.6, colour = "red")+ 
  geom_line(data=rq3,aes(heure,`COUNT(*)`), size=0.6,colour = "Gold")+
  scale_x_continuous(name="Minutes") +scale_y_continuous(name="Nombre de patients ") +ggtitle("Nombres d'arrivées pour les 4 dimanches \n de janvier par minutes ")+ theme(
    plot.title = element_text(color="black", size=14, face="bold.italic",hjust = 0.5),
    plot.subtitle = element_text(color="grey", size=14, face="bold",hjust = 0.5),
    axis.title.x = element_text(color="blue", size=10, face="bold"),
    axis.title.y = element_text(color="blue", size=14, face="bold")
  )
#********************************************** par secondes ******************************************
rq0=dbGetQuery(con," SELECT convert(DATE_FORMAT(v.entry_date, \"%s\"),integer) as heure, COUNT(*)FROM visit_details v WHERE  YEAR(v.entry_date)=2004 and v.department=1 and month(v.entry_date)=1 and  dayofweek(v.entry_date)=1 and  DATE_FORMAT(v.entry_date, \"%U\") =1
 GROUP by DATE_FORMAT(v.entry_date, \"%s\") order by heure;")
rq1=dbGetQuery(con,"SELECT convert(DATE_FORMAT(v.entry_date, \"%s\"),integer) as heure, COUNT(*)FROM visit_details v WHERE  YEAR(v.entry_date)=2004 and v.department=1 and month(v.entry_date)=1 and  dayofweek(v.entry_date)=1 and  DATE_FORMAT(v.entry_date, \"%U\") =2
 GROUP by DATE_FORMAT(v.entry_date, \"%s\") order by heure;")
rq2=dbGetQuery(con,"SELECT convert(DATE_FORMAT(v.entry_date, \"%s\"),integer) as heure, COUNT(*)FROM visit_details v WHERE  YEAR(v.entry_date)=2004 and v.department=1 and month(v.entry_date)=1 and  dayofweek(v.entry_date)=1 and  DATE_FORMAT(v.entry_date, \"%U\") =3
 GROUP by DATE_FORMAT(v.entry_date, \"%s\") order by heure;")
rq3=dbGetQuery(con,"SELECT convert(DATE_FORMAT(v.entry_date, \"%s\"),integer) as heure, COUNT(*)FROM visit_details v WHERE  YEAR(v.entry_date)=2004 and v.department=1 and month(v.entry_date)=1 and  dayofweek(v.entry_date)=1 and  DATE_FORMAT(v.entry_date, \"%U\") =4
 GROUP by DATE_FORMAT(v.entry_date, \"%s\") order by heure;")
rq0
rq1
rq2
rq3
ggplot() + 
  geom_line(data=rq0,aes(heure,`COUNT(*)`), colour = "green")+ 
  geom_line(data=rq1,aes(heure,`COUNT(*)`), colour = "blue")+ 
  geom_line(data=rq2,aes(heure,`COUNT(*)`), colour = "red")+ 
  geom_line(data=rq3,aes(heure,`COUNT(*)`), colour = "Gold")+
  scale_x_continuous(name="Secondes") +scale_y_continuous(name="Nombre de patients ") +ggtitle("Nombres d'arrivées pour les 4 dimanches\n de janvier par secondes ")+ theme(
    plot.title = element_text(color="black", size=14, face="bold.italic",hjust = 0.5),
    plot.subtitle = element_text(color="grey", size=14, face="bold",hjust = 0.5),
    axis.title.x = element_text(color="blue", size=10, face="bold"),
    axis.title.y = element_text(color="blue", size=14, face="bold"))

#******************************nombre de patient  pour 18/01/2014 a par secondes poff ********************

rq0=dbGetQuery(con,"SELECT convert(DATE_FORMAT(v.entry_date, \" %s\"),integer) as secondes, convert(DATE_FORMAT(v.entry_date, \" %s\"),integer) as minute,COUNT(*) FROM visit_details v where YEAR(v.entry_date)=2004 and v.department=1 and month(v.entry_date)=1  and DATE_FORMAT(v.entry_date, \" %e\")=18 and DATE_FORMAT(v.entry_date, \" %k\")=10   GROUP by DATE_FORMAT(v.entry_date, \" %s\"),DATE_FORMAT(v.entry_date, \" %i\")
")
rq0

# Barplot basique
p<-ggplot(data=rq0, aes(x=secondes, y=`COUNT(*)`)) +
  geom_bar(stat="identity" ,width=0.5, color="blue", fill="steelblue")
p


ggplot(rq0, aes(secondes, `COUNT(*)`)) +
  geom_point() +
  geom_line( colour = "#502201")+
  scale_x_continuous(name="Heure") +scale_y_continuous(name="Nombre de patients ") +ggtitle("Nombres d'arrivées  pour les vendredis de janvier  2004  ")+ theme(
    plot.title = element_text(color="black", size=14, face="bold.italic",hjust = 0.5),
    plot.subtitle = element_text(color="grey", size=14, face="bold",hjust = 0.5),
    axis.title.x = element_text(color="blue", size=10, face="bold"),
    axis.title.y = element_text(color="blue", size=14, face="bold")
  )

#***********************************************************************************************

on.exit(dbDisconnect(con))
