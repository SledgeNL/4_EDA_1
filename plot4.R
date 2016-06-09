	## When the data is not yet stored locally, import data with the following 5 lines
#1 if(!file.exists("./data")){dir.create("./data")}
#2 fileUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#3 download.file(fileUrl,destfile="./data/dataset_power_consumption.zip")
#4 HPC <- read.table(unz("./data/dataset_power_consumption.zip", "household_power_consumption.txt"), sep=";", header=TRUE, stringsAsFactors=FALSE, dec=".")
#5 unlink("./data/dataset_power_consumption.zip")

	## When data is not imported and subsetted, contine with the following code
	## Read into R, separator = ";", the file has headers, don't make factors of text, decimal sign is a dot
#6 HPC <- read.table("./data/household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE, dec=".")
	## Make a subset by filtering on the Date. NB the format of date is d/m/yyyy (I don't agree with dd/mm/yyyy in the assignment, that suggests January = "01", which it isn't)
#7 HPC_2 <- HPC[HPC$Date %in% c("1/2/2007", "2/2/2007"),]

	# ---- this code is for the plot at hand: ----
	# Combine date and time in a new variable
HPC_2$DateTime <- strptime(paste(HPC_2$Date, HPC_2$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  
	# make numeric variables out of character variables, replace existing variable
HPC_2$Global_active_power <- as.numeric(HPC_2$Global_active_power)
HPC_2$Sub_metering_1 <- as.numeric(HPC_2$Sub_metering_1)
HPC_2$Sub_metering_2 <- as.numeric(HPC_2$Sub_metering_2)
HPC_2$Sub_metering_3 <- as.numeric(HPC_2$Sub_metering_3)
HPC_2$Global_reactive_power <- as.numeric(HPC_2$Global_reactive_power)
HPC_2$Voltage <- as.numeric(HPC_2$Voltage)

	# initiate making png.file
png("plot4.png", width=480, height=480) 
	# prepare 2 by 2 panel for plots
par (mfrow = c(2,2))
	# construct first plot 
plot(HPC_2$DateTime, HPC_2$Global_active_power, type="l", xlab="Dutch Weekdays :-)", ylab="Global Active Power", cex=0.2) 
	# construct second plot 
plot(HPC_2$DateTime, HPC_2$Voltage, type="l", xlab="datetime", ylab="Voltage") 
	# construct third plot 
plot(HPC_2$DateTime, HPC_2$Sub_metering_1, type="l", col ="black", ylab="Energy sub metering", xlab="Dutch weekdays :-)") 
lines(HPC_2$DateTime, HPC_2$Sub_metering_2, type="l", col="red") 
lines(HPC_2$DateTime, HPC_2$Sub_metering_3, type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), bty="n") 
	# construct fouth plot 
plot(HPC_2$DateTime, HPC_2$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power") 
	# print to file and close
dev.off() 


