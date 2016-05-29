raw_data1 <- read.csv2("./household_power_consumption.txt") # Load data set which is stored in the working directory

raw_data2 <- subset(raw_data1,raw_data1$Date=="1/2/2007" | raw_data1$Date=="2/2/2007") # "We will only be using data from the dates 2007-02-01 and 2007-02-02"

raw_data2[raw_data2=="?"]<- NA # Replaces the missing value character "?" by NA

G_a_p <-as.numeric(paste(raw_data2$Global_active_power)) # Since by default "Global_active_power is "character", this converts this variable to "numeric" 

par(mfrow=c(1,1),mar=c(5.1,4.1,4.1,2.1)) # sets parameters to default 

hist(G_a_p,xlab="Global Active Power (kilowatts)",col="red",main="Global Active Power",) # I don't know if whether is required to insert a grey background. If so, par(bg="grey") before this comand would be necessary.

dev.copy(png,'plot1.png',width=480,height=480) # saves created plot 
dev.off()