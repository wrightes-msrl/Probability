%% Computing Probabilities with Discrete Distributions
%% Binomial Distribution
% An agricultural engineer applies a new pesticide to a group of 40 cabbage 
% plants in hopes of controlling infestation by cabbage worms. SHe has already 
% determined that the pesticide has an average success rate of $78\%$. In other 
% words, she expects that any given cabbage plant will remain worm-free 78% of 
% the time when treated by the pesticide. For a technical report, she must state 
% the probability that exactly 3/4 of the plants in her group will remain worm-free 
% and the probabilities that half or fewer of the plants in her group will remain 
% worm-free.
%% 
% * The probability that exactly 3/4 (or $x=30$) of the plants will be worm 
% free is

P=binopdf(30,40,0.78)
%% 
% * The probability that fewer than half or fewer (or $x\le20$) of the plants 
% will remain worm-free is

P=binocdf(20,40,0.78)
%% 
% A fisheries biologist is studying a population of fish that includes a subpopulation 
% of rainbow trout. He plans to sample that population with replacement 10 times 
% (by practicing catch and release fishing) and knows that the probability of 
% catching a rainbow trout is 0.43. He uses the binomial distribution to make 
% the following predictions.
%% 
% * The probability of catching 10 fish, of which $x=7$ are rainbow trout is

P=binopdf(7,10,.43)
%% 
% * The probability of catching 10 fish, of which at most 7 $(x\le 7)$are rainbow 
% trout is 

P=binocdf(7,10,0.43)
%% 
% * The probaility of catching 10 fish, of which more than 3 $(x>3)$ are rainbow 
% trout is

P=1-binocdf(3,10,0.43)
%% 
% * The probability of catching 10 fish, of which more than 3 AND at most 7 
% are rainbow trout is 

P=binocdf(7,10,0.43)-binocdf(3,10,0.43)
%% Hypergeometric Distribution
% The leadership at a small corporation has decided to form a working committee 
% by randomly selecting 10 of 145 employees. Since 51 of the employees have worked 
% with the corporation for at least 12 years and the rest have not, there is some 
% concern that the committee might wind up with too many junior employees. Corporate 
% leadership has decided that it would be a mistake if $80\%$ or more of the committee 
% is made up of junior employees. By interpreting the process of forming the committee 
% as a form of sampling without replacement and modeling it with the hypergeometric 
% distribution, we can determine how likely it is that the committee has too many 
% junior employees.
% 
% Let $N=145$ represent the total number of employees in the company and $K=94$ 
% represent the number of junior employees in the company. Let $n=10$ represent 
% the size of the committee, and $x$ represents the number of junior employees 
% selected to be on the committee. The probability that the committee will be 
% made up of $80\%$ or more junior employees (i.e. $x\ge 8$) is:

P=1-hygecdf(7,145,94,10)
%% Geometric Distribution
% A pharmaceutical company offers an antibiotic that they claim to be $82\%$ 
% effective at treating staphylococcus infections. A group of patients suffering 
% from this infection are treated with the antibiotic one at atime. Assuming each 
% patient's response to the antibiotic is independent of the others', we may model 
% the occurrence of the first failure of the antibiotic to treat a case of the 
% infection. In this scenario, we are considering the failure of the drug to treat 
% as a preferred outcome. Since the probability that the antibiotic will not treat 
% the infection for any given patient is $18\%$, we may say
%% 
% * the probaility that the first patient $(x=1)$ will not respond to the drug 
% is 

P=geopdf(0,0.18)
%% 
% * the probability that the second patient $(x=2)$ will not respond to the 
% drug is 

P=geopdf(1,0.18)
%% 
% * the probability that the first failure of the drug will occur by the fifth 
% $(x\le 5)$patient is

P=geocdf(4,0.18)
%% 
% * the probability that the first failure of the drug will not occur until 
% after 10 patients $(x\ge11)$ are successfully treated is

P=1-geocdf(9,0.18)
%% 
% * and the probability that the first failed treatment will be observed after 
% the sixth patient and before the twelfth $(7\le x\le 11)$ is

P=geocdf(10,0.18)-geocdf(5,0.18)
%% Poisson Distribution
% A fiber optic channel of a communication network has a constant stream of 
% data flowing through it. THis data is also constantly checked fro transmission 
% errors. On average, a transmission error occurs once every 27 minutes, requiring 
% the data to be re-sent. If more than 100 transmission errors occur in a day, 
% the fiber optic channel will be closed and replaced. A telecommunications engineer 
% is tasked with deciding how likely this is. Since the interval in question is 
% one day, she must first find an error rate that is expressed in terms of this 
% time period. She knows that her measured error rate is $\lambda=\frac{1\text{ 
% error}}{27\text{ minute}}$.
% 
% In terms of days, this is equivalent to:
% 
% $\lambda=\frac{1\text{ error}}{27\text{ minute}}\times 60\frac{\text{minutes}}{\text{hour}}\times 
% 24\frac{\text{hours}}{\text{day}}\simeq 53.33\frac{\text{errors}}{\text{day}}$.
% 
% Since she would like to know the probability that more than 100 $(x>100)$ 
% transmission errors could occur in a day, she computes

P=1-poisscdf(100,53.33)
%% 
%