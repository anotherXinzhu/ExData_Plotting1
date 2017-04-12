# Read data
headers<-read.table("household_power_consumption.txt",sep=";",nrows = 1,header = T)
names<-names(headers)
electricdata<-read.table("household_power_consumption.txt",sep=";",skip=66637,nrows=2880,col.names = names, na.strings = "?")

# Construct Plot 1 and save to plot1.png
png(filename = "plot1.png")
hist(electricdata$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()

