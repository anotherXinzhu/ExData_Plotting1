# Read the data
headers<-read.table("household_power_consumption.txt",sep=";",nrows = 1,header = T)
names<-names(headers)
electricdata<-read.table("household_power_consumption.txt",sep=";",skip=66637,nrows=2880,col.names = names, na.strings = "?")

# Add an additional column to combine Date and Time
electricdata<-electricdata %>% mutate(DateTime=paste(Date,Time))
electricdata$DateTime<-as.POSIXct(electricdata$DateTime,format="%d/%m/%Y %H:%M:%S")

# Construct plot2 in plot2.png
png(filename = "plot2.png")
with(electricdata,plot(Global_active_power~DateTime,type="l",ylab="Global Active Power (kilowatts)",xlab=""))
dev.off()