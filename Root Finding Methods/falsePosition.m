function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter)
%False Position Algorithm
%   This function uses the false position algorithm to estimate the root of
%   any given function.
% func = the function being evaluated EX: func = @(x) x^2
% xi = lower guess of root
% xu = upper root guess
% es = desired relative error
% maxiter = number of iterations desired
% root = estimated root location
% fx = the function evaluated at "root"
% ea = approximate relative error
% iter = number of iterations
% rs = roots stored
count = 1; % Starts count of iterations
ea = 1; % Sets starting error to 100%
es = 0.00001; % Sets desired relative error to 0.00001% default
maxiter = 200; % Sets maxiter to 200 default
if nargin < 3
    error('Please input at least 3 arguments')
elseif nargin > 5
    error('Please input values for func,xl,xu,es,maxiter')
else
    while count <= maxiter && es <= ea % Tells program how long to run
        fxl = func(xl); % Evaluates xl in the function given
        fxu = func(xu); % Evaluates xu in the function given
        root = xu-(((fxu)*(xl-xu))/(fxl-fxu)); % Evaluates root guess
        rs(count+1) = root; % Stores roots found in an array
        ea = ((rs(count+1)-rs(count))/(rs(count))); % Calculates relative error
        fx = func(root); % Evaluates the function at the new root guess
        if fx < 0  % Determines what values to use for xl and xu over the next iteration
            xl = root;
            xu = xu;
        else
            xl = xl;
            xu = root;
        end
        count = count + 1; % Keeps track of iterations performed
    end
    iter = count - 1
    root = root
    fx = fx
    ea = ea
end
end