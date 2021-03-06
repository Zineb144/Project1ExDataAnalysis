powerDT <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)
powerDT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")] #scientificnotation 
#POSIXc filtered and graphed by time of day
powerDT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
# Dates set  2007-02-01 & 2007-02-02
powerDT <- powerDT[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot2.png", width=480, height=480)     #plot 2 
plot(x = powerDT[, dateTime]
     , y = powerDT[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()