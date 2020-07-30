#####################################################################################
# Time Series Forecast on US GDP 1960 - 2019 dataset
# GDP of historic data is in account of current US Dollars $

# U.S. Bureau of Economic Analysis, Gross Domestic Product [GDP], retrieved from FRED, 
# Federal Reserve Bank of St. Louis; https://fred.stlouisfed.org/series/GDP, July 29, 2020. 

# will forecast next 5 years for GDP

# Kelly L 7/23/2020
#####################################################################################

# Clear variables in workspace
rm(list=ls())

# Load forecasting package
library(fpp2)

# Load the data
data <- read.csv('GDP_US.csv')

# Declare this as time series data
Y <- ts(data[,6], start=c(1960,1), frequency = 1)

################################################################
# Preliminary Analysis
################################################################

# Time Plot
autoplot(Y) + ggtitle("Time Plot: US GDP per year") + ylab("Billions ($)")

# Data has strong strend, investigate transformations to remove trend
# First difference of log Y to make stationary
DY <- diff(log(Y))

# Time Plot Difference Data
autoplot(DY) + ggtitle("Time Plot: Change in Log of US GDP per year") + ylab("Billions ($)")

#######################################################################
# Series Y has strong positive trend
# To remove trend we must take the log of Y and take the difference
# Seasonality does not apply with this data
#######################################################################


# predictive accuracy
library(forecast)
accuracy(DY)

# predict next 5 observations for DY
library(forecast)
forecast(DY, 5)
plot(forecast(DY, 5))

# predict next 5 observations for Y
forecast(Y, 5)
plot(forecast(Y, 5))








