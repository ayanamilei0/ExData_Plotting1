## This function will make the plot1

plot1 <- function() {
    ## read all time data
    all <- read.table("household_power_consumption.txt", header = TRUE, 
                      sep = ";", na.string='?')
    
    ## select the specified dates
    data <- subset(all, as.Date(all$Date, format = "%d/%m/%Y") %in% 
                   as.Date(c("01/02/2007", "02/02/2007"), format = "%d/%m/%Y"))
    
    ## export to png
    png(file = "plot1.png", bg = "transparent")
    
    ## make a histogram
    ##I read the color in the sample and it's rgb(2571, 0, 7)
    hist(data$Global_active_power, col = rgb(251/255,0,7/255), main = "Global Active Power", 
         xlab = "Global Active Power (kilowatts)") 
    
    dev.off()
}