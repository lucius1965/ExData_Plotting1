#setwd on my system
setwd("F:/ATTUALE/data_scienze/ExData_Plotting1")
## Load the dataset.
fileNome <- "./data/household_power_consumption.txt"
#read to last row we need for our goal (nrows = 69517)
dati <- read.table(fileNome,
                   header = TRUE,
                   sep = ";",
                   colClasses = c("character", "character", rep("numeric",7)),
                   nrows = 69517, na = "?")
attach (dati)

## The data for the two days.
subset <- Date == "1/2/2007" | Date == "2/2/2007" 
datiNew <- dati[subset, ]
attach(datiNew)

#add another column for DateTime in required format
appoggio <- paste(Date, Time) #create the vector
#then add it to table in proper format
datiNew$DateTime <- strptime(appoggio, "%d/%m/%Y %H:%M:%S")

rownames(datiNew) <- 1:nrow(datiNew)
attach(datiNew)

png(filename = "plot4.png", 
    width = 480, 
    height = 480,
    units = "px", 
    bg = "transparent")
#set parameter of device 
par(mfrow = c(2, 2))

## First to the top in the left
plot(DateTime, Global_active_power, 
     type = "l",
     xlab = "", 
     ylab = "Global Active Power")

## To the right on top
plot(DateTime, Voltage,
     type = "l",
     xlab = "datetime", ylab = "Voltage")

## Under to left
plot(DateTime, Sub_metering_1, 
     type = "l",
     col = "black",
     xlab = "", 
     ylab = "Energy sub metering")

lines(DateTime, Sub_metering_2, col = "red")

lines(DateTime, Sub_metering_3, col = "blue")

legend("topright", 
       bty = "n", #no box around the legend
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)
## Bottom-right
plot(DateTime, Global_reactive_power, 
     type = "l",
     col = "black",
     xlab = "datetime", ylab = colnames(datiNew)[4])

dev.off()
