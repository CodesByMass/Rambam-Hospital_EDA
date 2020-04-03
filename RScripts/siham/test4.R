library(dbConnect)
library(ggplot2)
con = dbConnect(MySQL(),dbname='hopital',user='root',password='Racheletmoi2',host='localhost')
rq1=dbGetQuery(con,"SELECT HOUR(v.entry_date) as heure ,COUNT(*)/360 as moy FROM visits v WHERE v.entry_group=1 and  YEAR(v.entry_date) = 2004 GROUP BY heure")


d<-data.frame(dose=c(rq1$heure) ,len=c(rq1$moy))
ggplot() + geom_line(data=d,aes(dose, len), colour = "#07F5D5")+ scale_x_continuous(name="Heure") +scale_y_continuous(name="Moyenne des patients ") +ggtitle("Moyenne de patients au sevrice d\'urgance en 2004  ")+ theme(
  plot.title = element_text(color="black", size=14, face="bold.italic",hjust = 0.5),
  plot.subtitle = element_text(color="grey", size=14, face="bold",hjust = 0.5),
  axis.title.x = element_text(color="blue", size=10, face="bold"),
  axis.title.y = element_text(color="blue", size=14, face="bold")
)

on.exit(dbDisconnect(con))

