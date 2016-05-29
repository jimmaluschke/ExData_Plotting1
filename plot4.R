raw_data1 <- read.csv2("./household_power_consumption.txt") # Load data set which is stored in the working directory

raw_data2 <- subset(raw_data1,raw_data1$Date=="1/2/2007" | raw_data1$Date=="2/2/2007") # "We will only be using data from the dates 2007-02-01 and 2007-02-02"

raw_data2[raw_data2=="?"]<- NA # Replaces the missing value character "?" by NA

G_a_p <-as.numeric(paste(raw_data2$Global_active_power)) # By default the data type of "Global_active_power is "character". This command converts the variable to "numeric" 
Volt <-as.numeric(paste(raw_data2$Voltage))
sm1 <-as.numeric(paste(raw_data2$Sub_metering_1)) 
sm2 <-as.numeric(paste(raw_data2$Sub_metering_2))
sm3 <-as.numeric(paste(raw_data2$Sub_metering_3))
grp <-as.numeric(paste(raw_data2$Global_reactive_power))

par(mfrow=c(2,2),mar=c(4.5,4,2,2)) # 4 plots with margin (4.5,4,2,2)

plot(G_a_p,ylab="Global Active Power",xlab="",xaxt="n", type="l") #creates 1st plot

plot(Volt,ylab="Voltage",xlab="datetime",xaxt="n", type="l") #creates 2nd plot

plot(sm1,ylab="Energy sub metering",xlab="",xaxt="n", type="l",col="black") #creates 3rd plot with first line
lines(sm2,col="red") # adds second line
lines(sm3,col="blue") # adds third line

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col=c("black", "red","blue"), lty=1:1, cex=.6) # adds legend to plot 3

plot(grp,ylab="Global_reactive_power",xlab="datetime",xaxt="n", type="l") #creates 4th plot


dev.copy(png,'plot4.png',width=480,height=480) # saves created plot 
dev.off()

