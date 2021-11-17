%% Customer Satisfaction Survey

SampleSize=[12 28 52 112 248 502 1106 2400 5008]';
Dissatisfied=[3 4 10 21 43 83 195 431 970]';
Satisfied=SampleSize-Dissatisfied;
%% 
% Compute the relative frequencies of the dissatisfied customers and satisfied 
% customers in each sample

RelativeDissatisfied=Dissatisfied./SampleSize;
RelativeSatisfied=Satisfied./SampleSize;
%% 
% Summarize the data and relative frequencies in a table.

Survey=table(SampleSize, Dissatisfied, Satisfied, RelativeDissatisfied, RelativeSatisfied)
%% 
% Determine if the releative frequencies appear to be approaching steady values.

plot(Survey.SampleSize, Survey.RelativeDissatisfied, Survey.SampleSize, Survey.RelativeSatisfied)
title('Relative Frequencies of dissatisfied and satisfied customers')
xlabel('Sample Size')
ylabel('Relative Frequency')
legend('Dissatisfied','Satisfied')