%% NewtonmvDemo.m
%% Overview
% Illustrates the multivariate Newton method with two examples.
% The multivariate Newton method is coded in |newtonmv.m|

%% First Example: Missile intercept problem
% Function and Jacobian are provided in |missile_f.m| and |missile_j.m|.

disp('Solving missile intercept problem')
x0 = [1 1]';
fprintf('Initial guess: x0 = [%f %f]',x0)
tol = 1e-8;
[root,iter] = newtonmv(x0, @missile_f, @missile_j, tol);
disp(' ')
%pause

%% Second example: Intersection of circle and hyperbola
% Uses |circhyp_f.m| and |circhyp_j.m|

% Find four solutions of circle hyperbola intersection

%%
% Trial 1
disp('Trial 1 of circle-hyperbola intersection problem')
x0 = [3 -1.5]';
fprintf('Initial guess: x0 = [%f %f]',x0)
tol = 1e-8;
[root,iter] = newtonmv(x0, @circhyp_f, @circhyp_j, tol);
disp(' ')

%%
% Trial 2
%pause
disp('Trial 2 of circle-hyperbola intersection problem')
x0 = [0 3]';
fprintf('Initial guess: x0 = [%f %f]',x0)
[root,iter] = newtonmv(x0, @circhyp_f, @circhyp_j, tol);
disp(' ')

%%
% Trial 3
%pause
disp('Trial 3 of circle-hyperbola intersection problem')
x0 = [-3 1.5]';
fprintf('Initial guess: x0 = [%f %f]',x0)
[root,iter] = newtonmv(x0, @circhyp_f, @circhyp_j, tol);
disp(' ')

%%
% Trial 4
%pause
disp('Trial 4 of circle-hyperbola intersection problem')
x0 = [0 -3]';
fprintf('Initial guess: x0 = [%f %f]',x0)
[root,iter] = newtonmv(x0, @circhyp_f, @circhyp_j, tol);

%%
% Plot solution
xi = -2:.02:2;
xi1 = -2.2:.02:-0.1;
xi2 = 0.1:.02:2.2;
plot(xi,sqrt(4-xi.^2),'r',xi,-sqrt(4-xi.^2),'r',...
    xi1,1./xi1,'b',xi2,1./xi2,'b')
axis([-2.2 2.2 -2.2 2.2])