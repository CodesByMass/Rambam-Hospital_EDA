dbDisconnect(con)
library(dbConnect)
library(ggplot2)
dbDisconnect(con)
library(dplyr)
library(hrbrthemes)
con = dbConnect(MySQL(),dbname='hopital',user='root',password='Racheletmoi2',host='localhost')
rq0=dbGetQuery(con,"SELECT DATE_FORMAT(v.entry_date, \"%k\") as heure ,DATE_FORMAT(v.entry_date, \"%a\"),COUNT(*)FROM visit_details v where YEAR(v.entry_date)=2004 and v.department=1 and month(v.entry_date)=1 and  dayofweek(v.entry_date)=6 and DATE_FORMAT(v.entry_date, \"%U\")=1
 GROUP by DATE_FORMAT(v.entry_date, \"%k\") order by DATE_FORMAT(v.entry_date, \"%k\") ")
rq0
d<-data.frame(dose=c(rq0$heure) ,len=c(rq0$`COUNT(*)`))
d
class(rq0$heure)


ggplot(rq0, aes(as.numeric (rq0$heure), as.numeric (rq0$`COUNT(*)`))) +
  geom_point() +
  geom_line( colour = "#0AF9D8")+
  labs(x = "Year", y = "Particulate matter emissions (tons)",title = "Motor vehicle emissions in Baltimore")

#*****************************************************************************************
rq0=dbGetQuery(con,"SELECT DATE_FORMAT(v.entry_date, \"%i\") as minute ,DATE_FORMAT(v.entry_date, \"%a\") ,COUNT(*)FROM visit_details v where YEAR(v.entry_date)=2004 and DATE_FORMAT(v.entry_date, \"%k\")=6 and v.department=1 and month(v.entry_date)=1 and  dayofweek(v.entry_date)=6 and DATE_FORMAT(v.entry_date, \"%U\")=1
 GROUP by DATE_FORMAT(v.entry_date, \"%i\")")
d<-data.frame(dose=c(rq0$minute) ,len=c(rq0$`COUNT(*)`))
d
class(rq0$minute)


ggplot(d, aes(as.numeric (dose), as.numeric (len))) +
  geom_point() +
  geom_line( colour = "#0AF9D8")+
  labs(x = "Year", y = "Particulate matter emissions (tons)",title = "Motor vehicle emissions in Baltimore")
#**********************************************************************************************


rq0=dbGetQuery(con,"SELECT DATE_FORMAT(v.entry_date, \"%S\") as minute ,DATE_FORMAT(v.entry_date, \"%a\"),COUNT(*)FROM visit_details v where YEAR(v.entry_date)=2004 and v.department=1 and month(v.entry_date)=1 and  dayofweek(v.entry_date)=6 and DATE_FORMAT(v.entry_date, \"%U\")=1
 GROUP by DATE_FORMAT(v.entry_date, \"%S\")")
d<-data.frame(dose=c(rq0$minute) ,len=c(rq0$`COUNT(*)`))
d
class(rq0$minute)


ggplot(d, aes(as.numeric (dose), as.numeric (len))) +
  geom_point() +
  geom_line( colour = "#0AF9D8")+
  labs(x = "Year", y = "Particulate matter emissions (tons)",title = "Motor vehicle emissions in Baltimore")





on.exit(dbDisconnect(con))