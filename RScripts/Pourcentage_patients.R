library(data.table)
library(tibble)
library(ggplot2)
library(RColorBrewer)


old_par <- par(no.readonly = TRUE)
result <- dbGetQuery(conn, "SELECT department, count(department) as iteration from visit_details group by department order by iteration desc limit 10")

freq <- result$iteration
pie(freq,labels =paste(names(table(result$department)),"\n",round(result$iteration*100/752160,1), "%"),
    radius = 0.8,
    cex = 0.7,col = brewer.pal(length(freq),"BrBG"),main = "Répartition des patients dans les départements")
dbDisconnect(conn)

