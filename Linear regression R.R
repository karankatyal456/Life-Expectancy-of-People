######## Step 1  Problem Statement - To predict average life expectancy of people from different areas by using linear regression analysis.



#######Step 2 Importing the dataset-

data <- read.csv(choose.files())
View(data)
dim(data)
head(data,10)
str(data)

###### Out of the 23 columns our Dependent variable is Life expectancy 

#########removing of useless columns
#### Country and Year would be useless column so removing it 

library(dplyr)
data[, c("Country","Year")] = NULL
head(data)


str(data)

#### Data preprocessing
colSums(is.na(data))

#missing value columns 
#"Life_Expectancy", "Adult_Mortality", "Alcohol", "Hepatitis_B", "BMI", "Polio", "Total_Expenditure", "Diphtheria", "GDP", 
#"Per_Capita_GDP", "Population", "Thinness_1.19_Years", "Thinness_5.9_Years", "Income_Composition_of_Resources" and "Schooling" 

####there is missing values , but we have to check the percentage 
colSums(is.na(data))/nrow(data)*100
#####Percentage of missing values is less than 25% so we have to fill the missing value

data$Life_Expectancy[which(is.na(data$Life_Expectancy))] <- median(data$Life_Expectancy, na.rm = T) 

data$Adult_Mortality[which(is.na(data$Adult_Mortality))] <- median(data$Adult_Mortality, na.rm = T) 

data$Alcohol[which(is.na(data$Alcohol))] <- median(data$Alcohol, na.rm = T) 

data$BMI[which(is.na(data$BMI))] <- median(data$BMI, na.rm = T) 

data$Total_Expenditure[which(is.na(data$Total_Expenditure))] <- median(data$Total_Expenditure, na.rm = T) 

data$GDP[which(is.na(data$GDP))] <- median(data$GDP, na.rm = T) 

data$Per_Capita_GDP[which(is.na(data$Per_Capita_GDP))] <- median(data$Per_Capita_GDP, na.rm = T) 

data$Population[which(is.na(data$Population))] <- median(data$Population, na.rm = T) 

data$Thinness_1.19_Years[which(is.na(data$Thinness_1.19_Years))] <- median(data$Thinness_1.19_Years, na.rm = T) 

data$Thinness_5.9_Years[which(is.na(data$Thinness_5.9_Years))] <- median(data$Thinness_5.9_Years, na.rm = T) 

data$Income_Composition_of_Resources[which(is.na(data$Income_Composition_of_Resources))] <- median(data$Income_Composition_of_Resources, na.rm = T) 

data$Schooling[which(is.na(data$Schooling))] <- median(data$Schooling, na.rm = T) 

data$Hepatitis_B[which(is.na(data$Hepatitis_B))] <- mode(data$Hepatitis_B) 

data$Polio[which(is.na(data$Polio))] <- mode(data$Polio) 

data$Diphtheria[which(is.na(data$Diphtheria))] <- mode(data$Diphtheria)



 

######## Outliers#########

boxplot(data$Life_Expectancy) # Outlier found 
quantile(data$Life_Expectancy,seq(0,1,0.01))
data$Life_Expectancy <- ifelse(data$Life_Expectancy < 45.600,45.600,data$Life_Expectancy)
boxplot(data$Life_Expectancy) 

boxplot(data$Adult_Mortality) # Outlier found 
quantile(data$Adult_Mortality,seq(0,1,0.01))
data$Adult_Mortality <- ifelse(data$Adult_Mortality > 492.04,492.04,data$Adult_Mortality)
boxplot(data$Adult_Mortality) 

boxplot(data$Infant_Deaths) # Outlier found 
quantile(data$Infant_Deaths,seq(0,1,0.01)) 
data$Infant_Deaths <- ifelse(data$Infant_Deaths > 246.52,246.52,data$Infant_Deaths)
boxplot(data$Infant_Deaths) 

boxplot(data$Alcohol) # Outlier found 
quantile(data$Alcohol,seq(0,1,0.01)) 
data$Alcohol <- ifelse(data$Alcohol > 13.450000,13.450000,data$Alcohol) 
boxplot(data$Alcohol)

