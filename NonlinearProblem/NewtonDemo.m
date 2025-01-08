%% NewtonDemo.m
%% Overview
% Illustrates Newton's method coded in |newton.m| to solve $f(x)=0$ near the
% initial guess $x_0$. 

%% Find a root of the Bessel function $J_0$
%
% We use the built-in MATLAB function |besselj| to solve 
%
% $$ f(x) = J_0(x) = 0 $$
%
% Note that Newton's method also requires the derivative 
%
% $$ f'(x) = -J_1(x) $$
%
% and an initial guess. Here we use
%
% $$ x_0 = 0.1 $$
%
% Note how |newton.m| needs *functions* as input arguments.

disp('Find a root of the Bessel function J0:')
J0 = @(x) besselj(0,x);
J0prime = @(x) -besselj(1,x);
disp('Initial guess is x0 = 0.1')
[x,iter] = newton(J0,J0prime,0.1);
fprintf('A root of J0 is x = %f.\nIt was computed in %d iterations.\n\n',x,iter) 
x = [0:.1:30];
plot(x, besselj(0,x))

%% Find the first positive root of the Bessel function $J_0$
%
% Notice how the previous example did not produce the first positive root.
% In order to get that, we need to change our initial guess. We now use
%
% $$ x_0 = 1.0 $$
%
% The rest is the same as above (and therefore not even repeated in the
% code).
%pause
disp('Find the first positive root of the Bessel function J0:')
disp('Initial guess is x0 = 1.0')
[x,iter] = newton(J0,J0prime,1);
fprintf('The first positive root of J0 is x = %f.\nIt was computed in %d iterations.\n\n',x,iter) 
%pause

%% Compute $\sqrt{2}$ 
%
% We solve the equation
%
% $$ f(x) = x^2 - 2 = 0 $$
%
% where we again need the derivative
%
% $$ f'(x) = 2x $$
%
% We use three different initial guesses:
%
% $$ x_0 = 2, \quad x_0 = 0, \quad x_0 = 1 $$
disp('Compute sqrt(2):')
sqr2 = @(x) x^2-2;
sqr2prime = @(x) 2*x;
disp('Initial guess is x0 = 2.0')
[x,iter] = newton(sqr2,sqr2prime,2);
fprintf('sqrt(2) = %f was computed in %d iterations.\n\n',x,iter) 

%pause
disp('Initial guess is x0 = 0')
[x,iter] = newton(sqr2,sqr2prime,0);

%pause
disp('Initial guess is x0 = 1.0')
[x,iter] = newton(sqr2,sqr2prime,1);
fprintf('sqrt(2) = %f was computed in %d iterations.\n\n',x,iter) 
