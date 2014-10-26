data(mtcars)

##Exploratory Analysis
###descriptive statistics
summary(mtcars$mpg[mtcars$am==0])
sd(mtcars$mpg[mtcars$am==0])
summary(mtcars$mpg[mtcars$am==1])
sd(mtcars$mpg[mtcars$am==1])

###boxplot

boxplot(mtcars$mpg ~ mtcars$am,
        main='Box plot of mpg for different transmission', 
        xlab='Transmission', ylab='mpg')

##Regression Modeling

###Model Selection
m0<-lm(mpg~am,data=mtcars)
biggest <- formula(lm(mpg~.,data=mtcars))
biggest
####Here we choose models by AIC in a forward stepwise algorithm
m1<-step(m0, direction='forward', scope=biggest)
summary(m1)


###Model Fit (diagnostic plot)
par(mfrow = c(2, 2))
plot(m1)

