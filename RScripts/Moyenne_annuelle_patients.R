

library(RMySQL)
library(DBI)
library(data.table)
library(tibble)
library(ggplot2)


conn <- dbConnect(MySQL(),
                  user = 'rambam',
                  password = 'rambam',
                  dbname = 'rambam_hospital',
                  port = 3308,
                  host = 'localhost'
)

result <- dbGetQuery(conn, "SELECT department, FLOOR(avg(patients))  as moyenne FROM ( SELECT department, EXTRACT(YEAR FROM entry_date) as year , count(patient_id) as patients from visit_details group by department, year order by department, year ) as M GROUP BY department ORDER BY moyenne DESC
")

ggplot(result)+aes(x=department, y=moyenne)+ggtitle("Moyenne annuelle de patients par département")+geom_bar(stat="identity", fill = "blue4")+labs (x = "départements", y = "Patients", caption = "hêpital de Rambam")+scale_fill_brewer(palette = "Blues")+theme(plot.title = element_text(face = "italic", hjust = 0.5,vjust = 1), plot.caption = element_text(color = "grey",hjust = 1, size = 7))



dbDisconnect(conn)


