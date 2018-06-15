This repo contains the data and code for a story I did on football World Cups and their impact on tourism. You can read an expanded version of the story [here](https://shijithpk.github.io/world_cup_tourism/index.html).

Didn't have space to put this graphic in the print edition. If you read the text, it refers to a table of parameters on which Brazil and South Africa do worse than France, Japan and Germany. Here's the table:

![alt text](https://i.imgur.com/gmLznJ9.png)


All the text below is there in the expanded version, putting it here too for the sake of posterity.

**METHODOLOGY / HOW WE DID THE MATH**

So how were the hypothetical countries in the story created? They were constructed using a method called ‘synthetic control’. This is a method is typically used by academics and analysts for ‘impact evaluation’, ie. assessing whether a government policy or program has had any effect or not.

Now to figure out if hosting the World Cup leads to an increase or decrease in tourist spending, we need some kind of a counterfactual. Meaning, a way to let us know what would happen to the tourism figures of a country if it hadn’t hosted the World Cup.

Synthetic control helps us in constructing this counterfactual case, something that we can compare the actual figures to and make an assessment of how well a country has done.

We do this by constructing a synthetic country whose tourist spending figures are similar to that of the World Cup host country. This synthetic country is a weighted combination of countries similar to the host country.

To construct this synthetic case, we’ve chosen neighbouring countries whose citizens are, on average, as wealthy as the average person in the host country, ie. their per capita income levels aren’t that far apart.

(Typically, they’re in the same income group of countries as classified by the World Bank. Because South Africa just had two neighbours in the same income group, we relaxed the rule in this case to give us more countries to use. The reasoning was that the other countries would be similar enough to South Africa in several other respects to make up for not being in the same income group.)

This table below shows us the various countries that have been used to form the synthetic case for the past five world cups in this analysis:

![alt text](https://i.imgur.com/rAIhGVE.png)

For example, for Brazil, we constructed a ‘synthetic Brazil’ whose tourist spending figures are similar to that of the actual Brazil for three years prior to the World Cup in 2014, ie. 2011, 2012 and 2013. These three years represent a period of normalcy for the host country, a period before the World Cup has had an effect on tourist spending figures.

In this analysis, Synthetic Brazil is combination of five countries viz. Ecuador, Colombia, Paraguay, Venezuela and Peru. We would have chosen Argentina too if it hadn’t hosted the South American international football tournament, the Copa America in 2011. Because it hosted that tournament, its tourist spending figures for that year would have been higher than usual and skewed the figures for Synthetic Brazil.

(In fact, while selecting the countries used for constructing the synthetic case, it’s important to select countries that haven’t been through a ‘shock’ such as hosting a major tournament such as the Olympics or World Cup.)

So we take the tourist spending figures for the five South American countries for 2011, 2012 and 2013, find weightages/multipliers that we can apply to each of the countries, so that when the figures are added up, we get something close to the figures of actual Brazil.

![alt text](https://i.imgur.com/eHHxGCt.png)

We arrive at the weightages/multipliers to be used for each country by doing something called ‘constrained optimisation’ .

We then apply these weightages/multipliers to the tourist spending figures for these five countries for the years 2014 to 2016 and so arrive at the figures of Synthetic Brazil. By doing this, we get an idea of what the counterfactual would be, what the figures for Brazil would have looked like for all those years if it hadn’t hosted the World Cup.


**CREDITS & FURTHER READING**

The data for the story was taken from [figures](https://data.worldbank.org/indicator/ST.INT.RCPT.CD?view=chart) collated by the World Bank.

The data on tourism competitiveness of countries was taken from the [*World Travel & Tourism Competitiveness Report 2017*](http://reports.weforum.org/travel-and-tourism-competitiveness-report-2017/downloads/) published by the World Economic Forum.

Got the idea for using the Synthetic Control method from this [paper](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3160934) by Jorge Viana.

For an overview of synthetic control without much mathematical notation, this [paper](http://jech.bmj.com/content/jech/early/2018/04/13/jech-2017-210106.full.pdf) from the *British Medical Journal* does a good job.

If you&rsquo;re comfortable with mathematical notation and have some understanding of statistics or econometrics, I guess you should go for this [overview](https://web.stanford.edu/~jhain/Paper/AJPS2015a.pdf) of the method in the *American Journal of Political Science.*

For a summary of impact evaluation methods in general, this Harvard Business School (HBS) [working paper](https://dash.harvard.edu/bitstream/handle/1/25757697/16-049.pdf?sequence=1) is a good one.

The particular method I use here is a different version of synthetic control than is normally used.

The method I used was inspired by this [paper](http://www.nber.org/papers/w22791.pdf) by Guido Imbens (who seems to be an expert in the broader field of causal inference, he&rsquo;s even written [textbooks](https://www.cambridge.org/core/books/causal-inference-for-statistics-social-and-biomedical-sciences/71126BE90C58F1A431FE9B2DD07938AB) on it).

Now this following sentence will only make sense to you if you&rsquo;re familiar with the synthetic control method, but Imbens in his paper only uses outcome data and doesn&rsquo;t use any covariates or predictor variables.

I don&rsquo;t exactly use the method proposed by Imbens, the method I use is a simpler variant with -- bear with me as I get technical for a moment -- a non-negativity constraint on the coefficients for the outcome variables, while the intercept is allowed to be either positive or negative.

By allowing only for positive coefficients, it's closer to the 'traditional' synthetic control method. In a way what I&rsquo;m doing kind of lies between the Difference-in-Differences method (see the HBS paper for what that is) and the traditional synthetic control method.

To arrive at the weightages I used the [*nnls*](https://cran.r-project.org/package=nnls) package in R. The code used is available [here](the_analysis.R). Nnls stands for non-negative least squares. The package is usually used to do something called &lsquo;constrained regression&rsquo; but I&rsquo;ve used it here to do &lsquo;constrained optimisation&rsquo;.

There&rsquo;s a bit of python code I used to create CSVs for the graphics, it's available in a jupyter notebook [here](python_data_prep.ipynb). Could have done it in R, but it&rsquo;s just easier for me to code in python.

If you want to do synthetic control the traditional way, academics usually use the &lsquo;[Synth](https://cran.r-project.org/package=Synth)&rsquo; package in R. If you want some sample R code to start you off, this [blog post](https://thesamuelsoncondition.com/2016/04/29/more-public-policy-analysis-synthetic-control-in-under-an-hour/) is useful.

There&rsquo;s already been a lot, and I mean a lot, of work done on the impact of mega sporting events such as the World Cup and Olympics. I did a good-faith effort to see if someone had done anything similiar to this article which is a) based on synthetic control methods and b) which looks at tourism figures. Searched all the major journal databases, didn&rsquo;t find any, so hopefully this article represents original work in some sense.

Now statistics can get very advanced and is very easy to get wrong. If you&rsquo;re an econometrician, statistician or data scientist and think I should have done something differently in my analysis, do let me know! You can contact me on twitter at [@shijith](https://twitter.com/shijith) and through email at [mail@shijith.com](mailto:mail@shijith.com).
