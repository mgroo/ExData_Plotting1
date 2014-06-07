
run <- function()
{
    ds <- read.table("data/household_power_consumption.txt",header=TRUE,sep=";" nrows=100)
    
    plot(table(ds[0],dsp[1]))
}