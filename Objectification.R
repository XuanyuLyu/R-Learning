# Load packages
library(tidyverse)
library(multicon)
library(psych)
library(corrplot)
library(Hmisc)
library(MeMoBootR)
# Import file
body= read_csv("C:/Users/lxy75/Desktop/Objectification.csv")

# Create body surveillance scale
# Select items
surv <- data.frame(body$surv1,body$surv2,body$surv3,body$surv4,body$surv5,body$surv6,body$surv7,body$surv8)
# Create scoring keys
surv.keys <- list("surv"=c(-1,-2,-3,-4,5,6,-7,-8))
# Create scale
body$surv <- as.matrix(scoreTest(surv, surv.keys, rel=FALSE))

# Select items  
shame <- data.frame(body$shame1,body$shame2,body$shame3,body$shame4,body$shame5,body$shame6,body$shame7,body$shame8)
# Create scoring keys  some of reversed, give it a name
shame.keys <- list("shame"=c(1,2,3,4,-5,6,-7,8))
# Create scale   Creating the scale
body$shame <- as.matrix(scoreTest(shame, shame.keys, rel=FALSE))

# Select items  
sco <- data.frame(body$sco1,body$sco2,body$sco3,body$sco4,body$sco5,body$sco6,body$sco7,body$sco8,body$sco9,body$sco10,body$sco11)
sco.keys <- list("sco"=c(1,2,3,4,-5,6,7,8,9,10,-11))
body$sco <- as.matrix(scoreTest(sco, sco.keys, rel=FALSE))

# Select items  
fbcom <- data.frame(body$fbcom1,body$fbcom2,body$fbcom3,body$fbcom4)
fbcom.keys <- list("fbcom"=c(1,2,3,4))
body$fbcom <- as.matrix(scoreTest(fbcom, fbcom.keys, rel=FALSE))


# Check reliablity score
psych::alpha(surv, check.keys=TRUE)
psych::alpha(shame, check.keys=TRUE)
psych::alpha(sco, check.keys=TRUE)
psych::alpha(fbcom, check.keys=TRUE)


# Run bivarivate correlations
cor.test(body$surv,body$shame)
cor.test(body$surv,body$fbcom)
cor.test(body$shame,body$fbcom)

# Linear regression, X = Facebook use, Y = Shame
regress1 = lm ( body$shame ~ body$fbcom)
summary(regress1)

install.packages("devtools")
mediation_vars <- data.frame(body$fbcom, body$shame, body$surv, body$sco)
mediation_vars_na <- na.omit(mediation_vars)
View(mediation_vars_na)

#Mediation model
mediate_this = mediation1(y = "shame", #DV
                          x = "fbcom", #IV
                          m = "sco",   #Mediator
                          df = mediation_vars_na,
                          with_out = T)
# View the results
summary(mediate_this$model1)
summary(mediate_this$model2)
summary(mediate_this$model3)

#Facebook use 
for(i in 1:10){
  x <- get(paste("body$fbuse",i,sep = ""))
  ifelse(x == "Less than 10 min", 1,
         ifelse(x == "10-30 min",2,
                ifelse(x == "31-60 min", 3,
                       ifelse(x == "1-2 hours", 4,
                              ifelse(x == "2-3 hours", 5, 6)))))
}

body$fbuse1 <- ifelse(body$fbuse1 == "Less than 10 min", 1,
         ifelse(body$fbuse1 == "10-30 min",2,
                ifelse(body$fbuse1 == "31-60 min", 3,
                       ifelse(body$fbuse1 == "1-2 hours", 4,
                              ifelse(body$fbuse1 == "2-3 hours", 5, 6)))))
body$fbuse2 <-ifelse(body$fbuse2 == "Less than 10 min", 1,
       ifelse(body$fbuse2 == "10-30 min", 2,
              ifelse(body$fbuse2 == "31-60 min", 3,
                     ifelse(body$fbuse2 == "1-2 hours", 4,
                            ifelse(body$fbuse2 == "2-3 hours", 5, 6)))))
body$fbuse3 <-ifelse(body$fbuse3 == "Less than 10 min", 1,
       ifelse(body$fbuse3 == "10-30 min", 2,
              ifelse(body$fbuse3 == "31-60 min", 3,
                     ifelse(body$fbuse3 == "1-2 hours", 4,
                            ifelse(body$fbuse3 == "2-3 hours", 5, 6)))))
body$fbuse4 <-ifelse(body$fbuse4 == "Less than 10 min", 1,
       ifelse(body$fbuse4 == "10-30 min", 2,
              ifelse(body$fbuse4 == "31-60 min",3,
                     ifelse(body$fbuse4 == "1-2 hours", 4,
                            ifelse(body$fbuse4 == "2-3 hours", 5, 6)))))

