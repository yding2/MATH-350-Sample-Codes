%% Computer Assignment 1
% 
%
% This script demonstrates loss of significant digits and how to 
%use Taylor series to fix it for the specific example of evaluation of 
%
% $$ f(x) = x - sin(x) $$
%
% for increasingly smaller values of $x$.
%% 
% Number of trials
N = 15;

%% Result using double-precision
disp('Result using double precision')
for n=0:N
    x = 10^(-n);
    f = x-sin(x);
    fprintf('x=%e,  x-sin(x) = %e\n',x,f)
end
	
%% Using double-precision, but fixed
pause
disp('Result using double precision, but fixed')
for n=0:N
    x = 10^(-n);
    f = x^3/6-x^5/factorial(5);
    fprintf('x=%e,  x - sin(x)= %e\n',x,f)
end
