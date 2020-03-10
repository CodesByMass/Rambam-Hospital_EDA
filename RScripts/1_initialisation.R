library(RMySQL)
library(DBI)

conn <- dbConnect(MySQL(),
                  user = 'rambam',
                  password = 'rambam',
                 dbname = 'rambam_hospital',
                 port = 3308,
                 host = 'localhost'
               )


