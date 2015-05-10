plot1 <- function() {
    
    # install and load the sqldf package
    install.packages("sqldf")
    library(sqldf)
    
    # load and subset the data file
    data <- read.csv2.sql("household_power_consumption.txt", 
                          sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'")
    
    # get the histogram 
    hist(data[, 3], col = "red", main = "Global Active Power",
         xlab = "Global Active Power (kilowatts)")
    
    # save it to png file
    dev.copy(png, file = "plot1.png")
    dev.off()
}