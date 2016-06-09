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
	# make active_power a numeric variable, replace existing variable
HPC_2$Global_active_power <- as.numeric(HPC_2$Global_active_power)
	# initiate making png.file
png("plot2.png", width=480, height=480) 
	# construct histogram
plot(HPC_2$DateTime, HPC_2$Global_active_power, type="l", xlab="Dutch Weekdays :-)", ylab="Global Active Power (kilowatts)") 
	# print to file and close
dev.off() 

