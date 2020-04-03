library(dbConnect)
library(ggplot2)
con = dbConnect(MySQL(),dbname='hopital',user='root',password='Racheletmoi2',host='localhost')
rq=dbGetQuery(con,"SELECT v.entry_group,v.gender,COUNT(*) FROM visits v where year(v.entry_date)=2004 and v.entry_group<>0 and v.gender=1  GROUP BY v.entry_group;")
rq1=dbGetQuery(con,"SELECT v.entry_group,v.gender,COUNT(*) FROM visits v where year(v.entry_date)=2004 and v.entry_group<>0 and v.gender=2 GROUP BY v.entry_group;")

d<-data.frame(sexe=rep(c("Homme","Femme"),each=2),dose=rep(c(rq$entry_grouprq,rq1$entry_group),2),len=c(rq$`COUNT(*)`,rq1$`COUNT(*)`) )
ggplot(data=d, aes(x=dose, y=len, fill=sexe)) +
  geom_bar(stat="identity", position=position_dodge(),width = 0.6)+ylab("Nombre de patients")+ scale_x_discrete(name ="Entry_group",  limits=c("urgence","hospital"))+ggtitle("   Les différentes orientations des patients")

on.exit(dbDisconnect(con))

