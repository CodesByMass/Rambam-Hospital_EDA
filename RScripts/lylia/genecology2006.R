#install.packages("plyr")
library(plyr)
dbDisconnect(con)
library(RMySQL)
library(dbConnect) 
con=dbConnect(MySQL(),username='root',dbname='hopital',host='localhost')
result=dbSendQuery(con,"SELECT COUNT(*) as duration,date(entry_date) As WeekDay FROM visits 
WHERE YEAR(entry_date)=2004 and  
MONTH( entry_date )=3 AND
first_department= 78 AND HOUR(entry_date)
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
  ggtitle("La moyenne des arrivées pour chaque jour de semaine durant le mois septembre
          2006 dans le departement de Gynecology  ") +
  
  xlab("Jour") +
  ylab("nombre de patients  ")

