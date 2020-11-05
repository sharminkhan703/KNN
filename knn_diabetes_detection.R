data<-read.csv("diabetes.csv")
View(data)
head(data)
str(data)
sum(anyNA(data))
train_data<-data[1:1400,]
test_data<-data[1401:2000,]
summary(train_data)
str(test_data)
train_data$Outcome<-factor(train_data$Outcome)
test_data$Outcome<-factor(test_data$Outcome)
library(class)
prediction<-knn(train=train_data[,-9],test = test_data[,-9],cl=train_data$Outcome,k=5)
prediction
library(caret)
CM<-confusionMatrix(data = prediction,test_data$Outcome)
CM

#Confusion Matrix and Statistics

#Reference
#Prediction   0   1
#         0 349  54
#         1  52 145

#Accuracy : 0.8233         
#95% CI : (0.7904, 0.853)
#No Information Rate : 0.6683         
#P-Value [Acc > NIR] : <2e-16         

#Kappa : 0.6005         

#Mcnemar's Test P-Value : 0.9226         
                                         
            #Sensitivity : 0.8703         
            #Specificity : 0.7286         
         #Pos Pred Value : 0.8660         
         #Neg Pred Value : 0.7360         
          #   Prevalence : 0.6683         
         #Detection Rate : 0.5817         
   #Detection Prevalence : 0.6717         
      #Balanced Accuracy : 0.7995         
                                         
       #'Positive' Class : 0              
                                         
