%% Factorials, Permutations, and Combinations
% The following commands demonstrate the basic computation of factorials, permutations 
% and combinations in MATLAB.
% 
% Compute the number of ways you can arrange eight baseball cards in a definite 
% order (8!).

factorial(8)
%% 
% Compute the number of ways you can select and arrange eight baseball cards 
% from a group of twenty in a definite order

nchoosek(20,8)*factorial(8)
%% 
% Compute the number of ways you can select eight baseball cards from a group 
% of 20.

nchoosek(20,8)