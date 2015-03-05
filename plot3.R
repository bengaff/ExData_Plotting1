# Code used to create "plot3.png" file for Coursera Exploratory Data Analysis course project 1

# Load & clean the data
# 1 - Create memory estimate for 2.1m rows and 9 columns 
#       = 18.9x8x2 = c. 150MB file needs 300MB space. 8GB memory total.
# 2 - Load the data
df <- read.table("household_power_consumption.txt",header=TRUE,sep=";",nrows=2100000,as.is=TRUE)
# 3 - Subset for dates = "01/02/2007" and "02/02/2007"
df <- subset(df,Date=="1/2/2007"|Date=="2/2/2007")
# 4 - Convert date fields using strptime() and as.Date() functions
df$Date <- as.Date(df$Date,"%d/%m/%Y")
x <- paste(df$Date,df$Time)
df$Time <- strptime(x,"%Y-%m-%d %H:%M:%S")
rm(x)
# 5 - Convert numeric fields
df$Global_active_power <- as.numeric(df$Global_active_power)
df$Global_reactive_power <- as.numeric(df$Global_reactive_power)
df$Voltage <- as.numeric(df$Voltage)
df$Global_intensity <- as.numeric(df$Global_intensity)
df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)

# Plot 3 - Energy sub metering
png("plot3.png") # Create png file
plot(df$Time,df$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
points(df$Time,df$Sub_metering_2,type="l",col="red")
points(df$Time,df$Sub_metering_3,type="l",col="blue")
legend("topright",lty=1,col=c("black","blue","red"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off() # Close the PNG file device
