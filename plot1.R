plot1 <- function(){
  # loadData() must be run first.
  # loadData.R reduces the full data set to only the data from the
  # first two days of February, which is then saved to the file
  # "Feb_power_consumption.txt".  This file is used to create all plots.
  
  # Read the table with the two days from February
  dat <- read.table("./Assignment1/Feb_power_consumption.txt", header = TRUE)
  
  # Set the Title and X-axis label for the plot
  Title <- "Global Active Power"
  xlabel <- "Global Active Power (kilowatts)"
  
  # Open a PNG, create the plot, and close the PNG file
  png("./Assignment1/Plot1.png",width=480,height=480)
  hist(dat$Global_active_power,col="red",main=Title,xlab=xlabel)
  dev.off()
  
}