boxplot(data$Percentage_Expenditure) # Outlier found 
quantile(data$Percentage_Expenditure,seq(0,1,0.01)) 
data$Percentage_Expenditure <- ifelse(data$Percentage_Expenditure > 1.019941e+04,1.019941e+04,data$Percentage_Expenditure) 
boxplot(data$Percentage_Expenditure) 

boxplot(data$Measles) # Outlier found 
quantile(data$Measles,seq(0,1,0.01)) 
data$Measles <- ifelse(data$Measles > 54163.36,54163.36,data$Measles) 
boxplot(data$Measles) 

boxplot(data$BMI) # No outliers found

boxplot(data$Under.five_Deaths) # Outlier found 
quantile(data$Under.five_Deaths,seq(0,1,0.01))
data$Under.five_Deaths <- ifelse(data$Under.five_Deaths > 346.68,346.68,data$Under.five_Deaths) 
boxplot(data$Under.five_Deaths)

boxplot(data$Total_Expenditure) # Outlier found 
quantile(data$Total_Expenditure,seq(0,1,0.01))
data$Total_Expenditure <- ifelse(data$Total_Expenditure > 12.7071,12.7071,data$Total_Expenditure) 
boxplot(data$Total_Expenditure) 

boxplot(data$HIV.AIDS) # Outlier found 
quantile(data$HIV.AIDS,seq(0,1,0.01))
data$HIV.AIDS <- ifelse(data$HIV.AIDS > 19.052,19.052,data$HIV.AIDS) 
boxplot(data$HIV.AIDS) 

boxplot(data$GDP) # Outlier found 
quantile(data$GDP,seq(0,1,0.01))
data$GDP <- ifelse(data$GDP > 4.873789e+12,4.873789e+12,data$GDP)

boxplot(data$Per_Capita_GDP) # Outlier found 
quantile(data$Per_Capita_GDP,seq(0,1,0.01)) 
data$Per_Capita_GDP <- ifelse(data$Per_Capita_GDP > 82288.2274,82288.2274,data$Per_Capita_GDP) 
boxplot(data$Per_Capita_GDP) 

boxplot(data$Population) # Outlier found 
quantile(data$Population,seq(0,1,0.01)) 
data$Population <- ifelse(data$Population > 2.240667e+08,2.240667e+08,data$Population)
boxplot(data$Population)

boxplot(data$Thinness_1.19_Years) # Outlier found 
quantile(data$Thinness_1.19_Years,seq(0,1,0.01)) 
data$Thinness_1.19_Years <- ifelse(data$Thinness_1.19_Years > 19.500,19.500,data$Thinness_1.19_Years)
boxplot(data$Thinness_1.19_Years)

boxplot(data$Thinness_5.9_Years) # Outlier found 
quantile(data$Thinness_5.9_Years,seq(0,1,0.01)) 
data$Thinness_5.9_Years <- ifelse(data$Thinness_5.9_Years > 19.900 ,19.900 ,data$Thinness_5.9_Years) 
boxplot(data$Thinness_5.9_Years) 

boxplot(data$Income_Composition_of_Resources) # Outlier found 
quantile(data$Income_Composition_of_Resources,seq(0,1,0.01)) 
data$Income_Composition_of_Resources <- ifelse(data$Income_Composition_of_Resources < 0.29100 ,0.29100 ,data$Income_Composition_of_Resources) 
boxplot(data$Income_Composition_of_Resources)

boxplot(data$Schooling) # Outlier found 
quantile(data$Schooling,seq(0,1,0.01)) 
data$Schooling <- ifelse(data$Schooling < 2.900 ,2.900 ,data$Schooling) 
boxplot(data$Schooling) 




##################Univariate and Bivariate Analysis##############


##continuous column- histogram
##categorical column- bar plot

# For contionous variable - Histogram


colsforhist0=c("Life_Expectancy", "Adult_Mortality", "Infant_Deaths", "Alcohol", "Percentage_Expenditure", "Measles", "BMI", "Under.five_Deaths", "Total_Expenditure")
library(RColorBrewer) 
par(mfrow=c(3,3)) 
for(hist_cols in colsforhist0)  
{ hist(data[,c(hist_cols)],main=paste('Histogram of:',hist_cols),col=brewer.pal(8,"Paired"))}

