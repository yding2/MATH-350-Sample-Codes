%% Loss of Significance

%%
% This script demonstrates loss of significant digits and how to fix it for
% the specific example of evaluation of 
%
% $$ f(x) = \sqrt{x^2+1}-1 $$
%
% for increasingly smaller values of $x$.

%% 
% Number of trials
N = 15;

%% Result using double-precision
disp('Result using double precision')
for n=0:N
    x = 10^(-n);
    f = sqrt(x^2+1)-1;
    disp(sprintf('x=%e,  sqrt(x^2+1)-1 = %e',x,f))
end

%% Using double-precision, but fixed
pause
disp('Result using double precision, but fixed')
for n=0:N
    x = 10^(-n);
    f = x^2/((sqrt(x^2+1))+1);
    disp(sprintf('x=%e,  x^2/(sqrt(x^2+1)+1) = %e',x,f))
end


% This script demonstrates loss of significant digits and how to fix it for
% the specific example of evaluation of 
%
% $$ h(x) = 1 - cos(x) $$
%
% for increasingly smaller values of $x$.


%% Result using double-precision
pause

disp('Result of h(x)')
for n=0:N
    x = 10^(-n);
    h = 1 - cos(x);
    disp(sprintf('x=%e,  1 - cos(x) = %e',x,h))
end

%% Using double-precision, but fixed
pause
disp('Result of h(x), but fixed')
for n=0:N
    x = 10^(-n);
    f = x^2/2;
    disp(sprintf('x=%e,   1 - cos(x) = %e',x,f))
end