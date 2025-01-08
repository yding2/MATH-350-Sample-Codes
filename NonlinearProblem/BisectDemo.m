%% BisectDemo.m
%% Overview
% Illustrates the bisection algorithm coded in |bisect.m| to solve $f(x)=0$
% on $[a,b]$. It is important that $f(a)$ and $f(b)$ have opposite signs. 

%% Find the first positive root of the Bessel function $J_0$
%
% We use the built-in MATLAB function |besselj| to solve 
%
% $$ f(x) = J_0(x) = 0 $$
disp('Find the first positive root of the Bessel function J0:')
J0 = @(x) besselj(0,x);
disp('Initial interval is [a,b] = [0,3]')
[x,iter] = bisect(J0,[0,3]);
fprintf('The first positive root of J0 is x = %f.\nIt was computed in %d iterations.\n\n',x,iter) 

%% Compute $\sqrt{2}$ 
%
% We solve the equation
%
% $$ f(x) = x^2 - 2 = 0$$
%
pause
disp('Compute sqrt(2):')
sqr2 = @(x) x^2-2;
disp('Initial interval is [a,b] = [0,2]')
[x,iter] = bisect(sqr2,[0,2]);
fprintf('sqrt(2) = %f was computed in %d iterations.\n',x,iter) 
