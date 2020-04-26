ibrary(plyr)
dbDisconnect(con)
library(RMySQL)
library(dbConnect) 
con = dbConnect(MySQL(),dbname='hopital',user='root',password='Racheletmoi2',host='localhost')


result=dbSendQuery(con,"SELECT DATE_FORMAT(v.entry_date, \" %a\"),DATE_FORMAT(v.entry_date, \" %H\") as minute,COUNT(*)
                  FROM visit_details v where YEAR(v.entry_date)=2004 and v.department=1 
                  and month(v.entry_date)=1 and  dayofweek(v.entry_date)=6 AND DATE_FORMAT(v.entry_date, \" %U\")=1
                  GROUP by DATE_FORMAT(v.entry_date, \" %H\")")

class(result)
reshhhh<-fetch(result)
reshhhh
class(reshhhh)
ggplot(reshhhh, aes(as.numeric (reshhhh$minute), as.numeric (reshhhh$`COUNT(*)`))) +
  geom_line( colour = "#009999")+
  labs(x = "Heurs", y = "nombre d'arrivé",title = "nombre d'arrivés par heur pour le vendredi 1eme janvier 2004")