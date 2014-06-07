plot2 <- function()
{
    
    Sys.setlocale("LC_TIME", "English")
    
    if(!file.exists("data/mydataset.txt")){
        library(sqldf)
        ds <-  read.csv.sql("data/household_power_consumption.txt",sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'",header=TRUE,sep=";",stringsAsFactors = FALSE)
        write.table(ds, "data/mydataset.txt", sep = ";",row.names=FALSE)
    } 

    ds <-  read.table("data/mydataset.txt",,header=TRUE,sep=";",stringsAsFactors = FALSE)
    
    
   # hist(dss,xlab='Global Active Power (kilowatts)',col='red', main="Global Active Power", xlim = c(0,6), ylim = c(0,1200))
   
   #convert to date
   ds$Date <- as.Date(ds$Date,"%d/%m/%Y")
   
   ds$dayofweek <- weekdays(as.Date(ds$Date))
   
  
   newcol <- paste(ds$Date, ds$Time)
   
   
 #  "%d/%m/%Y %H:%M:%S"
   datetime <- strptime(newcol, "%Y-%m-%d %H:%M:%S")
 

   
 

   ds <- cbind(ds,datetime)


   #plot(ds$Global_active_power, un)
  
   #ds$Global_active_power <- as.numeric(ds$Global_active_power)
  
   #plot(ds$newcol, ds$Global_active_power,type="n", xaxt = "n")
   #lines(ds$newcol, ds$Global_active_power, type="l") 
   #axis(1, at=ds$dayofweek, labels=c("Thu","Fri","Sat"))
   
 # Open plot2.png PNG file
 png("plot2.png", height=480, width=480)

  # Build time series overview
  plot(ds$datetime,
       ds$Global_active_power,
       pch=NA,
       xlab="",
       ylab="Global Active Power (kilowatts)")
  lines(ds$datetime, ds$Global_active_power)
  
 # Close the PNG file
 dev.off()
}