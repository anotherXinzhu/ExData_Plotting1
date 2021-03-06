# Read the data
headers<-read.table("household_power_consumption.txt",sep=";",nrows = 1,header = T)
names<-names(headers)
electricdata<-read.table("household_power_consumption.txt",sep=";",skip=66637,nrows=2880,col.names = names, na.strings = "?")

# Add an additional column to combine Date and Time
electricdata<-electricdata %>% mutate(DateTime=paste(Date,Time))
electricdata$DateTime<-as.POSIXct(electricdata$DateTime,format="%d/%m/%Y %H:%M:%S")

# Create plot3 in plot3.png
png(filename = "plot3.png")
with(electricdata, plot(DateTime,Sub_metering_1,type="l",xlab="", ylab="Energy sub metering"))
with(electricdata,lines(DateTime,Sub_metering_2,type="l",col="red"))
with(electricdata,lines(DateTime,Sub_metering_3,type="l",col="blue"))
legend("topright",lty=1,col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")) 
dev.off()

