plot2 <- function(){
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
  ylabel <- "Global Active Power (kilowatts)"
  
  # Open a PNG, create the plot, and close the PNG file
  png("./Assignment1/Plot2.png",width=480,height=480)
  plot(dat$Time,dat$Global_active_power,type="l",ylab=ylabel,xlab="")
  dev.off()
  
}