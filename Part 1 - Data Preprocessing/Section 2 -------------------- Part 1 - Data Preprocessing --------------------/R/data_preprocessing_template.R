# Data Preprocessing

# Importing the dataset
dataset = read.csv('Data.csv')
# dataset = dataset[, 2:3]

# Taking care of missing data
# This to take care of missing data Age and fill it with mean calculation of data
dataset$Age = ifelse(is.na(dataset$Age),
                     ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                     dataset$Age)
# This to take care of missing data Salery and fill it with mean calculation of data
dataset$Salary = ifelse(is.na(dataset$Salary),
                        ave(dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)),
                        dataset$Salary)

# Encoding categorical data
# This to change all data into binary and will easy mhen machine learning process
dataset$Country = factor(dataset$Country,
                         levels = c('France', 'Spain', 'Germany'),
                         labels = c(1, 2, 3))
dataset$Purchased = factor(dataset$Purchased,
                           levels = c('No', 'Yes'),
                           labels = c(0, 1))


# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
# This code will added new feature scaling when our data get into huge and not acureate
 training_set[, 2:3] = scale(training_set[, 2:3])
 test_set[, 2:3] = scale(test_set[, 2:3])