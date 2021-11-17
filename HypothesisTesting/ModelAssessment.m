%% Using Hypothesis Testing for Model Assessment
%% Pearson's Goodness of Fit Test
% Binomial Example
% A game designer believes that a game he is developing will be won approximately 
% 17% of the time. In order to test this belief, he concludes that a binomial 
% distribution with 

n = 30;
%% 
% and 

p = 0.17;
%% 
% should predict the probability that anyone who plays the game $n$ successive 
% times will win during any $x$ of the 30 plays. The designer releases the game 
% to 50 people and asks each of them to play 30 times and record the number of 
% times they won. The game designer records the frequency of each count of wins 
% that appears in their data set.

wins=(0:30)';
empiricalFrequency=[2 0 3 6 14 10 8 4 1 1 0 1 zeros(1,19)]';
%% 
% Then, the game designer computes the theoretical frequencies of observing 
% each value of x by scaling the binomial distribution by the number of observations, 
% or

theoreticalFrequency=binopdf(wins,n,p)*sum(empiricalFrequency);
%% 
% Finally, the game designer, summarizes the possible numbers of wins, the empirical 
% frequencies for each value, and the theoretical frequencies for each value in 
% the following table:

data=table(wins,empiricalFrequency,theoreticalFrequency)
%% 
% The designer visually compares the agreement between the empirical and theoretical 
% probabilities by constructing a side by side bar graph:

figure(1)
bar(wins,[empiricalFrequency, theoreticalFrequency])
xlabel('x')
ylabel('Frequency of Observations')
legend('Empirical Frequency','Theoretical Frequency')
%% 
% The agreement looks good in a qualitative sense, but in order to quantify 
% the level of agreement, the designer performs a $\chi^2$ goodness of fit test. 
% To do so, he pools both his observed and experimental data into enough bins 
% that are chosen to ensure that there are at least 5 observations per bin:

O=[5 6 14 10 8 7];
edges=[-1,2,3,4,5,6,30];
E=sum(frequency)*(binocdf(edges(2:end),n,p)-binocdf(edges(1:end-1),n,p));
%% 
% Then, he computes the following test statistic for comparing these bin frequencies:

chi2stat=sum(((E-O).^2)./E)
%% 
% The designer needs to compare this statistic to an appropriate $\chi^2$ distribution. 
% While there are 6 possible bins of frequencies being compared, there aren’t 
% actually 6 degrees of freedom. The fact that we know that there were a total 
% of 50 observations made means that once we know the frequencies of any five 
% bins, the frequency of the sixth bin may be computed precisely. This causes 
% us to lose one degree of freedom. Therefore, the designer compares his test 
% statistic to the $\chi^2$ distribution with 

nu=5;
%% 
% degrees of freedom. The density function for this distribution is depicted 
% below

figure(2)
chi2=linspace(0,30,1000);
plot(chi2,chi2pdf(chi2,nu));
xlabel('\chi^2')
ylabel('f_{\chi^2}(v,\chi^2)')
%% 
% The value of $\chi^2 = 4.8945$ falls much closer to the mode of thed istribution 
% than either of the tails. The P − value for this statistic is

P=chi2cdf(chi2stat,nu,"upper")
%% Normal Correllation Analysis
% Recall that in an earlier example on regression, we presented a data set that 
% summarized the annual salary and years in service for a sample of employees. 
% the data set consists of just two columns of numerical observations: the years 
% of experience for various employees, and their annual salaries. The data is 
% restated here for convenience.

data=readtable('SalaryData.csv','ReadVariableNames',false);
data.Properties.VariableNames = {'YearsExperience','Salary'}
%% 
% Build the regression model.

mdl=fitlm(data.YearsExperience,data.Salary)
%% 
% The model provides the coefficient
% 
% of determination for us.

R2=mdl.Rsquared.Ordinary
%% 
% This value was reasonably close to 1, so we concluded that the model fit our 
% data well. However, we really shouldn’t be satisfied with that conclusion alone.
% 
% We could also ask about the underlying linearity of our data through hypothesis 
% testing. A bad situation we’d like to avoid would be to derive a model that 
% we would expect that our data could be described by a bivariate normal distribution 
% with ρ = 0 as a correlation coefficient parameter. If that were to be the case, 
% then we would expect that our data is uncorrelated and cannot be described by 
% a linear model. Therefore, we would state the following null hypothesis:
% 
% $H_0$ : Our sample is drawn from a bivariate normal distribution with $\rho=0$.
% 
% The sample correlation coefficient and z statistic for our regression data 
% become

n=height(data);
r=sqrt(R2);
z=(sqrt(n-3)/2)*log((1+r)/(1-r));
%% 
% Finally, we ask the question, “given the assumption that $H_0$ is true, how 
% likely is it that we would expect to collect a similarly sized sample from our 
% population that produces a sample correlation coefficient at least as extreme 
% as the one we’ve found? The answer would be

P=normcdf(z,"upper")