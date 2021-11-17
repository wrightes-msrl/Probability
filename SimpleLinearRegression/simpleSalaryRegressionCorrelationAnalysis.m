%% Introduction to Simple Linear Regression
%% Regression Model
% Read data from an external file (SalaryData.csv),  The first column represents 
% years in service while the second column represents annual salary. The data 
% set can also be obtained from <https://www.kaggle.com/karthickveerakumar/salary-data-simple-linear-regression 
% https://www.kaggle.com/karthickveerakumar/salary-data-simple-linear-regression>.

data=readtable('SalaryData.csv','ReadVariableNames',false);
data.Properties.VariableNames = {'YearsExperience','Salary'}
%% 
% Build the regression model.

mdl=fitlm(data.YearsExperience,data.Salary)
%% 
% Get predictions from the model and plot with data

x=linspace(0,12,100)';
ypred=predict(mdl,x);
plot(data.YearsExperience,data.Salary,'o',x,ypred)
xlabel('Years of Experience')
ylabel('Salary')
%% Hypothesis Testing
% 

Sxx=sum((data.YearsExperience-mean(data.YearsExperience)).^2)
Syy=sum((data.Salary-mean(data.Salary)).^2)
Sxy=sum((data.YearsExperience-mean(data.YearsExperience)).*(data.Salary-mean(data.Salary)))
r=Sxy/sqrt(Sxx*Syy)
r^2
mdl.Rsquared
n=height(data)
z=0.5*sqrt(n-3)*log((1+r)/(1-r))
P=normcdf(z,'upper')