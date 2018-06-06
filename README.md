This repo contains the data and code for a story I did on football World Cups and their impact on tourism. You can read the story [here](https://shijithpk.github.io/world_cup_tourism/index.html).

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
