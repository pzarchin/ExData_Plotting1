
##set data file path
fpath <- "C:/Users/pzarchin/OneDrive - Deloitte (O365D)/Documents/household_power_consumption.txt"

##read full data file
fdt <- read.csv(fpath, header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

##clean data & Subset
sdt <- subset(fdt, Date %in% c("1/2/2007","2/2/2007"))
sdt$Date <- as.Date(sdt$Date, format="%d/%m/%Y")

##create graph
hist(sdt$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")


##save graph
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()
