
#### porcentage des patients passée par les argances par rapport à leurs age  ###

library(dbConnect)
con = dbConnect(MySQL(),dbname='hopital',user='root',password='Racheletmoi2',host='localhost')
rq=dbGetQuery(con,"SELECT COUNT(*) FROM visits WHERE entry_group='1'")
rq=dbGetQuery(con,"SELECT COUNT(*) FROM visits WHERE entry_group='1' AND
 age_years<11")
r11<-(rq$`COUNT(*)`*100)/r
rq=dbGetQuery(con,"SELECT COUNT(*) FROM visits WHERE entry_group='1' AND
age_years>=11 AND age_years<21")
r21<-(rq$`COUNT(*)`*100)/r
rq=dbGetQuery(con,"SELECT COUNT(*) FROM visits WHERE entry_group='1' AND
age_years>=21 AND age_years<32")
r32<-(rq$`COUNT(*)`*100)/r
rq=dbGetQuery(con,"SELECT COUNT(*) FROM visits WHERE entry_group='1' AND
age_years>=32 AND age_years<43")
r43<-(rq$`COUNT(*)`*100)/r
rq=dbGetQuery(con,"SELECT COUNT(*) FROM visits WHERE entry_group='1' AND
age_years>=43 AND age_years<54")
r54<-(rq$`COUNT(*)`*100)/r
rq=dbGetQuery(con,"SELECT COUNT(*) FROM visits WHERE entry_group='1' AND
age_years>=54 AND age_years<65")
r65<-(rq$`COUNT(*)`*100)/r
rq=dbGetQuery(con,"SELECT COUNT(*) FROM visits WHERE entry_group='1' AND
age_years>=65 AND age_years<76")
r76<-(rq$`COUNT(*)`*100)/r
rq=dbGetQuery(con,"SELECT COUNT(*) FROM visits WHERE entry_group='1' AND
age_years>=76 AND age_years<87")
r87<-(rq$`COUNT(*)`*100)/r
rq=dbGetQuery(con,"SELECT COUNT(*) FROM visits WHERE entry_group='1' AND
age_years>=87 AND age_years<100")
r100<-(rq$`COUNT(*)`*100)/r
H<-c(r11$`COUNT(*)`,r21$`COUNT(*)`,r32$`COUNT(*)`,r43$`COUNT(*)`,r54$`COUNT(*)`,r65$`COUNT(*)`,r76$`COUNT(*)`,r87$`COUNT(*)`,r100$`COUNT(*)`)
M<-c("0-10","11-21","22-32","33-43","44-54","55-65","66-76","77-87","88-100")
pie(H,labels = paste(M,"\n",round(prop.table(H)*100,1),"%") ,  radius =1.08,cex=0.8,main = " porcentage des patients passée par les urgances  \n par tranche d'âge ")



on.exit(dbDisconnect(con))
