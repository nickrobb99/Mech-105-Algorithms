function I = Simpson(x,y)
% This function will give an approximation of the integral of a set of data
% using the simpsons 1/3 rule.
% x = enter the independent variable values as a vector ex: [1 3 5 7]
% y = enter the dependent variable values as a vector ex: [22 12 11 21]
n = numel(x);
h = x(2)-x(1);
if numel(x) ~= numel(y) %Checks for same number of points in each vector
    error('There must be exactly one y point for every x point')
elseif nargin <= 1
    error('You must have exactly two vectors')
elseif nargin >= 3
    error('You must have exactly two vectors')
elseif range(x(2:end)-x(1:end-1)) ~= 0 %Checks for evenly spaced vectors
    error('The independent variable must be evenly spaced to use this function')
elseif mod(n,2) == 0
    warning('The trapezoidal rule must be used for the last summation due to even number of data points')
    I2 = (h/3)*(sum(y(1:2:end-3))+4*sum(y(2:2:end-2))+sum(y(3:2:end-1))); %Simpsons 1/3 Rule Summation stored in I2
    I = I2 + ((h/2)*(y(end-1)+y(end))); %Trapezoidal Rule added to I2
else
    I = (h/3)*(sum(y(1:2:end-2))+4*sum(y(2:2:end-1))+sum(y(3:2:end))); %Simpsons 1/3 rule Summation
end
end