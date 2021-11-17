%% Software Engineering Job Candidates
% A group of candidates have applied for for employment at a large social networking 
% corporation. As a part of the selection process, candidates will be placed into 
% teams of 12 people who will all be assigned different roles in which they work 
% together to solve a complex software engineering problem.
% 
% Of the 287 candidates, 126 have completed a computer science degree, 83 attended 
% a software engineering bootcamp, and the remaining candidates learned their 
% software engineering skills through self-study.
% 
% Assume the selection committee forms the first team of 12 by randomly selecting 
% them from the pool and assigning them to the roles within the team. We seek 
% to determine the probabilities of the following events.
%% 
% # All 12 candidates on the team learned software engineering through self 
% study.
% # The first six roles are filled by candidates with a computer science degree 
% and the remaining six roles are filled by candidates who attended a software 
% engineering bootcamp.
% # Half of the roles are filled by candidates with a computer science degree 
% and the other half are filled by candidates who attended a software engineering 
% bootcamp.
% # The first six roles are filled by 5 candidates with a computer science degree 
% and one who learned software engineering through self study. The last six are 
% filled by 4 candidates who attended a software engineering bootcamp and 2 candidates 
% who learned software engineering through self study.
%% 
% To determine the probabilities of these events, we must carefully consider 
% the nature of how the candidates are being selected. They are being selected 
% from a group at random, and are then randomly assigned to distinct roles. At 
% a fundamental level, this should suggest that a permutation will be the tool 
% we should be using to count possibilities in this scenario. In some cases, a 
% permutation will be the best tool. However, it might come to you as a surprise, 
% but in other cases, we will be better served to fall back to the multiplication 
% rule and view what we are doing as a sequence of decisions before jumping to 
% the conclusion that a permutation is the only applicable tool for us.
%% Solutions
% All 12 candidates on the team learned through self study
% There are a total of 287 candidates and 12 being assigned to roles on the 
% team. Therefore there are $n = P (287, 12)$, or

n=nchoosek(287,12)*factorial(12)
%% 
% ways to form the team without any special restrictions. On the other hand, 
% if the team will only consist of candidates who learned software engineering 
% through self study, then there are $r = P (78, 12)$, or

r=nchoosek(78,12)*factorial(12)
%% 
% ways to form such a team. This is because there are 287-126-83=78 candidates 
% who learned through self study. Therefore, the probability of forming this team 
% is
% 
% $$P =\frac{r}{n}=\frac{P (78, 12)}{P(287,12)}$$
% 
% or

P=r/n
%% 
% In this case, the permutation was the best tool.
% The first six roles are filled by candidates with a computer science degree and the remaining six roles are filled by candidates who attended a software engineering bootcamp
% In order to count the ways we can fill the first 6 roles with computer science 
% graduates and the last six roles with people who attended a bootcamp, we must 
% view the formation of that committee as a sequence of two decisions. First, 
% there are $P(126, 6)$ ways to assign computer science graduates to the first 
% six roles. Second, there are $P(83, 6)$ ways to assign the bootcamp attendees 
% to the last six roles. Therefore, by the multiplication rule, there are
% 
% $r = P(126, 6)\times P(83, 6)$ ways to form such a team, or

r=nchoosek(126,6)*factorial(6)*nchoosek(83,6)*factorial(6)
%% 
% Likewise, the probability of forming such a team is
% 
% $$P =\frac{r}{n}=\frac{P(126, 6)\times P(83, 6)}{P(287,12)}$$
% 
% or

P=r/n
%% 
% In this case, the permutation was still fundamental, but we needed to the 
% multiplication rule in order to understand how to deal with the assignment of 
% candidates who were drawn from two distinct categories.
% Half of the roles are filled by candidates with a computer science degree and the other half are filled by candidates who attended a software engineering bootcamp
% At first glance, the next team assignment might seem just like the previous 
% one. However, these two situations are not the same. The previous assignment 
% involved placing the computer science graduates in the first six roles and the 
% bootcamp attendees in the last six. This assignment places the computer science 
% graduates in any six of the twelve roles (not necessarily the first six) and 
% the bootcamp attendees in the remaining six. The difference is that we don?t 
% really know what roles the selected candidates will fill until we?ve selected 
% all 12 of them. We can understand the process for forming this team as a sequence 
% of three (not two decisions).
%% 
% # First, we select 6 computer science graduates. There are $C(126, 6)$ ways 
% to do this. We use a combination for this because, at this point we are only 
% selecting. We are delaying the assignment of these candidates to roles until 
% after we?ve selected the bootcamp attendees.
% # There are $C(83, 6)$ ways to select six bootcamp attendees.
% # Now that we have selected all 12 candidates for the team, we assign them 
% to the 12 distinct roles on the team. There are $12!$ ways to perform this assignment.
%% 
% Since we know the number of outcomes for each of our three decisions in the 
% selection and assignment process, we can use the multiplication rule to count 
% the ways we can form this team.
% 
% There are $r = C(126, 6) \times  C(83, 6) \times 12!$, or

r=nchoosek(126,6)*nchoosek(83,6)*factorial(12)
%% 
% ways to do this. Therefore, the probability of forming such a team is
% 
% $P =\frac{r}{n}=\frac{ C(126, 6) \times  C(83, 6) \times 12!}{P(287,12)}$ 
% or

P=r/n
% The first six roles are filled by 5 candidates with a computer science degree and one who learned software engineering through self study. The last six are filled by 4 candidates who attended a software engineering bootcamp and 2 candidates who learned software engineering through self study
% In the last variation of forming the team, there are six decisions to make.
%% 
% # There are $C(126, 5)$ ways to select 5 computer science candidates who will 
% eventually serve among the first 6 roles.
% # There are $C(78, 1)$ ways to select 1 candidate who learned through self 
% study to eventually serve among the first 6 roles.
% # There are $6!$ ways to arrange the six candidates we?ve selected so far 
% among the first six roles.
% # There are $C(83, 4)$ ways to select 4 bootcamp attendees who will eventually 
% serve among the last six roles.
% # There are $C(78, 2)$ ways to select 2 candidates who learned through self 
% study to eventually serve among the first 6 roles.
% # There are $6!$ ways to arrange this second set of six candidates among the 
% last six roles.
%% 
% Since we know the number of outcomes for each of our six decisions in the 
% selection and assignment process, we can use the multiplication rule to count 
% the ways we can form this team. There are
% 
% $r = C(126, 5) \times C(78, 1) \times 6! \times C(83, 4) \times C(78, 2) \times 
% 6!$, or

r=nchoosek(126,5)*nchoosek(78,1)*factorial(6)*nchoosek(83,4)*nchoosek(78,2)*factorial(6)
%% 
% ways to do this. Therefore, the probability of forming such a team is
% 
% $P=\frac{r}{n}=\frac{C(126, 5) \times C(78, 1) \times 6! \times C(83, 4) \times 
% C(78, 2) \times 6!}{P(287,12)}$, or

P=r/n