colsforhist1=c("GDP", "Per_Capita_GDP", "Population", "Thinness_1.19_Years", "Thinness_5.9_Years", "Income_Composition_of_Resources", "Schooling","HIV.AIDS")
library(RColorBrewer)
par(mfrow=c(3,3)) 
for(hist_cols in colsforhist1)  
{ hist(data[,c(hist_cols)],main=paste('Histogram of:',hist_cols),col=brewer.pal(8,"Paired"))}


############## For categorical varibale - Bar plots 

ColsForBar =c("Status") 
par(mfrow=c(2,2))
for(bar_cols in ColsForBar) 
{barplot(table(data[,c(bar_cols)]),main=paste('Barplot of :',bar_cols),col=brewer.pal(8,"Paired"))}    


#Bivariate analysis
################### SCATTER PLOT ######################
# Continuous Vs Continuous 

ContinuousCols=c("Life_Expectancy", "Adult_Mortality", "Infant_Deaths", "Alcohol", "Percentage_Expenditure", "Measles", "BMI", "Under.five_Deaths", "Total_Expenditure" ,
                 "HIV.AIDS", "GDP", "Per_Capita_GDP", "Population", "Thinness_1.19_Years", "Thinness_5.9_Years", "Income_Composition_of_Resources", "Schooling") 
plot(data[,ContinuousCols],col='blue')  
 
#####Correlation Matrix###########

CorrData=cor(data[,ContinuousCols ], use = "complete.obs") 
names(CorrData['Life_Expectancy',][abs(CorrData['Life_Expectancy',]) < 0.5])

####According to Correlation these columns does not fit , so removing these columns 
#"Infant_Deaths"          "Alcohol"                "Percentage_Expenditure" "Measles"                "Under.five_Deaths"      "Total_Expenditure"      "GDP"                   
#"Population"             "Thinness_1.19_Years"    "Thinness_5.9_Years"   

data[, c("Infant_Deaths", "Alcohol", "Percentage_Expenditure", "Measles", "Under.five_Deaths", "Total_Expenditure", "GDP","Population",
         "Thinness_1.19_Years" , "Thinness_5.9_Years")] = NULL
str(data)


#####Anova Test########

colsforanova <- c("Status") 
for(anovacols in colsforanova)
{ anovaresult <- summary(aov(Life_Expectancy ~ data[,c(anovacols)],data=data)) 
  print(anovacols) 
  print(anovaresult)}

###Splitting the data #######
library(caTools)
library(caret) 
set.seed(123) 
split <- sample.split(data$Life_Expectancy, SplitRatio = 0.70) 
training <- subset(data, split==T) 
test <- subset(data, split==F) 

#########Model Building###########

Linear_Model=lm(Life_Expectancy~.,data=training)
summary(Linear_Model)

##R square is 0.83 , It can improved by removing column whos is not significant

#######Other than "Status" all variables are given significant results so removing status and build model again

data[, c("Status")]=NULL


#Now build model again

Linear_Model2 = lm(Life_Expectancy~.,data=training)
summary(Linear_Model2)

######Now its good , also R sqaure value is same So we can move on#######

#####Multicollinearity Check#########

install.packages('car')
library(car)
vif(Linear_Model2)
######No multicollinearity##


######model accuracy########
Model_pred<- predict(Linear_Model, newdata = test) 
Model_pred
combind = cbind(test$Life_Expectancy, Model_pred)
combind
########Finding MAPE########

APE = 100*(abs(test$Life_Expectancy-Model_pred)/test$Life_Expectancy)
MeanAPE=mean(APE)
MedianAPE=median(APE) 
Mean_A = 100 - MeanAPE 
Median_A = 100 - MedianAPE




#MAPE = 4.26737
#Median-APE = 3.183590
#Mean Accuracy - 95.736284
#Median Accuracy - 96.8164097


###############################################################################################################################################

















