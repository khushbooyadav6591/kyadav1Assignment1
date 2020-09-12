#---------------------------------------------------------------------------
#Downloaded dataset from: https://catalog.data.gov/dataset/quarterly-census-of-employment-and-wages-annual-data-beginning-2000
# the downloaded file is in .csv format.
# library: pastecs , plyr,
#------------------------------------------------------------------------------
library(pastecs)
library(plyr)

Quarterly_Employement_data<- read.csv("~/Downloads/Quarterly_Census_of_Employment_and_Wages_Annual_Data__Beginning_2000.csv")

#viewing the data to understand and analyze.

View(Quarterly_Employement_data)
summary(Quarterly_Employement_data)
#--------------------------------------------------------------------------
# After understanding and analyzing the data , we can identify the variables into quantitative and qualitative.
# Quantitative Variables : Average.Employment , Total.Wage, Annual.Average.Salary
# Qualitative Variables : Area.Type, Area, NAICS, NAICS.Title, Year
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
## Descriptive Statistics for quantitative variables: summary(),sapply(),stat.desc() used 
#-------------------------------------------------------------------------------
Quat_employment<-summary(Quarterly_Employement_data)         #summary()
print(Quat_employment)
Quat_employment_sapply<-sapply(Quarterly_Employement_data$Average.Employment,mean)    #sapply()
print(Quat_employment_sapply)
Quat_employment_statdesc<-stat.desc(Quarterly_Employement_data$Total.Wage)    #stat.desc()
print(Quat_employment_statdesc)

#-------------------------------------------------------------------------------
### Descriptive Statistics for Qualitative variables: table() and count() used
#Bar chart used to display the descriptive statistics
#-------------------------------------------------------------------------------
Frequency_Area_Type<-table(Quarterly_Employement_data$Area.Type)
print(Frequency_Area_Type)
class(Frequency_Area_Type)        #Table
Frequency_Area_Type_DF<-count(Quarterly_Employement_data,"Area.Type")
print(Frequency_Area_Type_DF)
class(Frequency_Area_Type_DF)    #Dataframe

barplot(Frequency_Area_Type_DF$freq,names.arg=Frequency_Area_Type_DF$Area.Type,xlab="Area Type",ylab="Frequency",col='blue',las=2)

#-------------------------------------------------------------------------------
##Transform variable
#-------------------------------------------------------------------------------
scale(Quarterly_Employement_data$Average.Employment)

#-------------------------------------------------------------------------------
##Plotting graph
##Scatter Plot
#-------------------------------------------------------------------------------
barplot(Quarterly_Employement_data$Annual.Average.Salary,names.arg=Quarterly_Employement_data$Year,xlab="Years",ylab="Avg Annual Salary",las=2,main="Avg. annual salaries from 2000-2019")
plot(x=Quarterly_Employement_data$NAICS,y=Quarterly_Employement_data$Total.Wage,xlab="NAICS",ylab="Total Wages",xlim=c(100,120),ylim=c(0,20000),col="blue")


