plot1 <- function()
{
    
    library(sqldf)
    ds <-  read.csv.sql("data/household_power_consumption.txt",sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'",header=TRUE,sep=";",stringsAsFactors = FALSE)
    
    dss <- ds$Global_active_power
    
    #this was needed before i discovered that i only needed a subset of two days :( 
    gsub("?","0",dss)
    dss <- as.numeric(dss)
    dss <- na.omit(dss)
    
    
    # Open plot1.png PNG file
    png("plot1.png", height=480, width=480)
           
   hist(dss,xlab='Global Active Power (kilowatts)',col='red', main="Global Active Power", xlim = c(0,6), ylim = c(0,1200))
   
   # Close the PNG file
   dev.off()
}