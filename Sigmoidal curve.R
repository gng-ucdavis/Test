###First, let's create an equation for a straight line; this is in 'logit space' and the equation is y=mx+b
b=0
m=1
x=seq(from=-10, to=10, by =0.1)
y=
}
<<<<<<< HEAD
=======

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

plot(prop~x, data=dat, type='n')
for(i in 1:length(unique(dat$b))){
	lines(prop~x, data=dat[dat$b==unique(dat$b)[i],], col=i, lwd=3)
}

>>>>>>> Changing-intercept
