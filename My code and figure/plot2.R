## This function will make the plot2

plot2 <- function() {
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
    
    ## make the plot and export to png
    png(file = "plot2.png", bg = "transparent")
    plot(data$DateTime, data$Global_active_power, type = "l", xlab = NA,
         ylab = "Global Active Power (kilowatts)")
    dev.off()
}