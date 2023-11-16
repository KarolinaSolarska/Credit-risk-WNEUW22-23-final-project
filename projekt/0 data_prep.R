
library(tidyverse)

setwd("C:/Users/karla/OneDrive/Pulpit/projekt")
getwd()

app_test <- read_csv("projekt/dane/application_test.csv")
app_train <- read_csv("projekt/dane/application_train.csv")
glimpse(app_test)
glimpse(app_train)

# we need to add 1 to each column while preparation train vs test, knowing the
# second variable in train is target variable, which is missing for test data

app_test <- as.data.frame(app_test)
app_train <- as.data.frame(app_train)


# choose only relevant columns, skip those with lot of missings
# In '1 Data_overview' file is an analysis of these missing
app_test2 <- app_test[,c(1:11,13,14,18,30,96:115)]
app_train2 <- app_train[,c(1:12,14,15,19,31,97:116)]

for (i in c(1, 6:10, 14:35)){
   app_test2[,i] <- as.numeric(app_test2[,i])
}
for (i in c(1, 2, 7:11, 15:36)){
  app_train2[,i] <- as.numeric(app_train2[,i])
}

# there was plenty of documents to deliver, we will check the avergage delivery
# rate for the customer

is.numeric(app_test2[,23])
is.numeric(app_train2[,23])

# add column to app_test2 which is a mean from 16th to 35th column of app_test2
columns_to_sum <- c("FLAG_DOCUMENT_2", "FLAG_DOCUMENT_3", "FLAG_DOCUMENT_4",
                    "FLAG_DOCUMENT_5", "FLAG_DOCUMENT_6", "FLAG_DOCUMENT_7",
                    "FLAG_DOCUMENT_8", "FLAG_DOCUMENT_9", "FLAG_DOCUMENT_10",
                    "FLAG_DOCUMENT_11", "FLAG_DOCUMENT_12", "FLAG_DOCUMENT_13",
                    "FLAG_DOCUMENT_14", "FLAG_DOCUMENT_15", "FLAG_DOCUMENT_16",
                    "FLAG_DOCUMENT_17", "FLAG_DOCUMENT_18", "FLAG_DOCUMENT_19",
                    "FLAG_DOCUMENT_20", "FLAG_DOCUMENT_21")
app_test2$DOCUMENT <- rowSums(app_test2[, columns_to_sum]) / length(columns_to_sum)

app_train3 <- app_train2[,c(1:16,37)]
app_test3 <- app_test2[,c(1:15,36)]

app_train3$EXT_SOURCE_1 <- app_train[,"EXT_SOURCE_1"]
app_train3$EXT_SOURCE_2 <- app_train[,"EXT_SOURCE_2"]
app_train3$EXT_SOURCE_3 <- app_train[,"EXT_SOURCE_3"]
app_train3$AMT_REQ_CREDIT_BUREAU_QRT <- app_train[,"AMT_REQ_CREDIT_BUREAU_QRT"]
app_test3$EXT_SOURCE_1 <- app_test[,"EXT_SOURCE_1"]
app_test3$EXT_SOURCE_2 <- app_test[,"EXT_SOURCE_2"]
app_test3$EXT_SOURCE_3 <- app_test[,"EXT_SOURCE_3"]
app_test3$AMT_REQ_CREDIT_BUREAU_QRT <- app_test[,"AMT_REQ_CREDIT_BUREAU_QRT"]


# prev_app <- read_csv("previous_application.csv")
# glimpse(prev_app)
# prev_app <- as.data.frame(prev_app)







