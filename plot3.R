plot3 <- function()
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
    

    # Calculate range from 0 to max value of Sub_metering_1 2 and 3
    g_range <- range(0, ds$Sub_metering_1, ds$Sub_metering_2, ds$Sub_metering_3)
    
    
    # Open plot3.png PNG file
    png("plot3.png", height=480, width=480)
    
    
    # Build time series overview
    plot(ds$datetime,
         ds$Sub_metering_3,
         pch=NA,
         xlab="",
         ylim=g_range,
         ylab="Energy sub metering")
    
    lines(ds$datetime, ds$Sub_metering_1,col="black")
    lines(ds$datetime, ds$Sub_metering_2,col="red")
    lines(ds$datetime, ds$Sub_metering_3,col="blue")
    legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lty=1)
    
    # Close the PNG file
    dev.off() 
    
}