###########################################################
#La durée du séjour du patient aux rayons X par departemet#
###########################################################
dbDisconnect(con) 
library(RMySQL)
library(ggplot2)

con=dbConnect(MySQL(),username='root',dbname='hopital',host='localhost')
result=dbSendQuery(con,"SELECT *  from xrays_visits ") 
data.frame=fetch(result)
p=ggplot(data = data.frame,
       aes(x = data.frame$patient_id, y = data.frame$department, col = data.frame$duration)) +
  geom_point(alpha = .8, aes(colour = data.frame$duration))+
  ggtitle("La durée du séjour du patient aux rayons X par departemet ") +
  xlab("Patient") +
  ylab("Departement")
p+ scale_colour_gradient(name = "Runtime", low = "#FF0000", high ="#FFFF00")

##########################################################################
#La durée moyenne d'utilisation des rayons X par départment en avril 2007# 
##########################################################################
dbDisconnect(con) 
library(RMySQL)
library(ggplot2)

con=dbConnect(MySQL(),username='root',dbname='hopital',host='localhost')

result=dbSendQuery(con,"SELECT department as department, DAY(entry_date) As WeekDay,AVG(duration)/60 AS duration from xrays_visits where YEAR(entry_date)=2006 and  
                   MONTH( entry_date )=12 GROUP BY department")
data.frame=fetch(result)
ggplot(data = data.frame, aes(x = data.frame$department,y=data.frame$duration)) + 
  geom_histogram(stat = "identity",fill = "green")+
  ggtitle("La durée moyenne d'utilisation des rayons X par départment en avril 2007 ") +
  xlab("numéro de départment") +
  ylab("La durée moyenne")



#######################################################
####DEUXIEME PARTIE #######################



library(RMySQL)
library(ggplot2)

con=dbConnect(MySQL(),username='root',dbname='hopital',host='localhost')

result=dbSendQuery(con,"SELECT COUNT(*)/31 as moyenne,DAY(entry_date) As WeekDay 
FROM visits 
WHERE YEAR(entry_date)=2006 and  
MONTH( entry_date )=12 
GROUP BY WeekDay")
data.frame=fetch(result)
dc2006<-data.frame
result=dbSendQuery(con,"SELECT COUNT(*)/31 as moyenne,DAY(entry_date) As WeekDay 
FROM visits 
WHERE YEAR(entry_date)=2006 and  
MONTH( entry_date )=11 
GROUP BY WeekDay")
data.frame=fetch(result)
nv2006<-data.frame

months<-c("November","December") 
infant<-c(dc2006,nv2006)
dt<-cbind(months,infant) 
print(dt) 


ggplot(data = data.frame, aes(x = data.frame$WeekDay,y=data.frame$moyenne)) + 
  geom_histogram(stat = "identity",fill = "green")+
  ggtitle("la moyenne des  ") +
  xlab("numéro de départment") +
  ylab("La durée moyenne")
##############################################################
#install.packages("plyr")
library(plyr)
dbDisconnect(con)
library(RMySQL)
library(dbConnect) 
con=dbConnect(MySQL(),username='root',dbname='hopital',host='localhost')
result=dbSendQuery(con,"SELECT COUNT(*) as duration,date(entry_date) As WeekDay FROM visits 
WHERE YEAR(entry_date)=2006 and  
MONTH( entry_date )=2 AND HOUR(entry_date)<12 AND
first_department= 9
GROUP BY date(entry_date)")
data.frame=fetch(result)
res<-data.frame 
print(data.frame)
data.frame$WeekDay <- weekdays(as.POSIXct(data.frame$WeekDay), abbreviate = F) # change the date syntax format to weekdays
data.frame$WeekDay <- factor(data.frame$WeekDay ) 
avg<-aggregate(duration ~ WeekDay, data = data.frame , mean) 
print(avg$WeekDay)
print(data.frame$duration)
ggplot(data = avg ) + 
  geom_col(aes(x = avg$WeekDay,y=avg$duration),fill = "#009999",width = 0.1)+
  ggtitle("La moyenne des arrivées pour chaque jour durant le mois février
          2006 dans le departement de Gynecology l'apres midi ") +

  xlab("Jour") +
  ylab("Moyenne d'arriver ")
##########################################



library(plyr)
dbDisconnect(con)
library(RMySQL)
library(dbConnect) 
con=dbConnect(MySQL(),username='root',dbname='hopital',host='localhost')
result=dbSendQuery(con,"SELECT COUNT(*) as nombre,first_department as departement,
HOUR(entry_date) as heur,
day(entry_date) as jour 
FROM `visits`
WHERE day(entry_date)=1 AND
YEAR(entry_date)=2006 AND
HOUR(entry_date)<12
AND MONTH(entry_date)=
GROUP by first_department
")
data.frame=fetch(result)
res<-data.frame 
print(data.frame)
data.frame$WeekDay <- weekdays(as.POSIXct(data.frame$WeekDay), abbreviate = F) # change the date syntax format to weekdays
data.frame$WeekDay <- factor(data.frame$WeekDay ) 
avg<-aggregate(duration ~ WeekDay, data = data.frame , mean) 
print(data.frame$WeekDay)
print(data.frame$duration)
p=ggplot(data = data.frame,
         aes(x = data.frame$departement, y = data.frame$nombre, col = data.frame$heur)) +
  geom_point(alpha = .8, aes(colour = data.frame$heur))+
  ggtitle("La durée du séjour du patient aux rayons X par departemet ") +
  xlab("Departement") +
  ylab("nombre d'arriver")
p+ scale_colour_gradient(name = "Runtime", low = "#FF0000", high ="#FFFF00")

ggplot(data = data.frame, aes(x = data.frame$WeekDay,y=data.frame$duration)) + 
  geom_col(fill = "green",width = 0.2)+
  ggtitle("La moyen des arrivées pour chaque jour durant le mois decembre
          2006 dans le departement Gynecology  ") +
  
  xlab("Jour") +
  ylab("Moyenne d'arriver ")
########################################################