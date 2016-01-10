loadData <- function(){
  library(data.table)
  
  #Loading data from these dates
  startDate <- "1/2/2007"
  endDate <- "3/2/2007"
  
  #read in the header row
  header <- read.table("./Assignment1/household_power_consumption.txt",nrows=1,sep=";",colClasses="character")
  
  #Calculate first row with start date and number of lines to read in
  firstRow <- grep(startDate, readLines("./Assignment1/household_power_consumption.txt"),fixed=TRUE)[1]
  totalRows <- grep(endDate,readLines("./Assignment1/household_power_consumption.txt"),fixed=TRUE)[1] - 
    grep(startDate, readLines("./Assignment1/household_power_consumption.txt"),fixed=TRUE)[1]
  
  #Read in the data for the selected dates
  dat <- read.table("./Assignment1/household_power_consumption.txt",header=FALSE, col.names = as.list(header),
                    skip=(firstRow-1),nrows=totalRows,sep=";",na.strings = "?")
  
  #save new table to file
  write.table(dat,"./Assignment1/Feb_power_consumption.txt",row.names=FALSE)
  
  #close the connection
  closeAllConnections()
}