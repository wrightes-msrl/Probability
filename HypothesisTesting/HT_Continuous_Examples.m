%% Hypothesis Testing Examples (Continuous Distributions)
% We'll be computing some small probabilities in these examples, so it makes 
% sense to display our numerical output in scientific notation.

format shortE
%% Z Test
% Bovine Growth Hormone
% From experience, we assume that the weights of livestock sampled from a herd 
% can be treated as a normally distributed random variable with a mean of 

mu = 2000;
%% 
% pounds with a standard deviation of 

sigma = 150;
%% 
% pounds. A ranch manager is assessing whether administering a growth hormone 
% to the herd will result in a significant increase in the average weight. 
% 
% He'll test the formal null hypothesis:
% 
% $H_0$: The mean of weights of a sample of 25 cows who have been given the 
% growth hormone will not be significantly different from the theoretical mean 
% of $\mu=2000$.
% 
% He randomly samples 25 cows from the herd and treats them with the growth 
% hormone. Once they reach maturity, he measures their weights.
% 
% These are:

D = [2144.9, 2131.2, 2090.5, 1884.1, 2275.5, 2278.5, 1825.1, 1996.8, 2264.0, 1983.4, 2073.0, 2314.6, 2062.0, ...
    2129.8, 1868.9, 1979.4, 2152.0, 2259.5, 2148.6, 2256.2, 2048.2, 2530.1, 2210.3, 2051.1, 2268.9]
%% 
% Since the weights of the livestock are assumed to be normally distributed 
% with mean mu and standard deviation sigma, the ranch manager concludes that 
% the variable
% 
% $$z =\frac{\bar{x} -mu}{\sigma/\sqrt{n}}$$
% 
% has a standard normal distribution (here, x? is the mean of D and n = 25 is 
% the size of the sample taken from the herd). This is justified by the central 
% limit theorem. The manager plans to use this fact to test for a significant 
% increase in average weight in response to the administration of the growth hormone. 
% Therefore, the null hypothesis is simply a statement that $z\le0$.
% 
% In order to carry out this test, the ranch manager computes the sample mean 
% and the z statistic for $D$.

x=mean(D)
z=(x-mu)/(sigma/sqrt(length(D)))
%% 
% Finally, the ranch manager computes the P value for this statistic:

P=normcdf(z,"upper")
% Freezing Point
% A high school science class is experimenting with the effect of salt upon 
% the freezing point of water. They know that the freezing point of pure water 
% at STP is 32 ° F . The students have been told that salt lowers the freezing 
% point of water, but in order to verify this, they collect 50 100 ml samples 
% of seawater and record the temperature needed to cause ice to begin forming 
% in each one. The resulting data is given below:

D = [27.4775, 28.8075, 27.1181, 28.7642, 27.8907, 28.7918, 29.7750, 28.9403, 28.4331, 28.5209, ...
    27.9293, 27.9077, 27.9459, 28.7502, 28.6751, 28.6046, 28.4648, 28.7569, 28.0312, 27.4115, ...
    29.6285, 27.4186, 29.4714, 27.6583, 28.8169, 28.1900, 28.5492, 30.1894, 27.1967, 27.5019, ...
    27.7380, 29.2464, 28.6479, 29.6239, 29.5991, 27.0669, 27.2842, 29.8725, 30.0786, 27.9155, ...
    28.9708, 29.5932, 28.3097, 28.5885, 28.1261, 26.5168, 28.5230, 29.0653, 29.0111, 30.7699]
%% 
% They hope to test the average freezing points of their samples against a standard 
% normal sampling distribution with mean 

mu = 32;
%% 
% Since their sample is large, they estimate the standard deviation of the population 
% with their sample standard deviation, 

x=mean(D)
sigma = std(D)
%% 
% They invoke the central limit theorem in order to conclude that the test statistic

z=(x-mu)/(sigma/sqrt(length(D)))
%% 
% is approximately normal. They construct a null hypothesis that states that 
% the sample average freezing point is not significantly less than 32 ° F (x? 
% ? 32). The P value is

P=normcdf(z)
%% T Test
% Freezing Point Revisited (Small Sample)
% Suppose the students in the previous example only collected 10 data points 
% instead of 50.

D = [27.4775, 28.8075, 27.1181, 28.7642, 27.8907, 28.7918, 29.7750, 28.9403, 28.4331, 28.5209]
%% 
% This is probably not enough to be justified in invoking the central limit 
% theorem. Since the students have such a small sample, they decide to test a 
% t-statistic derived from the the average freezing points of their samples with 
% a value of 

mu = 32;
%% 
% against a t sampling distribution with 

nu=9;
%% 
% degrees of freedom.
% 
% As before, the null hypothesis states that the sample average freezing point 
% is not significantly less than 32 ° F (x? ? 32). They compute their sample mean, 
% sample standard deviation, t statistic, and corresponding P ?value

x=mean(D);
s=std(D);
T=(x-mu)/(s/sqrt(length(D)));
P=tcdf(T,nu)
% State Fair Game Operator Revisited
% Recall the state fair game operator who suspected that one of his participants 
% might have been cheating. The game in question allowed participants to select 

n=5;
%% 
% containers from a barrel of 

N=1500;
%% 
% containers of which 

K=120;
%% 
% contained a prize. Since selection is conducted without replacement, this 
% game was modeled with the hypergeometric distribution. Therefore, we expect 
% that there should be

mu=n*K/N
%% 
% containers with a prize out of every sample of 5 (on average). Since the game 
% operator observes the participant winning

D = [2, 1, 3, 1, 1, 1];
%% 
% prizes in each of the six times he played, he computes the sample mean and 
% standard deviation:

x=mean(D)
s=std(D)
%% 
% Then he computes the t statistic for the data as well as the corresponding 
% P value against the null hypothesis that the contestant is not winning a significantly 
% higher number of prizes per sample than expected on average.

T=(x-mu)/(s/sqrt(length(D)))
P=tcdf(T,length(D)-1,"upper")
%% 
%