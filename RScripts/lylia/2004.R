

#####################################################################
janvier 2004
library(plyr)
dbDisconnect(con)
library(RMySQL)
library(dbConnect) 
con=dbConnect(MySQL(),username='root',dbname='hopital',host='localhost')
rq=dbGetQuery(con,"SELECT COUNT(*) as duration,date(entry_date) As WeekDay
FROM visits WHERE YEAR(entry_date)=2004 and  
                   MONTH( entry_date )=1 AND first_department= 1 
GROUP BY date(entry_date)")
rq2=dbGetQuery(con,"SELECT COUNT(*) as duration,date(entry_date) As WeekDay
FROM visits WHERE YEAR(entry_date)=2004 and  
                   MONTH( entry_date )=1 AND first_department= 2
GROUP BY date(entry_date)")
rq3=dbGetQuery(con,"SELECT COUNT(*) as duration,date(entry_date) As WeekDay
FROM visits WHERE YEAR(entry_date)=2004 and  
                   MONTH( entry_date )=1 AND first_department= 3
GROUP BY date(entry_date)")
rq7=dbGetQuery(con,"SELECT COUNT(*) as durationCC,date(entry_date) As WeekDay
FROM visits WHERE YEAR(entry_date)=2004 and  
                   MONTH( entry_date )=1 AND first_department= 7
GROUP BY date(entry_date)")
print(rq)
print(rq2)
is.data.frame(rq)
rq$WeekDay<- weekdays(as.POSIXct(rq$WeekDay), abbreviate = F)
rq2$WeekDay<- weekdays(as.POSIXct(rq2$WeekDay), abbreviate = F)
rq3$WeekDay<- weekdays(as.POSIXct(rq3$WeekDay), abbreviate = F)
rq7$WeekDay<- weekdays(as.POSIXct(rq7$WeekDay), abbreviate = F)
rq$WeekDay <- factor(rq$WeekDay ) 
avg<-aggregate(duration ~ WeekDay, data = rq , mean)
rq2$WeekDay <- factor(rq2$WeekDay ) 
avg2<-aggregate(duration ~ WeekDay, data = rq2 , mean)
rq7$WeekDay <- factor(rq7$WeekDay ) 

avg7<-aggregate(durationCC ~ WeekDay, data = rq7 , mean)

rq3$WeekDay <- factor(rq3$WeekDay ) 
avg3<-aggregate(duration ~ WeekDay, data = rq3 , mean)

print(avg)
print(avg2)
data.fram1<-merge(avg2, avg, by ="WeekDay") 

data.fram2<-merge(avg3, data.fram1, by ="WeekDay")
print()
data.fram<-merge(avg7, data.fram2, by ="WeekDay") 

print(data.fram)
ggplot(data = data.fram ) + 
  geom_col(aes(x = data.fram$WeekDay,y=data.fram$duration.y,fill="1 Emergency Internal Medicine Unit"),width = 0.1)+
  geom_col(aes(x = data.fram$WeekDay,y=data.fram$duration.x,fill="2 Emergency Surgery Unit"),width = 0.05)+
  geom_col(aes(x = data.fram$WeekDay,y=data.fram$duration,fill="3 Emergency Traumatology Unit "),width = 0.3)+
  geom_col(aes(x = data.fram$WeekDay,y=data.fram$durationCC,fill="7 Emergency Psychiatry Unit "),width = 0.2)+
  
  scale_color_discrete(labels = c("nombre de patients hospitaliser","nombre de patients"))+
  ggtitle("Le nombre de patients en moyenne pour les sept jour de la semaine 
                             durant le mois janvier 2004 ") +
  
  xlab("Jour") +
  ylab("Moyenne d'arriver ")


