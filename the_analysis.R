#below is the R code i ran, with the results commented out

library(nnls)

mydata = read.csv("data_archive/data_for_analysis_v2.csv")

france_time = (mydata$year >= 1995) & (mydata$year <= 1997)

japan_time = (mydata$year >= 1999) & (mydata$year <= 2001)

germany_time = (mydata$year >= 2003) & (mydata$year <= 2005)

safrica_time = (mydata$year >= 2007) & (mydata$year <= 2009)

brazil_time = (mydata$year >= 2011) & (mydata$year <= 2013)

brazil_df = mydata[brazil_time,]

safrica_df = mydata[safrica_time,]

germany_df = mydata[germany_time,]

japan_df = mydata[japan_time,]

france_df = mydata[france_time,]

X_france = model.matrix(France ~ Germany + Italy + Spain +
                          Switzerland + Luxembourg + Portugal + Greece + Ireland,data = france_df)

Y_france = france_df$France

#so what i'm doing below is allowing for a positive intercept and a negative intercept, and going for the intercept that results in a lower 'residual sum of squares', meaning when we use it the line we get will follow the line of the actual country more closely

results_france_pos_intercept = nnnpls(X_france,Y_france,con=c(1,1,1,1,1))

results_france_pos_intercept
# Nonnegative-nonpositive least squares model
# x estimates: 0 0 0 0.1629996 2.389722 0 0 0 0
# residual sum-of-squares: 3.844e+18
# reason terminated: The solution has been computed sucessfully.

results_france_neg_intercept = nnnpls(X_france,Y_france,con=c(-1,1,1,1,1))

results_france_neg_intercept
# Nonnegative-nonpositive least squares model
# x estimates: -54697964459 0 0 1.366208 4.280536 0 0 0 0
# residual sum-of-squares: 0
# reason terminated: The solution has been computed sucessfully.

X_japan = model.matrix(Japan ~ Hong.Kong.SAR..China + Singapore + Macao.SAR..China,data = japan_df)

Y_japan = japan_df$Japan

results_japan_pos_intercept = nnnpls(X_japan,Y_japan,con=c(1,1,1,1))

results_japan_pos_intercept
# Nonnegative-nonpositive least squares model
# x estimates: 659939335 0 0.8152029 0.3489197
# residual sum-of-squares: 0
# reason terminated: The solution has been computed sucessfully.

results_japan_neg_intercept = nnnpls(X_japan,Y_japan,con=c(-1,1,1,1))

results_japan_neg_intercept
# Nonnegative-nonpositive least squares model
# x estimates: 0 0 0.9197583 0.3933185
# residual sum-of-squares: 6.267e+14
# reason terminated: The solution has been computed sucessfully.

X_germany = model.matrix(Germany ~ France + Belgium + Netherlands + United.Kingdom + Italy, data = germany_df)

Y_germany = germany_df$Germany

results_germany_pos_intercept = nnnpls(X_germany,Y_germany,con=c(1,1,1,1,1,1))

results_germany_pos_intercept
# Nonnegative-nonpositive least squares model
# x estimates: 0 0 0 0.03275518 0.9642741 0
# residual sum-of-squares: 2.837e+14
# reason terminated: The solution has been computed sucessfully.

results_germany_neg_intercept = nnnpls(X_germany,Y_germany,con=c(-1,1,1,1,1,1))

results_germany_neg_intercept
# Nonnegative-nonpositive least squares model
# x estimates: -143881990 0 0 0.03601604 0.9670074 0
# residual sum-of-squares: 0
# reason terminated: The solution has been computed sucessfully.

X_safrica = model.matrix(South.Africa ~ Namibia + Botswana + Angola +
                           Zambia + Zimbabwe + Mozambique,data = safrica_df)

Y_safrica = safrica_df$South.Africa

results_safrica_pos_intercept = nnnpls(X_safrica,Y_safrica,con=c(1,1,1,1,1,1,1))

results_safrica_pos_intercept
# Nonnegative-nonpositive least squares model
# x estimates: 0 0 9.342494 0 0 11.75939 4.45788
# residual sum-of-squares: 0
# reason terminated: The solution has been computed sucessfully.

results_safrica_neg_intercept = nnnpls(X_safrica,Y_safrica,con=c(-1,1,1,1,1,1,1))

results_safrica_neg_intercept
# Nonnegative-nonpositive least squares model
# x estimates: 0 0 9.342494 0 0 11.75939 4.45788
# residual sum-of-squares: 0
# reason terminated: The solution has been computed sucessfully.

X_brazil = model.matrix(Brazil ~ Ecuador + Colombia + Paraguay + Venezuela..RB + Peru,data = brazil_df)

Y_brazil = brazil_df$Brazil

results_brazil_pos_intercept = nnnpls(X_brazil,Y_brazil,con=c(1,1,1,1,1,1))

results_brazil_pos_intercept
# Nonnegative-nonpositive least squares model
# x estimates: 4102078947 0 0 7.384211 0 0.1210526
# residual sum-of-squares: 0
# reason terminated: The solution has been computed sucessfully.

results_brazil_neg_intercept = nnnpls(X_brazil,Y_brazil,con=c(-1,1,1,1,1,1))

results_brazil_neg_intercept
# Nonnegative-nonpositive least squares model
# x estimates: 0 0 0 23.19657 0 0
# residual sum-of-squares: 1.389e+17
# reason terminated: The solution has been computed sucessfully.
