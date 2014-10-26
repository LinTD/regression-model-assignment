---
output: pdf_document
---
#Regression Models Assignment

========================================================================================


##Exploratory Analysis

####descriptive statistics

1)auto-transmission
```{r}
summary(mtcars$mpg[mtcars$am==0])
sd(mtcars$mpg[mtcars$am==0])
```
2)manual-transmission
```{r}
summary(mtcars$mpg[mtcars$am==1])
sd(mtcars$mpg[mtcars$am==1])

```
As shown above, we can see the mean and standard deviation for mpg with different transmission types are significantly different.

####boxplot

```{r}
boxplot(mtcars$mpg ~ mtcars$am,
        main='Box plot of mpg for different transmission', 
        xlab='Transmission', ylab='mpg')
```
By the boxplot, we can see the distribution for mpg with different transmission types are differnt.


========================================================================================


##Regression Modeling

####Model Selection
Here we choose models by AIC in a forward stepwise algorithm
```{r,echo=F}
m0<-lm(mpg~am,data=mtcars)
biggest <- formula(lm(mpg~.,data=mtcars))
m1<-step(m0, direction='forward', scope=biggest)
```

```{r}
summary(m1)
```

The coefficients suggest that, compared with automatic transmissions, manual transmittions have an additional 2.93mpg.

####Model Fit (diagnostic plot)
```{r}
par(mfrow = c(2, 2))
plot(m1)
```

By those diagnostic plot, it seems that our model fit is good.