body$fbuse5 <-ifelse(body$fbuse5 == "Less than once a month", 1,
       ifelse(body$fbuse5 == "Once a month", 2,
              ifelse(body$fbuse5 == "Once a week", 3,
                     ifelse(body$fbuse5 == "3-4 times a week", 4,
                            ifelse(body$fbuse5 == "Once a day", 5, 6)))))
body$fbuse6 <-ifelse(body$fbuse6 == "Less than once a month", 1,
       ifelse(body$fbuse6 == "Once a month", 2,
              ifelse(body$fbuse6 == "Once a week", 3,
                     ifelse(body$fbuse6 == "3-4 times a week", 4,
                            ifelse(body$fbuse6 == "Once a day", 5, 6)))))
body$fbuse7 <-ifelse(body$fbuse7 == "Less than once a month", 1,
       ifelse(body$fbuse7 == "Once a month", 2,
              ifelse(body$fbuse7 == "Once a week", 3,
                     ifelse(body$fbuse7 == "3-4 times a week", 4,
                            ifelse(body$fbuse7 == "Once a day", 5, 6)))))
body$fbuse8 <-ifelse(body$fbuse8 == "Less than once a month", 1,
       ifelse(body$fbuse8 == "Once a month", 2,
              ifelse(body$fbuse8 == "Once a week", 3,
                     ifelse(body$fbuse8 == "3-4 times a week", 4,
                            ifelse(body$fbuse8 == "Once a day", 5, 6)))))
body$fbuse9 <-ifelse(body$fbuse9 == "Less than once a month", 1,
       ifelse(body$fbuse9 == "Once a month", 2,
              ifelse(body$fbuse9 == "Once a week", 3,
                     ifelse(body$fbuse9 == "3-4 times a week", 4,
                            ifelse(body$fbuse9 == "Once a day", 5, 6)))))
body$fbuse10 <-ifelse(body$fbuse10 == "Less than once a month", 1,
       ifelse(body$fbuse10 == "Once a month", 2,
              ifelse(body$fbuse10 == "Once a week", 3,
                     ifelse(body$fbuse10 == "3-4 times a week", 4,
                            ifelse(body$fbuse10 == "Once a day", 5, 6)))))

#Create composite Facebook use measure
fbuse.day <- data.frame(body$fbuse1,body$fbuse2,body$fbuse3,body$fbuse4)
fbuse.day.keys <- list("fbuse.day"=c(1,2,3,4))
body$fbuse.day <- as.matrix(scoreTest(fbuse.day, fbuse.day.keys, rel=FALSE))
psych::alpha(fbuse.day, check.keys=TRUE)

fboften <- data.frame(body$fbuse5,body$fbuse6,body$fbuse7,body$fbuse8,body$fbuse9,body$fbuse10)
fboften.keys <- list("fboften"=c(1,2,3,4,5,6))
body$fboften <- as.matrix(scoreTest(fboften, fboften.keys, rel=FALSE))
psych::alpha(fboften, check.keys=TRUE)

cor.test(body$fbuse.day, body$fboften)
#Mediation model
mediation_vars <- data.frame(body$shame, body$fbcom, body$fboften,body$fbuse.day, body$surv, body$sco)
mediation_vars_na <- na.omit(mediation_vars)

mediate_this = mediation1(y = "shame", #DV
                          x = "fboften", #IV
                          m = "sco",   #Mediator
                          df = mediation_vars_na,
                          with_out = T)
view(mediation_vars_na)




# View the results
summary(mediate_this$model1)
summary(mediate_this$model2)
summary(mediate_this$model3)


#Mediation model _ fbuse.day
mediation_vars <- data.frame(body$shame, body$fbcom, body$fboften,body$fbuse.day, body$surv, body$sco)
mediation_vars_na <- na.omit(mediation_vars)

mediate_this2 = mediation1(y = "shame", #DV
                          x = "fbuse.day", #IV
                          m = "sco",   #Mediator
                          df = mediation_vars_na,
                          with_out = T)




# View the results
summary(mediate_this2$model1)
summary(mediate_this2$model2)
summary(mediate_this2$model3)

#Mediation model _ fboften as IV and fbcom as Mediator
mediate_this3 = mediation1(y = "shame", #DV
                           x = "fboften", #IV
                           m = "fbcom",   #Mediator
                           df = mediation_vars_na,
                           with_out = T)
summary(mediate_this3$model1)
summary(mediate_this3$model2)
summary(mediate_this3$model3)