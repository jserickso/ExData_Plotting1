plot3 <- function(){
  # loadData() must be run first.
  # loadData.R reduces the full data set to only the data from the
  # first two days of February, which is then saved to the file
  # "Feb_power_consumption.txt".  This file is used to create all plots.
  
  # Read the table with the two days from February
  dat <- read.table("./Assignment1/Feb_power_consumption.txt", header = TRUE)
  
  # Fix the Date and Time formats
  dat$Date <- as.Date(dat$Date,"%d/%m/%Y")
  dat$Time <- paste(dat$Date,dat$Time)
  dat$Time <- strptime(dat$Time,"%Y-%m-%d %H:%M:%S")
  
  # Set the y-axis labels
  ylabel <- "Energy sub metering"
  
  # Open a PNG, create the plot, and close the PNG file
  png("./Assignment1/Plot3.png",width=480,height=480)
  with(dat,plot(Time,Sub_metering_1,xlab="",ylab=ylabel,type="l"))
  with(dat,lines(Time,Sub_metering_2,col="red"))
  with(dat,lines(Time,Sub_metering_3,col="blue"))
  legend("topright",lw=1,col=c("black","red","blue"),legend=c(names(dat[7:9])))
  dev.off()
  
}