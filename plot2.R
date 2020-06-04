##set data file path
fpath <- "C:/Users/pzarchin/OneDrive - Deloitte (O365D)/Documents/household_power_consumption.txt"

##read full data file
fdt <- read.csv(fpath, header = T, sep = ';', na.strings = "?", nrows = 2075259, check.names = F, stringsAsFactors = F, comment.char = "", quote = '\"')
fdt$Date <- as.Date(fdt$Date, format = "%d/%m/%Y")

## Subsetting the data
data <- subset(fdt, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(fdt)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Generating Plot 2
plot(data$Global_active_power ~ data$Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

##save graph
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()


