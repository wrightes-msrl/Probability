%% Parameter Estimation
%% Binomial Distribution Example
% Suppose we observe a gambler play a game 20 times in any one sitting. The 
% gambler plays his sequence of 20 games during six consecutive sessions. In each 
% of these sessions, he wins 12, 11, 9, 8, 10, and 10 times. We believe his chances 
% of winning any one game are independent of other games he has played or will 
% play, so we are justified in modeling his chances of winning x out of 20 games 
% with the binomial distribution B(20, p; x). The trouble is, we don’t know a 
% value for p, so we’d like to estimate it. 
% 
% Define the sample

data=[12 11 9 8 10 10]
%% 
% Compute the maximum likelihood estimate:

p=mle(data,'distribution','binomial','ntrials',20)
%% Geometric Distribution Example
% Suppose you are interested in determining the probability of winning an extremely 
% “challenging a ” game of chance. A way to do this would be to observe many different 
% people play the game successively. Record the number of losses each person must 
% experience before winning the game for the first time.

data=[6054, 4100, 722, 5705, 3186, 14909]
%% 
% Compute the mle estimate

p=mle(data,'distribution','geometric')
%% Poisson Distribution Example
% Five identical populations of 150 animals are being studied. Researchers hope 
% to estimate the yearly reproductive rate for this species. They observe that 
% in the first year, the five populations generate 80, 92, 87, 95, and 97 offspring 
% in the first year. 

data=[80, 92, 87, 95, 97]
%% 
% compute the mle estimate

lambda=mle(data,'distribution','poisson')
%% Hypergeometric Example
% An ecologist intends to estimate a moose population that resides in northern 
% Maine. She captures, tags, and releases 

K=150;
%% 
% members of the moose population and lets them settle back into the herd. Then, 
% she captures 5 samples of 

n = 40;
%% 
% moose each and observes that there are 5, 0, 4, 2, and 1 tagged animals in 
% each of the five samples.

data=[5,0,4,2,1];
%% 
% She calculates the mean of this data

x=mean(data);
%% 
% and then uses the method of moments formula $N=\frac{n K}{\bar{x}}$ to compute 
% the estimator for $N$.

N=n*K/x
%% Mark and Recapture (Tularemia Revisited)
% In order to employ mark and recapture, we capture a group of 

K0 = 100;
%% 
% rabbits, tag one of their ears, and re-release them into the habitat. After 
% they’ve had a chance to redistribute themselves, we capture 8 samples of 

n=30
%% 
% rabbits and count the number of tagged rabbits in each one. The resulting 
% data set is

D=[3, 0, 2, 4, 1, 1, 4, 2]
%% 
% This data ought to be distributed according to a hypergeometric distribution 
% with the unknown total population of N, the tagged subcategory of K = K0 = 100, 
% and a sample size of n = 30. Therefore, the method of moments tells us $N=\frac{n 
% K0}{\bar{x}}$, where $\bar{x}$ is the mean of $D$.

N=n*K0/mean(D)
%% 
% Now we return to our original tularemia data set in order to estimate K, or 
% the number of rabbits in the population that are infected with tularemia. Recall 
% that the mean of the 40 data points in the original data set was 

xb= 9.525 
%% 
% Therefore, we can compute $K$ using $K=\frac{N \bar{x}}{n}$, where $N\simeq 
% 1412$ is our estimated population size, and $n=30$ is our sample size.

K=(N*xb)/n
%% Normal Distribution Example.
% While assessing the health of a watershed, a stream ecologist collects a random 
% sample of 10 smallmouth bass and measures their lengths. The results (in cm) 
% are

data=[22.9060, 18.7088, 19.1880, 18.4263, 17.9568, 19.1379, 19.2409, 20.3390, 17.4555, 20.1836]
%% 
% He believes this data is normally distributed and wants to estimate the mean 
% and variance. He does so by computing the sample mean and standard deviation.

mu=mean(data)
sigma=std(data)
sigma2=var(data)
%% 
% This could be done using maximum likelihood distribution as well. However, 
% be aware that Matlab's mle function finds the theoretical maximum likelihood 
% estimates for $\mu$ and $\sigma$ RATHER than the unbiased estimates we computed 
% above.

meanandstddev=mle(data,'distribution','normal')
mu=meanandstddev(1)
sigma=meanandstddev(2)
sigma2=sigma^2
%% 
% If we want to compute the unbiased estimates without using the mean, std, 
% and var functions, then we can use the normfit function instead.

[mu,sigma]=normfit(data)