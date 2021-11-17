%% Computing Probabilities with Continuous Distributions
%% Normal Distribution
% An automotive engineer has determined that the fuel economy for a prototype 
% of a new truck can be modeled with a normally distributed random variable with 
% a mean of 17.3 miles per gallon with a standard deviation of 2.7 (this accounts 
% for variations in fuel economy that result from different driving conditions). 
% When asked what the probability is that tht fuel economy would fall between 
% 15 and 16 $(15<x<16)$ miles per gallon at any particular moment, she responded 
% by performing the following calculation:

P=normcdf(16,17.3,2.7)-normcdf(15,17.3,2.7)
%% 
% A census worker has learned that human life expectancy in his area of study 
% is a normally distributed random variable witha mean value of 81.35 years and 
% a standard deviation of 11.64 years. Therefore, the probability any given person 
% in that region will live more than 90 years $(x>90)$ is

P=normcdf(90,81.35,11.64,'upper')
%% Sampling and the Central Limit Theorem
% A market researcher is analyzing the results of an experiment in which the 
% heights of random samples of 10 people were measured. Even though the researcher 
% does not have a model for the distribution of height measurements, she has already 
% estimated that the mean of this unknown distribution in $\mu\simeq 5.6934$ and 
% the standard deviation is $\sigma\simeq 0.7999$. The researcher hopes to determine 
% the probability of obtaining a sample of heights with a mean greater than 6 
% feet. Since her sample size is $n=10$, she invokes the Central Limit Theorem 
% and concludes that thte variation in the sample means is described by a normal 
% distribution with $\mu\simeq 5.6934$ and $\sigma\simeq 0.7999/\sqrt{10}\simeq 
% 0.2530$. Therefore, the probability that the mean of any given sample is greater 
% than 6 feet is

P=normcdf(6,5.6934,0.2530,'upper')
%% 
% A water quality technician is attempting to assess claims made by a property 
% owner that they have addressed problems with their septic system and that nitrate 
% levels down-gradient from their system are now averaging at 

mu=10
%% 
% parts per million. The technician takes 20 independent nitrate measurements 
% from a test well down-gradient of the septic system and finds the following 
% levels (in parts per million):

D=[14.7137, 13.8745, 10.7293, 8.7689, 14.8821, 9.6489, 15.1748, 12.2348, ...
    12.1531, 13.6441, 14.7137, 13.8745, 10.7293, 8.7689, 14.8821, 9.6489, ...
    15.1748, 12.2348, 12.1531, 13.6441]
%% 
% He computes the mean of this sample to find that 

xb=mean(D)
%% 
% From earlier analysis, the technician knows that the standard deviation of 
% the nitrate measurements is 

sigma=2.3
%% 
% With this information and the landowner's claim that the down-gradient concentrations 
% are now averaging at 10 parts per million.  The technician computes a z statistic 
% for this sample.

z=(xb-mu)/(sigma/sqrt(length(D)))
%% 
% The technician suspects that it is unlikely that the landowner's claim is 
% true, but in order to quantify this, he observes that the probability that $z$ 
% should be found at or above the value she calcluated is small:

P=normcdf(z,'upper')
%% 
% This is a very small probablity, so she concludes that the landowner's claim 
% is unlikely to be true.
%% $\chi^2$ Distribution
% A manufacturer of gold ingots desires to maintain a high degree of consistency 
% in the mass of the ingots they produce. The mean weight of the ingots is taken 
% to be 

mu=1000
%% 
% grams. The plant manager will consider that the production consistency of 
% gold ingots is out of tolerance if he has reason to believe that the true value 
% of the standard deviation of ingot masses is more than 

sigma=0.001
%% 
% grams. In order to determine whether or not this is the case, the plant manager 
% requires that an occasional sample of 

n=25
%% 
% ingots will be randomly sampled so that their masses may be precisely measured.
% 
% Suppose one such sample is collected and its sample standard deviation turns 
% out to be 

s=0.0015
%% 
% The $\chi^2$ statistic for this scenario is
% 
% $$\chi^2=\frac{(n-1)s^2}{\sigma^2}=\frac{24\times 0.0015^2}{0.001^2}$$
% 
% |or|

chi2=(n-1)*(s^2)/(sigma^2)
%% 
% Using the $\chi^2$ distribution with

nu=n-1
%% 
% degrees of freedom, the plant manager determines that the probability of observing 
% a sample with a sample standard deviation of at least 0.0015 is

P =chi2cdf(chi2,24,'upper')
%% 
% which is quite small. The manager concludes that this sample is indicative 
% that production quality might be out of tolerance.
%% Student's T Distribution
% An agricultural engineer is investigating the performance claims made by a 
% chemical company that produces fertilizers. They state that under typical conditions, 
% addition of their fertilizer to a one acre plot of potatoes will result in an 
% average yield of 32.8 thousand pounds. The engineer prepares five separate one 
% acre plots and applies the fertilizer to all of them. At the end of the growing 
% season, these fields yield 

D=[29.28, 28.84, 28.86, 28.47, 30.84]
%% 
% thousand pounds of potatoes respectively.
% 
% The engineer calculates the mean and variance of the data:

xb=mean(D)
s=std(D)
%% 
% Then, she computes the t statistic for this data with 

nu=length(D)-1
%% 
% degrees of freedom and the claimed yield of 

mu=32.8
%% 
% thousand pounds per acre:

t=(xb-mu)/(s/sqrt(length(D)))
%% 
% The fact that $t<0$ reflects the reality that the sample mean lies below the 
% proposed true mean of 32.8 thousand pounds per acre. She plots the t distribution 
% for $\nu=4$ degrees of freedom and observes that $t=-8.5192$ is well out into 
% the lower tail.

tdata=linspace(-10,10,100)
plot(tdata,tpdf(tdata,nu))
%% 
% She computes the probability of obtaining a sample with a t statistic at least 
% as extreme as the one she computed:

P=tcdf(t,nu)
%% 
% This is quite small, so she concludes that it is unlikely that her fertilizer 
% is performing as advertised.