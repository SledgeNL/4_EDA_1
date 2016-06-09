	## When the data is not yet stored locally, import data with the following 5 lines
if(!file.exists("./data")){dir.create("./data")}
fileUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./data/dataset_power_consumption.zip")
HPC <- read.table(unz("./data/dataset_power_consumption.zip", "household_power_consumption.txt"), sep=";", header=TRUE, stringsAsFactors=FALSE, dec=".")
unlink("./data/dataset_power_consumption.zip")

	## When data is not imported and subsetted, contine with the following code (6 and 7)
	## Read into R, separator = ";", the file has headers, don't make factors of text, decimal sign is a dot
#6 HPC <- read.table("./data/household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE, dec=".")
	## Make a subset by filtering on the Date. NB the format of date is d/m/yyyy (I don't agree with dd/mm/yyyy in the assignment, that suggests January = "01", which it isn't)
HPC_2 <- HPC[HPC$Date %in% c("1/2/2007", "2/2/2007"),]

	# ---- this code is for the plot at hand: ----

	# make consumption data numeric, overwrite original variable
HPC_2$Global_active_power <- as.numeric(HPC_2$Global_active_power)
	# initiate making png.file
png("plot1.png", width=480, height=480)
	# construct histogram
hist(HPC_2$Global_active_power, col="red", main="Global Active power", xlab ="Global Active Power (kilowatts)")
	# print to file and close
dev.off()
