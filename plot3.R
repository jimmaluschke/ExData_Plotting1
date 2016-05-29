raw_data1 <- read.csv2("./household_power_consumption.txt") # Load data set which is stored in the working directory

raw_data2 <- subset(raw_data1,raw_data1$Date=="1/2/2007" | raw_data1$Date=="2/2/2007") # "We will only be using data from the dates 2007-02-01 and 2007-02-02"

raw_data2[raw_data2=="?"]<- NA # Replaces the missing value character "?" by NA

sm1 <-as.numeric(paste(raw_data2$Sub_metering_1)) # By default the data type of "Global_active_power is "character". This command converts the variable to "numeric" 
sm2 <-as.numeric(paste(raw_data2$Sub_metering_2))
sm3 <-as.numeric(paste(raw_data2$Sub_metering_3))

par(mfrow=c(1,1),mar=c(5.1,4.1,4.1,2.1)) # sets parameters to default 
  
plot(sm1,ylab="Energy sub metering",xlab="",xaxt="n", type="l",col="black") #creates plot with first line
lines(sm2,col="red") # adds second line
lines(sm3,col="blue") # adds third line

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col=c("black", "red","blue"), lty=1:1, cex=.8) # adds legend

dev.copy(png,'plot3.png',width=480,height=480) # saves created plot 
dev.off()