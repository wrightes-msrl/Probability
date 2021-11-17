%% Introduction to Simple Linear Regression
% Read data from an external file (SalaryData.csv),  The fiirst column represents 
% years in service while the second column represents annual salary. The data set 
% can also be obtained from <https://www.kaggle.com/karthickveerakumar/salary-data-simple-linear-regression 
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