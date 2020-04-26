dbDisconnect(con)
library(dbConnect)
library(ggplot2)
library(dplyr)
library(hrbrthemes)
con = dbConnect(MySQL(),dbname='hopital',user='root',password='Racheletmoi2',host='localhost')

rq0=dbGetQuery(con,"SELECT DATE_FORMAT(v.entry_date, \" %a\"),DATE_FORMAT(v.entry_date, \" %H\") as minute,COUNT(*)
                  FROM visit_details v where YEAR(v.entry_date)=2004 and v.department=1 
                  and month(v.entry_date)=1 and  dayofweek(v.entry_date)=6 AND DATE_FORMAT(v.entry_date, \" %U\")=1
                  GROUP by DATE_FORMAT(v.entry_date, \" %H\")")
rq0
class(rq0)
d<-data.frame(dose=c(rq0$minute) ,len=c(rq0$`COUNT(*)`))
class(d)
class(rq0$se)
data <- data.frame(
  Departement=rq0$minute,  
  value=rq0$`COUNT(*)`
)
# Barplot basique
p<-ggplot(data=rq0, aes(x=rq0$minute, y=rq0$`COUNT(*)`)) +
  geom_bar(stat="identity" ,width=0.5, color="blue", fill="steelblue")
p

ggplot(rq0, aes(as.numeric (rq0$se), as.numeric (rq0$`COUNT(*)`))) +
  geom_point() +
  geom_line( colour = "#0AF9D8") +
  labs(x = "Year", y = "Particulate matter emissions (tons)",title = "Motor vehicle emissions in Baltimore")

rq0=dbGetQuery(con,"SELECT DATE_FORMAT(v.entry_date, \" %S\") as se,COUNT(*) FROM visit_details v where YEAR(v.entry_date)=2004 and v.department=1 and month(v.entry_date)=1 and HOUR(v.entry_date)=11 and DATE_FORMAT(v.entry_date, \" %e\")=7 and dayofweek(v.entry_date)=4 GROUP by DATE_FORMAT(v.entry_date, \" %S\")
")
rq0
d<-data.frame(dose=c(rq0$se) ,len=c(rq0$`COUNT(*)`))
d
class(rq0$se)
data <- data.frame(
  Departement=rq0$se,  
  value=rq0$`COUNT(*)`
)
# Barplot basique
p<-ggplot(data=d, aes(x=dose, y=len)) +
  geom_bar(stat="identity" ,width=0.5, color="blue", fill="steelblue")
p

ggplot(d, aes(as.numeric (dose), as.numeric (len))) +
  geom_point() +
  geom_line( colour = "#0AF9D8") +
  labs(x = "Year", y = "Particulate matter emissions (tons)",title = "Motor vehicle emissions in Baltimore")
#le minute %i par numero de jour de la semaine %e
rq0=dbGetQuery(con,"SELECT DATE_FORMAT(v.entry_date, \" %S\")as se,COUNT(*) FROM visit_details v where YEAR(v.entry_date)=2004 and v.department=1 and month(v.entry_date)=1 and  DATE_FORMAT(v.entry_date, \" %e\")=7 and dayofweek(v.entry_date)=4 GROUP by DATE_FORMAT(v.entry_date, \" %S\")
")
rq0

d<-data.frame(dose=c(rq0$se) ,len=c(rq0$`COUNT(*)`))
d

ggplot(d, aes(as.numeric (dose), as.numeric (len))) +
  geom_point() +
  geom_line( colour = "#0AF9D8")+
  labs(x = "Year", y = "Particulate matter emissions (tons)",title = "Motor vehicle emissions in Baltimore")


#le seconde %S par numero de jour de la semaine %e la plus grande 
rq1=dbGetQuery(con,"SELECT DATE_FORMAT(v.entry_date, \" %S\") as se,COUNT(*) FROM visit_details v where YEAR(v.entry_date)=2004 and v.department=1 and month(v.entry_date)=1 and  DATE_FORMAT(v.entry_date,\" %e\")=18 GROUP by DATE_FORMAT(v.entry_date, \" %S\")
")
rq1

d1<-data.frame(dose=c(rq1$se) ,len=c(rq1$`COUNT(*)`))
d1

ggplot(d1, aes(as.numeric (dose), as.numeric (len))) +
  geom_point() +
  geom_line( colour = "#0AF9D8")+
  labs(x = "Year", y = "Particulate matter emissions (tons)",title = "Motor vehicle emissions in Baltimore")
#le seconde %S par numero de jour de la semaine %e la plus grande 
rq1=dbGetQuery(con,"SELECT DATE_FORMAT(v.entry_date, \" %S\") as se,COUNT(*) FROM visit_details v where YEAR(v.entry_date)=2004 and v.department=1 and month(v.entry_date)=1 and  DATE_FORMAT(v.entry_date,\" %e\")=18 and HOUR(v.entry_date)=11  GROUP by DATE_FORMAT(v.entry_date, \" %S\")
")
rq1

d1<-data.frame(dose=c(rq1$se) ,len=c(rq1$`COUNT(*)`))
d1

ggplot(d1, aes(as.numeric (dose), as.numeric (len))) +
  geom_point() +
  geom_line( colour = "#0AF9D8")+
  labs(x = "Year", y = "Particulate matter emissions (tons)",title = "Motor vehicle emissions in Baltimore")



on.exit(dbDisconnect(con))

