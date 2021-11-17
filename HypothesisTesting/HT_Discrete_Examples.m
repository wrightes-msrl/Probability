%% Hypothesis Testing Examples (Discrete Distributions)
% We'll be computing some small probabilities in these examples, so it makes 
% sense to display our numerical output in scientific notation.

format shortE
%% Binomial Test
% A pharmaceutical company has just developed a new kind of blood pressure medication 
% that it is ready to test on human subjects. The company is hoping to gather 
% evidence that supports its claim that this medication is effective at returning 
% blood pressure to a normal range in patients who suffer from hypertension. In 
% order to do so, scientists employed by the company design the following experiment.
%% 
% * A group of 40 patients known to be suffering from hypertension are given 
% an appropriate dosage of the new medication and are told that it will treat 
% high blood pressure. This group of patients is known as the Experimental Group.
% * Four groups of 40 patients each known to be suffering from hypertension 
% are given a placebo pill and are told it will treat high blood pressure. These 
% groups are known as the Control groups.
% * After enough time for the medication to take effect has passed, a technician 
% measures the blood pressure each patient in the experimental group and the four 
% control groups and records whether or not it is in a normal, healthy range. 
% In order to minimize the possibility of measurement bias, the technician does 
% not know which of these five groups is the experimental group.
%% 
% Using Fisher?s methodology, the company decides to model the behavior of the 
% control groups with a binomial distribution having parameters 

n = 40;
%% 
% and $p$ to be estimated from the numbers of patients in each of the control 
% groups who have blood pressure in the normal range. This distribution will be 
% used to test for a significant increase in the number of patients with normal 
% blood pressure in the experimental group. The control data collected by the 
% technician shows the following results:
% 
% Control Data:

D=[20,18,25,23];
%% 
% Experimental Data:

 
%% 
% We assume that the number of patients in any of the four control groups that 
% register a normal blood pressure is a binomial random variable with $n = 40$ 
% and an unknown value of $p$. However, the value of $p$ can be estimated using 
% maximum likelihood estimation.

p=mle(D,"distribution","Binomial","NTrials",n);
%% 
% Next, we formally establish a null hypothesis, $H_0$ . Namely, the number 
% of patients with normal blood pressure in the experimental group will not be 
% significantly greater than what the control groups lead us to expect.
% 
% The corporate researchers next administer the blood pressure medication to 
% the patients in the experimental group and observe that 31 of them end up with 
% blood pressure measurements in the normal range. According to the binomial model 
% we?ve chosen for the control groups, the probability of observing at least this 
% many subjects with normal blood pressure measurements is

P=binocdf(x-1,n,p,"upper")
%% Hypergeometric Test
% A game at the state fair allows participants to select $n=5$ small plastic 
% containers from a barrel that contains a total of $N=1500$ containers.  After 
% each participant plays the game, the game operator restocks the barrel in order 
% to ensure that it includes $K=120$ containers that contain a prize and $N-K=1380$ 
% containers that are empty.  The operator of the game notices that one participant 
% seems to be playing regularly.  Worse than that, the participant seems to be 
% winning regularly.  On one day, the game operator observes that the participant 
% plays 6 times. Out of each session of 5 selections, the participant receives 
% the following numbers of containers that contain a prize:

D=[2,1,3,1,1,1]
%% 
% Feeling suspicious that the participant is somehow cheating, the game operator 
% decides to perform hypothesis testing in order to decide whether or not to ban 
% the participant from ever playing again. He models the game with a hypergeometric 
% distribution parameterized with the theoretical parameter values of 

N = 1500;
K = 120; 
n = 5;
%% 
% He?ll use this distribution to test for excessively high numbers of prizes 
% found in a selection of five containers. Then he defines the null hypothesis:
% 
% $H_0$ : The participant is not winning a significantly higher number of prizes 
% than someone who randomly selects twenty containers from the barrel.
% 
% The game operator computes the P ?value for each of the six times the participant 
% played and finds them to be:

P=hygecdf(D-1,N,K,n,"upper")
%% 
% Notice that some of these $P$ values are significant and the rest are not.  
% This could be a result of poor experimental design. 
%% 
% Consider the following, alternative design the game operator could have adopted 
% in order to determine if the participant was winning an unexpectedly high number 
% of games. He allows participants to select $n = 20$ small plastic containers 
% from a barrel that contains a total of $N=1500$ containers. After each participant 
% plays the game, the game operator restocks the barrel in order to ensure that 
% it includes $K=120$ containers that contain a prize and $N-K=1380$ containers 
% that are empty. The operator of the game notices that one participant seems 
% to be playing regularly. Worse than that, the participant seems to be winning 
% regularly. On one day, the game operator observes that the participant plays 
% 10 times. Out of each session of 20 selections, the participant receives the 
% following numbers of containers that contain a prize:

D=[5, 6, 6, 10, 6, 5, 9, 11, 6, 4];
%% 
% Feeling suspicious that the participant is somehow cheating, the game operator 
% decides to perform hypothesis testing in order to decide whether or not to ban 
% the participant from ever playing again. He models the game with a hypergeometric 
% distribution parameterized with the theoretical parameter values of 

N = 1500;
K = 120; 
n = 20;
%% 
% He?ll use this distribution to test for excessively high numbers of prizes 
% found in a selection of twenty containers. Then he defines the null hypothesis:
% 
% $H_0$ : The participant is not winning a significantly higher number of prizes 
% than someone who randomly selects twenty containers from the barrel.
% 
% The game operator computes the P ?value for each of the ten times the participant 
% played and finds them to be:

P=hygecdf(D-1,N,K,n,"upper")
%% Geometric Test
% A small company employs six data entry specialists. It is essential that these 
% employees are able to accurately enter information into the company databases. 
% Recently, it has been determined that these employees committed their first 
% data entry error after 

C=[10, 6, 1, 0, 2, 13];
%% 
% days of committing no errors.
% 
% Management determined that this performance was unacceptable, so they have 
% decided to take steps to improve these results. First, they model the existing 
% performance with a geometric distribution. They estimate the parameter p using 
% maximum likelihood estimation:

p=mle(C,"distribution","Geometric");
%% 
% They then send the data entry specialists to a weekend training retreat in 
% hopes that the training will result in a significant increase in the number 
% of days of data entry required to observe the first error. Therefore, they establish 
% the null hypothesis:
% 
% $H_0$: There will be no significant increase in the number of error free days 
% observed after the retreat.
% 
% After the retreat, the specialists committed their first data entry errors 
% after

E=[8, 29, 8, 2, 33, 18];
%% 
% days, respectively.
% 
% Management assesses the effectiveness of the training by computing P?values 
% for each of these pieces of data.

P=geocdf(E-1,p,"upper")
%% Poisson Test
% A telecommunications engineer decides to formalize her procedure for determining 
% whether or not to replace the fiber optic channel in response to an apparently 
% high number of observed transmission errors during a one day interval. Recall 
% that her expected error rate is 

lambda=53.33;
%% 
% errors per day. Instead of arbitrarily replacing the line when she sees more 
% than 100 errors per day, she decides to compute P ?values for the error counts 
% she does observe. In fact, after an underwater seismic event that she believes 
% to have damaged the line, she observes on five consecutive weekdays, there were

D=[88, 71, 97, 83, 88];
%% 
% errors in the channel. She states a null hypothesis:
% 
% $H_0$: There will be no significant increase in the number of transmission 
% errors detected in the line per day, given that the expected number of errors 
% per day is $\lambda=53.33$.
% 
% and computes the P values for her data set.

P=poisscdf(D-1,lambda,"upper")