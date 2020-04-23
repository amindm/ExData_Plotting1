library("data.table")

#directory <- paste(getwd(),'Exploratory_Data_Analysis','C4W1','household_power_consumption.txt',sep = '/')
directory <- paste(getwd(),'household_power_consumption.txt',sep = '/')

#importing data
dat <- fread(input = directory, na.strings="?")


# Making a POSIXct date capable of being filtered and graphed by time of day
dat[, Timestamp := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter Dates for 2007-02-01 and 2007-02-02
dat <- dat[(Timestamp >= "2007-02-01") & (Timestamp < "2007-02-03")]

png("plot2.png", width=480, height=480)

## Plot 2
plot(x = dat[, Timestamp]
     , y = dat[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
