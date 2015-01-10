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
#put them in numerical form
printingData <- as.numeric(datiNew$Global_active_power)
png(filename = "plot1.png", 
    width = 480, height = 480, 
    units = "px", bg = "transparent")
hist(printingData, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     breaks = 12, ylim = c(0, 1200))
dev.off()