library(dbConnect)
library(ggplot2)
library(dplyr)
library(hrbrthemes)
con = dbConnect(MySQL(),dbname='hopital',user='root',password='Racheletmoi2',host='localhost')
rq0=dbGetQuery(con,"SELECT  HOUR(v.entry_date) as heure  FROM visit_details v WHERE v.department=1 and  dayofweek(v.entry_date)=6 and  month(v.entry_date)=1  and YEAR(v.entry_date)=2004 GROUP BY HOUR(v.entry_date);
")
rq1=dbGetQuery(con,"SELECT COUNT(*) FROM visit_details v WHERE v.department=1 and  dayofweek(v.entry_date)=6 and  month(v.entry_date)=1 and YEAR(v.entry_date)=2004 GROUP BY HOUR(v.entry_date);
")
rq2=dbGetQuery(con,"SELECT COUNT(*) FROM visit_details v WHERE v.department=2 and  dayofweek(v.entry_date)=6 and  month(v.entry_date)=1  and YEAR(v.entry_date)=2004 GROUP BY HOUR(v.entry_date);
")
#rq3=dbGetQuery(con,"SELECT COUNT(*) FROM visit_details v WHERE v.department=3 and  dayofweek(v.entry_date)=6   and YEAR(v.entry_date)=2004 GROUP BY HOUR(v.entry_date);
#")
rq3=dbGetQuery(con,"SELECT COUNT(*) FROM visit_details v WHERE v.department=8 and  dayofweek(v.entry_date)=6 and  month(v.entry_date)=1 and YEAR(v.entry_date)=2004 GROUP BY HOUR(v.entry_date);
")
rq4=dbGetQuery(con,"SELECT COUNT(*) FROM visit_details v WHERE v.department=5 and  dayofweek(v.entry_date)=6 and  month(v.entry_date)=1 and YEAR(v.entry_date)=2004 GROUP BY HOUR(v.entry_date);
")

d<-data.frame(dose=c(rq0$heure) ,len1=c(rq1$`COUNT(*)`),len2=c(rq2$`COUNT(*)`),len3=c(rq3$`COUNT(*)`))
cols  <-  c ( "8"  =  "green" , "4"  =  "blue" , "6"  =  "aqua" , "10"  =  "red" )

ggplot() + geom_line(data=d,aes(dose, len1), colour = "#0AF9D8")+ geom_line(data=d,aes(dose, len2), colour = "#6E4BBE")+ geom_line(data=d,aes(dose, len3), colour = "#E35186")+
  scale_colour_manual(values =cols,breaks  =  c ( "8" , "4" , "6","10" ),labels = c("Emergency Internal Medicine Unit","Emergency Surgery Unit","Emergency Ophthalmology Unit","Emergency Gynecology Unit"))+
  scale_x_continuous(name="Heure") +scale_y_continuous(name="Nombre de patients ") +ggtitle("Nombres de patients arrivent  pour les vendredi de janvier  2004  ")+ theme(
    plot.title = element_text(color="black", size=14, face="bold.italic",hjust = 0.5),
    plot.subtitle = element_text(color="grey", size=14, face="bold",hjust = 0.5),
    axis.title.x = element_text(color="blue", size=10, face="bold"),
    axis.title.y = element_text(color="blue", size=14, face="bold")
  )

 
  


on.exit(dbDisconnect(con))

