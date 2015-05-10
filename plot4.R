plot4 <- function() {
    
    # install and load the sqldf package
    install.packages("sqldf")
    library(sqldf)
    
    # load and subset the data file
    data <- read.csv2.sql("household_power_consumption.txt", 
                          sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'")
    
    # make the four plots resp.
    par(mfcol = c(2, 2))
    
    plot(data[, 3], type = "l", ylab = "Global Active Power", xaxt = "n", xlab = "")
    axis(1, at = c(1, 1441, 2881), labels = c("Thu", "Fri", "Sat"))
    
    plot(data[, 7], type = "l", ylab = "Energy sub metering", xaxt = "n", xlab = "", col = "black")
    lines(data[, 8], col = "red")
    lines(data[, 9], col = "blue")
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lty = c(1, 1, 1), col = c("black", "red", "blue"), bty = "n", cex = 0.6)
    axis(1, at = c(1, 1441, 2881), labels = c("Thu", "Fri", "Sat"))
    
    plot(data[, 5], type = "l", ylab = "Voltage", xaxt = "n", xlab = "datetime")
    axis(1, at = c(1, 1441, 2881), labels = c("Thu", "Fri", "Sat"))
    
    plot(data[, 4], type = "l", ylab = "Global_reactive_power", xaxt = "n", xlab = "datetime")
    axis(1, at = c(1, 1441, 2881), labels = c("Thu", "Fri", "Sat"))
    
    # save it to png file
    dev.copy(png, file = "plot4.png")
    dev.off()
}