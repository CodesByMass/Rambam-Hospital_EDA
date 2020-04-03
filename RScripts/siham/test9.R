library(ggplot2)
library(dplyr)
library(hrbrthemes)
library(dbConnect)
con = dbConnect(MySQL(),dbname='hopital',user='root',password='Racheletmoi2',host='localhost')
rq0=dbGetQuery(con,"SELECT v.department  FROM visit_details v WHERE v.department between 1 and 60 and  dayofweek(v.entry_date)=6  and month(v.entry_date)=1 and YEAR(v.entry_date)=2004 GROUP BY v.department  order by v.department;
")
rq1=dbGetQuery(con,"SELECT v.department,COUNT(*)FROM visit_details v WHERE v.department between 1 and 60 and  dayofweek(v.entry_date)=6  and month(v.entry_date)=1  and YEAR(v.entry_date)=2004 GROUP BY v.department order by v.department ;
")
# Create data
Departement<-rq0$department
data <- data.frame(
  name=Departement,  
  value=rq1$`COUNT(*)`
)

# Barplot
ggplot(data, aes(x=name, y=value)) + 
  geom_bar(stat = "identity", width=0.8, color="#0A4980", fill="#0A4980")+ scale_x_continuous(name="Departement") +scale_y_continuous(name="Nombre de patients ")+
  ggtitle("Nombres de patients arrivent aux 60 premiers departements  \n les vendredis de janvier 2004  ")+
  theme(plot.title = element_text(color="black", size=14, face="bold.italic",hjust = 0.5),axis.title.x = element_text(color="blue", size=14, face="bold"),
    axis.title.y = element_text(color="blue", size=14, face="bold"))

###########################################################################################"

rq0=dbGetQuery(con,"SELECT v.department  FROM visit_details v WHERE v.department between 1 and 60 and  dayofweek(v.entry_date)=7  and month(v.entry_date)=1 and YEAR(v.entry_date)=2004 GROUP BY v.department  order by v.department;
")
rq1=dbGetQuery(con,"SELECT v.department,COUNT(*) FROM visit_details v WHERE v.department between 1 and 60 and  dayofweek(v.entry_date)=7  and month(v.entry_date)=1  and YEAR(v.entry_date)=2004 GROUP BY v.department order by v.department ;
")
# Create data
data <- data.frame(
  name=rq0$department,  
  value=rq1$`COUNT(*)`
)

# Barplot
ggplot(data, aes(x=name, y=value)) + 
  geom_bar(stat = "identity", width=0.8, color="#0A4980", fill="#0A4980")+ scale_x_continuous(name="Departement") +scale_y_continuous(name="Nombre de patients ")+
  ggtitle("Nombres de patients arrivent aux 60 premiers departements  \n les samedis de janvier 2004  ")+
  theme(plot.title = element_text(color="black", size=14, face="bold.italic",hjust = 0.5),axis.title.x = element_text(color="blue", size=14, face="bold"),
        axis.title.y = element_text(color="blue", size=14, face="bold"))

###########################################################################################"

rq0=dbGetQuery(con,"SELECT v.department  FROM visit_details v WHERE v.department between 1 and 60 and  dayofweek(v.entry_date)=1  and month(v.entry_date)=1 and YEAR(v.entry_date)=2004 GROUP BY v.department  order by v.department;
")
rq1=dbGetQuery(con,"SELECT v.department,COUNT(*) FROM visit_details v WHERE v.department between 1 and 60 and  dayofweek(v.entry_date)=1  and month(v.entry_date)=1  and YEAR(v.entry_date)=2004 GROUP BY v.department order by v.department ;
")
# Create data
data <- data.frame(
  name=rq0$department,  
  value=rq1$`COUNT(*)`
)

# Barplot
ggplot(data, aes(x=name, y=value,colour = name, fill = name)) + 
  geom_bar(stat = "identity", width=0.8)+ scale_x_continuous(name="Departements") +scale_y_continuous(name="Nombre de patients ")+
  ggtitle("Nombres de patients arrivent aux 60 premiers departements \n  les dimanches de Janvier 2004  ")+ theme(plot.title = element_text(color="black", size=14, face="bold.italic",hjust = 0.5),axis.title.x = element_text(color="blue", size=14, face="bold"),
                                                                                                                    axis.title.y = element_text(color="#993333", size=14, face="bold"))

###########################################################################################"

rq0=dbGetQuery(con,"SELECT v.department  FROM visit_details v WHERE v.department between 1 and 60 and  dayofweek(v.entry_date)=2  and month(v.entry_date)=1 and YEAR(v.entry_date)=2004 GROUP BY v.department  order by v.department;
")
rq1=dbGetQuery(con,"SELECT v.department,COUNT(*) FROM visit_details v WHERE v.department between 1 and 60 and  dayofweek(v.entry_date)=2  and month(v.entry_date)=1  and YEAR(v.entry_date)=2004 GROUP BY v.department order by v.department ;
")
# Create data
data <- data.frame(
  name=rq0$department,  
  value=rq1$`COUNT(*)`
)

# Barplot
ggplot(data, aes(x=name, y=value)) + 
  geom_bar(stat = "identity", width=0.8, color="#0A4980", fill="#0A4980")+ scale_x_continuous(name="Departement") +scale_y_continuous(name="Nombre de patients ")+
  ggtitle("Nombres de patients arrivent aux 60 premiers departements  \n les lundis de janvier 2004  ")+
  theme(plot.title = element_text(color="black", size=14, face="bold.italic",hjust = 0.5),axis.title.x = element_text(color="blue", size=14, face="bold"),
        axis.title.y = element_text(color="blue", size=14, face="bold"))


###########################################################################################"

rq0=dbGetQuery(con,"SELECT v.department  FROM visit_details v WHERE v.department between 1 and 60 and  dayofweek(v.entry_date)=3 and month(v.entry_date)=1 and YEAR(v.entry_date)=2004 GROUP BY v.department  order by v.department;
")
rq1=dbGetQuery(con,"SELECT v.department,COUNT(*) FROM visit_details v WHERE v.department between 1 and 60 and  dayofweek(v.entry_date)=3  and month(v.entry_date)=1  and YEAR(v.entry_date)=2004 GROUP BY v.department order by v.department ;
")
# Create data
data <- data.frame(
  name=rq0$department,  
  value=rq1$`COUNT(*)`
)

# Barplot
ggplot(data, aes(x=name, y=value)) + 
  geom_bar(stat = "identity", width=0.8, color="#0A4980", fill="#0A4980")+ scale_x_continuous(name="Departement") +scale_y_continuous(name="Nombre de patients ")+
  ggtitle("Nombres de patients arrivent aux 60 premiers departements  \n les mardis de janvier 2004  ")+
  theme(plot.title = element_text(color="black", size=14, face="bold.italic",hjust = 0.5),axis.title.x = element_text(color="blue", size=14, face="bold"),
        axis.title.y = element_text(color="blue", size=14, face="bold"))
axis.title.y = element_text(color="#993333", size=14, face="bold"))
###########################################################################################"

rq0=dbGetQuery(con,"SELECT v.department  FROM visit_details v WHERE v.department between 1 and 60 and  dayofweek(v.entry_date)=4 and month(v.entry_date)=1 and YEAR(v.entry_date)=2004 GROUP BY v.department  order by v.department;
")
rq1=dbGetQuery(con,"SELECT v.department,COUNT(*) FROM visit_details v WHERE v.department between 1 and 60 and  dayofweek(v.entry_date)=4  and month(v.entry_date)=1  and YEAR(v.entry_date)=2004 GROUP BY v.department order by v.department ;
")
# Create data
data <- data.frame(
  name=rq0$department,  
  value=rq1$`COUNT(*)`
)
# Barplot
ggplot(data, aes(x=name, y=value)) + 
  geom_bar(stat = "identity", width=0.8, color="#0A4980", fill="#0A4980")+ scale_x_continuous(name="Departement") +scale_y_continuous(name="Nombre de patients ")+
  ggtitle("Nombres de patients arrivent aux 60 premiers departements  \n les mercredis de janvier 2004  ")+
  theme(plot.title = element_text(color="black", size=14, face="bold.italic",hjust = 0.5),axis.title.x = element_text(color="blue", size=14, face="bold"),
        axis.title.y = element_text(color="blue", size=14, face="bold"))


###########################################################################################"

rq0=dbGetQuery(con,"SELECT v.department  FROM visit_details v WHERE v.department between 1 and 60 and  dayofweek(v.entry_date)=5  and month(v.entry_date)=1 and YEAR(v.entry_date)=2004 GROUP BY v.department  order by v.department;
")
rq1=dbGetQuery(con,"SELECT v.department,COUNT(*) FROM visit_details v WHERE v.department between 1 and 60 and  dayofweek(v.entry_date)=5  and month(v.entry_date)=1  and YEAR(v.entry_date)=2004 GROUP BY v.department order by v.department ;
")
# Create data
data <- data.frame(
  name=rq0$department,  
  value=rq1$`COUNT(*)`
)

# Barplot
ggplot(data, aes(x=name, y=value)) + 
  geom_bar(stat = "identity", width=0.8, color="#0A4980", fill="#0A4980")+ scale_x_continuous(name="Departement") +scale_y_continuous(name="Nombre de patients ")+
  ggtitle("Nombres de patients arrivent aux 60 premiers departements  \n les jeudis de janvier 2004  ")+
  theme(plot.title = element_text(color="black", size=14, face="bold.italic",hjust = 0.5),axis.title.x = element_text(color="blue", size=14, face="bold"),
        axis.title.y = element_text(color="blue", size=14, face="bold"))


