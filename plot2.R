plot2 <- function() {
    
    # install and load the sqldf package
    install.packages("sqldf")
    library(sqldf)
    
    # load and subset the data file
    data <- read.csv2.sql("household_power_consumption.txt", 
                          sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'")
    
    # make the plot and modify the axis
    plot(data[, 3], type = "l", ylab = "Global Active Power (kilowatts)", xaxt = "n", xlab = "")
    axis(1, at = c(1, 1441, 2881), labels = c("Thu", "Fri", "Sat"))
    
    # save it to png file
    dev.copy(png, file = "plot2.png")
    dev.off()
}