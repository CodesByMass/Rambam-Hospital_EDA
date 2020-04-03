
#####nombre de patient par type de liberation####
library(dbConnect)
library(ggplot2)

con = dbConnect(MySQL(),dbname='hopital',user='root',password='Racheletmoi2',host='localhost')
rq=dbGetQuery(con,"select v.outcome,count(*) as nb FROM visits v where v.outcome<>11 and v.gender=1 and v.outcome<>0 and YEAR(v.entry_date)=2005 and month(v.entry_date)=1  GROUP by v.outcome;")
rq1=dbGetQuery(con,"select v.outcome,count(*) as nb FROM visits v where v.outcome<>11 and v.gender=2 and v.outcome<>0 and YEAR(v.entry_date)=2005 and month(v.entry_date)=1 GROUP by v.outcome;")

df <- data.frame(sexe=rep(c("Homme","Femme"),each=2),dose=rep(c(rq$outcome,rq1$outcome),2),
                 len=c(rq$nb,rq1$nb))

# Change the colors manually
p <- ggplot(data=df, aes(x=dose, y=len, fill=sexe)) +
  geom_bar(stat="identity", color="black", position=position_dodge())+
  theme_minimal()
# Use custom colors

# Use brewer color palettes
p + scale_x_continuous(name="Type de libération") +scale_y_continuous(name="Nombre de patients ") +ggtitle("Nombres de patients par type de libération   ")+ theme(
  plot.title = element_text(color="black", size=14, face="bold.italic",hjust = 0.5),
  plot.subtitle = element_text(color="grey", size=14, face="bold",hjust = 0.5),
  axis.title.x = element_text(color="blue", size=10, face="bold"),
  axis.title.y = element_text(color="blue", size=14, face="bold")
)+scale_fill_manual(values=c('#F319A3','#19DCF3'))


on.exit(dbDisconnect(con))

