plot4 <- function(){
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
  
  # Open a PNG, set the parameters
  png("./Assignment1/Plot4.png",width=480,height=480)
  par(mfrow=c(2,2))
  
  # Create first plot
  plot(dat$Time,dat$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
  
  # Create second plot
  with(dat,plot(Time,Voltage,type="l",xlab ="datetime"))
  
  # Create third plot
  with(dat,plot(Time,Sub_metering_1,xlab="",ylab="Energy sub metering",type="l"))
  with(dat,lines(Time,Sub_metering_2,col="red"))
  with(dat,lines(Time,Sub_metering_3,col="blue"))
  legend("topright",lw=1,col=c("black","red","blue"),legend=c(names(dat[7:9])))
  
  # Create fourth plot
  with(dat,plot(Time,Global_reactive_power,type="l",xlab ="datetime"))
  
  # Close the png file
  dev.off()
}