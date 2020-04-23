library("data.table")

#directory <- paste(getwd(),'Exploratory_Data_Analysis','C4W1','household_power_consumption.txt',sep = '/')
directory <- paste(getwd(),'household_power_consumption.txt',sep = '/')

#importing data
dat <- fread(input = directory, na.strings="?")

# Change Date Column to Date Type
dat[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Filter Dates for 2007-02-01 and 2007-02-02
dat <- dat[(Date >= "2007-02-01") & (Date < "2007-02-03")]

png("plot1.png", width=480, height=480)

## Plot 1
hist(dat[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()


