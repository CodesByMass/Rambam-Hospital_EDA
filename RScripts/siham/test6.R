library(dbConnect)
library(ggplot2)
library(dplyr)
library(hrbrthemes)
con = dbConnect(MySQL(),dbname='hopital',user='root',password='Racheletmoi2',host='localhost')

###########################################################################################
rq=dbGetQuery(con,"SELECT COUNT(*),HOUR(v.entry_date) FROM visit_details v WHERE v.department=1 and  month(v.entry_date)=7  and YEAR(v.entry_date)=2004 GROUP BY HOUR(v.entry_date);
")
rq0=dbGetQuery(con,"SELECT COUNT(*)/24 as valeur   FROM visit_details v WHERE v.department=1  and dayofweek(v.entry_date)=6 and YEAR(v.entry_date)=2004  GROUP BY HOUR(v.entry_date)")
rq0

rq

d<-data.frame(dose=c(rq$`HOUR(v.entry_date)`),len=c(rq$`COUNT(*)`) )


  ggplot( data=d ,aes(x=dose, y=len)) +
  geom_line( color="#993333" , alpha = 1,
             size = 1.2) +
    labs(x = "Heure", 
         y = "Nombres de patients",subtitle = " Departement \"Emergency Internal Medicine Unit\" ",
         title = "Nombres de patients qui arrivent en heure pour juillet 2004 ")+
   scale_color_discrete(labels = c("nombres de patients hospitaliser"))+
    scale_x_continuous(name="Heure") +
    scale_y_continuous(name="Nombre de patients ")+ theme(
    plot.title = element_text(color="black", size=14, face="bold.italic",hjust = 0.5),
    plot.subtitle = element_text(color="grey", size=14, face="bold",hjust = 0.5),
    axis.title.x = element_text(color="blue", size=10, face="bold"),
    axis.title.y = element_text(color="blue", size=14, face="bold")
  )

  ###########################################################################################
  rq=dbGetQuery(con,"SELECT COUNT(*),HOUR(v.entry_date) FROM visit_details v WHERE v.department=1 and  month(v.entry_date)=5  and YEAR(v.entry_date)=2004 GROUP BY HOUR(v.entry_date);
")
  rq0=dbGetQuery(con,"SELECT COUNT(*)/24 as valeur   FROM visit_details v WHERE v.department=1  and dayofweek(v.entry_date)=6 and YEAR(v.entry_date)=2004  GROUP BY HOUR(v.entry_date)")
  
  d<-data.frame(dose=c(rq$`HOUR(v.entry_date)`),len=c(rq$`COUNT(*)`) )
  
  
  ggplot( data=d ,aes(x=dose, y=len)) +
    geom_line( color="#993333" , alpha = 1,
               size = 1.2) +
    labs(x = "Heure", 
         y = "Nombres de patients",subtitle = " Departement \"Emergency Internal Medicine Unit\" ",
         title = "Nombres de patients qui arrivent  en heure pour juin 2004 ")+
    scale_color_discrete(labels = c("nombres de patients hospitaliser"))+
    scale_x_continuous(name="Heure") +
    scale_y_continuous(name="Nombre de patients ")+ theme(
      plot.title = element_text(color="black", size=14, face="bold.italic",hjust = 0.5),
      plot.subtitle = element_text(color="grey", size=14, face="bold",hjust = 0.5),
      axis.title.x = element_text(color="blue", size=10, face="bold"),
      axis.title.y = element_text(color="blue", size=14, face="bold")
    )
  
  ###########################################################################################
  rq=dbGetQuery(con,"SELECT COUNT(*),HOUR(v.entry_date) FROM visit_details v WHERE v.department=1 and  month(v.entry_date)=9  and YEAR(v.entry_date)=2004 GROUP BY HOUR(v.entry_date);
")
  rq0=dbGetQuery(con,"SELECT COUNT(*)/24 as valeur   FROM visit_details v WHERE v.department=1  and dayofweek(v.entry_date)=6 and YEAR(v.entry_date)=2004  GROUP BY HOUR(v.entry_date)")
  
  d<-data.frame(dose=c(rq$`HOUR(v.entry_date)`),len=c(rq$`COUNT(*)`) )
  
  
  ggplot( data=d ,aes(x=dose, y=len)) +
    geom_line( color="#993333" , alpha = 1,
               size = 1.2) +
    labs(x = "Heure", 
         y = "Nombres de patients",subtitle = " Departement \"Emergency Internal Medicine Unit\" ",
         title = "Nombres de patients qui arrivent  en heure \n pour septembre 2004 ")+
    scale_color_discrete(labels = c("nombres de patients hospitaliser"))+
    scale_x_continuous(name="Heure") +
    scale_y_continuous(name="Nombre de patients ")+ theme(
      plot.title = element_text(color="black", size=14, face="bold.italic",hjust = 0.5),
      plot.subtitle = element_text(color="grey", size=14, face="bold",hjust = 0.5),
      axis.title.x = element_text(color="blue", size=10, face="bold"),
      axis.title.y = element_text(color="blue", size=14, face="bold")
    )
  
  ###########################################################################################
  rq=dbGetQuery(con,"SELECT COUNT(*),HOUR(v.entry_date) FROM visit_details v WHERE v.department=1 and  month(v.entry_date)=7  and YEAR(v.entry_date)=2004 GROUP BY HOUR(v.entry_date);
")
  rq0=dbGetQuery(con,"SELECT COUNT(*)/24 as valeur   FROM visit_details v WHERE v.department=1  and dayofweek(v.entry_date)=6 and YEAR(v.entry_date)=2004  GROUP BY HOUR(v.entry_date)")
  d<-data.frame(dose=c(rq$`HOUR(v.entry_date)`),len=c(rq$`COUNT(*)`) )
  
  
  ggplot( data=d ,aes(x=dose, y=len)) +
    geom_line( color="#993333" , alpha = 1,
               size = 1.2) +
    labs(x = "Heure", 
         y = "Nombres de patients",subtitle = " Departement \"Emergency Internal Medicine Unit\" ",
         title = "Nombres de patients qui arrivent en heure pour juillet 2004 ")+
    scale_color_discrete(labels = c("nombres de patients hospitaliser"))+
    scale_x_continuous(name="Heure") +
    scale_y_continuous(name="Nombre de patients ")+ theme(
      plot.title = element_text(color="black", size=14, face="bold.italic",hjust = 0.5),
      plot.subtitle = element_text(color="grey", size=14, face="bold",hjust = 0.5),
      axis.title.x = element_text(color="blue", size=10, face="bold"),
      axis.title.y = element_text(color="blue", size=14, face="bold")
    )
  
  ###########################################################################################
  rq=dbGetQuery(con,"SELECT COUNT(*),HOUR(v.entry_date) FROM visit_details v WHERE v.department=1 and  month(v.entry_date)=5  and YEAR(v.entry_date)=2004 GROUP BY HOUR(v.entry_date);
")
  rq0=dbGetQuery(con,"SELECT COUNT(*)/24 as valeur   FROM visit_details v WHERE v.department=1  and dayofweek(v.entry_date)=6 and YEAR(v.entry_date)=2004  GROUP BY HOUR(v.entry_date)")
  d<-data.frame(dose=c(rq$`HOUR(v.entry_date)`),len=c(rq$`COUNT(*)`) )
  
  
  ggplot( data=d ,aes(x=dose, y=len)) +
    geom_line( color="#993333" , alpha = 1,
               size = 1.2) +
    labs(x = "Heure", 
         y = "Nombres de patients",subtitle = " Departement \"Emergency Internal Medicine Unit\" ",
         title = "Nombres de patients qui arrivent  en heure pour juin 2004 ")+
    scale_color_discrete(labels = c("nombres de patients hospitaliser"))+
    scale_x_continuous(name="Heure") +
    scale_y_continuous(name="Nombre de patients ")+ theme(
      plot.title = element_text(color="black", size=14, face="bold.italic",hjust = 0.5),
      plot.subtitle = element_text(color="grey", size=14, face="bold",hjust = 0.5),
      axis.title.x = element_text(color="blue", size=10, face="bold"),
      axis.title.y = element_text(color="blue", size=14, face="bold")
    )
  
  ###########################################################################################
  rq=dbGetQuery(con,"SELECT COUNT(*),HOUR(v.entry_date) FROM visit_details v WHERE v.department=1 and  month(v.entry_date)=1  and YEAR(v.entry_date)=2004 GROUP BY HOUR(v.entry_date);
")
  rq0=dbGetQuery(con,"SELECT COUNT(*)/24 as valeur   FROM visit_details v WHERE v.department=1  and dayofweek(v.entry_date)=1 and YEAR(v.entry_date)=2004  GROUP BY HOUR(v.entry_date)")

  
  d<-data.frame(dose=c(rq$`HOUR(v.entry_date)`),len=c(rq$`COUNT(*)`) )
  
  
  ggplot( data=d ,aes(x=dose, y=len)) +
    geom_line( color="#993333" , alpha = 1,
               size = 1.2) +
    labs(x = "Heure", 
         y = "Nombres de patients",subtitle = " Departement \"Emergency Internal Medicine Unit\" ",
         title = "Nombres de patients qui arrivent  en heure \n pour janvier 2004 ")+
    scale_color_discrete(labels = c("nombres de patients hospitaliser"))+
    scale_x_continuous(name="Heure") +
    scale_y_continuous(name="Nombre de patients ")+ theme(
      plot.title = element_text(color="black", size=14, face="bold.italic",hjust = 0.5),
      plot.subtitle = element_text(color="grey", size=14, face="bold",hjust = 0.5),
      axis.title.x = element_text(color="blue", size=10, face="bold"),
      axis.title.y = element_text(color="blue", size=14, face="bold")
    )
  
  