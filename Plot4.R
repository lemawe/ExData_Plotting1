data_electric = read.csv("household_power_consumption.csv")
data_electric$Date = as.Date(x = data_electric$Date)
data_sub = subset(x = data_electric, Date >= as.Date("2007-02-01")& Date <= as.Date("2007-02-02"))
data_sub$DateTime = strptime(paste(data_sub$Date,data_sub$Time),format = "%Y-%m-%d %H:%M:%S")
data_sub$Sub_metering_1 = as.numeric(x = as.character(data_sub$Sub_metering_1))
data_sub$Sub_metering_2 = as.numeric(x = as.character(data_sub$Sub_metering_2))
data_sub$Sub_metering_3 = as.numeric(x = as.character(data_sub$Sub_metering_3))
data_sub$Voltage = as.numeric(x = as.character(data_sub$Voltage))
data_electric$Global_active_power = as.numeric(x = as.character(data_electric$Global_active_power))
data_electric$Global_reactive_power = as.numeric(x = as.character(data_electric$Global_reactive_power))
png(filename = "Plot4.png")
par(mfrow=c(2,2)))
with(data_sub,{plot(x=DateTime,y =Global_active_power,main ="",xlab="",ylab = "Global Active Power (Kilowatts)",type = "l"); 
               plot(x=DateTime,y =Voltage,main ="",ylab = "Voltage",type = "l");
               plot(x=DateTime,y =Sub_metering_1,main ="",xlab="",ylab = "Energy sub metering",type = "l");
               lines(x=DateTime,y =Sub_metering_2,main ="",col="red",type = "l");
               lines(x=DateTime,y =Sub_metering_3,main ="",col="blue",type = "l");
               legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1);
               plot(x=DateTime,y =Global_reactive_power,main ="",ylab = "Global_reactive_power (Kilowatts)",type = "l") })
dev.off()