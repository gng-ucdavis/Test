###First, let's create an equation for a straight line; this is in 'logit space' and the equation is y=mx+b
b=0
m=1
x=seq(from=-10, to=10, by =0.1)
y=m*x+b
plot(y~x) ##We now have a straight line and we can backtransform it into proportional space
plot(plogis(y)~x) ###This works and we now have a logistic curve

##What happens if we change the intercept?
###We are now going to create a bunch of curves with differing intercepts and keep the slope constant
###Need to create a data frame with different intercepts
b=seq(-5, 5, 1) #We will be looking at values of b from -5 to 5, so we should have 11 lines total
y=NULL
# y=rep(0, length(x)*length(b)) #This creates an empty vector we will populate with y values with differing intercepts. The total number of values of lines equals the number of x values we have multiplied by the number of intercept values we have
for(i in 1:length(b)){
	y1=m*x+b[i]
	y=c(y, y1)
}


#Create data frame to expand b
b.exp=NULL
for(i in 1:length(b)){
	b.exp.1=rep(b[i], length(x))
	b.exp=c(b.exp, b.exp.1)
}

##Now let's create the data frame
dat=data.frame(y=y, x=rep(x, length(b)), b=b.exp)
head(dat)
dat$prop=plogis(dat$y)

plot(prop~x, data=dat, type='n', xlab = 'did this work', ylab = 'WOOHOOO')
for(i in 1:length(unique(dat$b))){
	lines(prop~x, data=dat[dat$b==unique(dat$b)[i],], col=i, lwd=3)
}

HELLO
