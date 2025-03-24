%% SecantDemo.m
%% Overview
% Illustrates the secant method coded in |secant.m| to solve $f(x)=0$ near
% the *two initial guesses* $x_0$ and $x_1$. 

%% Find a root of the Bessel function $J_0$
%
% We use the built-in MATLAB function |besselj| to solve 
%
% $$ f(x) = J_0(x) = 0 $$
%
% Note that the secant method requires two initial guesses. Here we use
%
% $$ x_0 = 0.1, \quad x_1 = 0.5 $$
%
% Note how |secant.m| needs *functions* as input arguments.

disp('Find a root of the Bessel function J0:')
J0 = @(x) besselj(0,x);
disp('Initial guesses are x0 = 0.1, x1 = 0.5')
[x,iter] = secant(J0,[0.1 0.5]);
fprintf('A root of J0 is x = %f.\nIt was computed in %d iterations.\n\n',x,iter) 
x = [0:.1:30];
plot(x, besselj(0,x))

%% Find the first positive root of the Bessel function $J_0$
%
% Notice how the previous example did not produce the first positive root.
% In order to get that, we need to change our initial guess. We now use
%
% $$ x_0 = 1.0, \quad x_1 = 4.0 $$
%
% The rest is the same as above (and therefore not even repeated in the
% code).
%pause
disp('Find the first positive root of the Bessel function J0:')
disp('Initial guesses are x0 = 1, x1 = 4')
[x,iter] = secant(J0,[1 4]);
fprintf('The first positive root of J0 is x = %f.\nIt was computed in %d iterations.\n\n',x,iter) 

%% Compute $\sqrt{2}$ 
%
% We solve the equation
%
% $$ f(x) = x^2 - 2 = 0 $$
%
% where we use the two initial guesses
%
% $$ x_0 = 1, \quad x_1 = 2 $$
%pause
disp('Compute sqrt(2):')
sqr2 = @(x) x^2-2;
disp('Initial guesses are x0 = 1, x1 = 2')
[x,iter] = secant(sqr2,[1 2]);
fprintf('sqrt(2) = %f was computed in %d iterations.\n\n',x,iter) 
