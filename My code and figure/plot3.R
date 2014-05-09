## This function will make the plot3

plot3 <- function() {
    ## read all time data
    all <- read.table("household_power_consumption.txt", header = TRUE, 
                      colClasses = c("character", "character", "numeric", 
                      "numeric", "numeric", "numeric", "numeric", "numeric", 
                      "numeric"), sep = ";", na.string='?')
    
    ## select the specified dates
    data <- subset(all, as.Date(all$Date, format = "%d/%m/%Y") %in% 
                       as.Date(c("01/02/2007", "02/02/2007"), format = "%d/%m/%Y"))
    
    
    ##combine the date and time
    data$DateTime <- as.POSIXct(paste(data$Date, data$Time), 
                                format="%d/%m/%Y %H:%M:%S")
    
    ## make the plot with 3 data sets, set legends, and export to png
    png(file = "plot3.png", bg = "transparent")
    
    plot(data$DateTime, data$Sub_metering_1, type = "l", xlab = NA,
         ylab = "Energy sub metering", cex.axis = 1, cex.lab = 1)
    lines(data$DateTime, data$Sub_metering_2, type = "l", col = "red")
    lines(data$DateTime, data$Sub_metering_3, type = "l", col = "blue")
    legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
           lty=1, lwd=1, col=c("black", "red", "blue"), cex = 1)
    
    dev.off()
    
}