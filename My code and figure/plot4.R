## This function will make the plot4

plot4 <- function() {
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
    
    ## export to png
    png(file = "plot4.png")
    ## set the plot with 2 rows and 2 columns, filling in columns first
    par(mfcol = c(2, 2), bg = "transparent", lwd = 0.75)
    
    ## 1st plot: Global_active_power
    plot(data$DateTime, data$Global_active_power, type = "l", xlab = NA,
         ylab = "Global Active Power")
    
    ## 2nd plot: 3 sub meterings, legend box off
    plot(data$DateTime, data$Sub_metering_1, type = "l", xlab = NA,
         ylab = "Energy sub metering", cex.axis = 1, cex.lab = 1)
    lines(data$DateTime, data$Sub_metering_2, type = "l", col = "red")
    lines(data$DateTime, data$Sub_metering_3, type = "l", col = "blue")
    legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n",
           lty=1, lwd=1, col=c("black", "red", "blue"), cex = 1)
    
    ## 3rd plot: Voltage
    plot(data$DateTime, data$Voltage, type = "l", xlab = "datetime",
         ylab = "Voltage")
    
    ## 4th plot: Global_reactive_power
    plot(data$DateTime, data$Global_reactive_power, type = "l", xlab = "datetime",
         ylab = "Global_reactive_power")
    
    dev.off()
    
}