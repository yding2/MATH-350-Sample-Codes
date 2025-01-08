%% LSQquadSVD.m
%% Overview
% Illustrates the use of the *SVD* for the computation of a
% polynomial least squares fit

%% Example 1: Solving the least squares problem using singular value decomposition 

%%
% Data comes from the quadratic polynomial (no noise)
%
% $$ p(x) = \frac{1}{10} x^2 -2x + 10$$

clear all
close all
x = [10:0.2:11]';
disp('Clean Data')
y = [0:0.2:1]'.^2/10;
m = length(x);
hold on
plot(x, y, 'bo', 'LineWidth',2)
xlim([9.9 11.1])
ylim([0 0.1])
%pause
disp('Solving least squares problem with SVD')
A = [x.^2 x ones(m,1)]
% Compute the SVD of A
[U S V] = svd(A)
% find number of nonzero singular value = rank(A)
r = length(find(diag(S)))
Uhat = U(:,1:r)
Shat = S(1:r,1:r)
z = Shat\Uhat'*y;
% or 
%z = Uhat'*y./diag(Shat);
c = V*z
xx = linspace(9.9,11.1,50);
yy = c(1)*xx.^2+c(2)*xx+c(3);
plot(xx, yy, 'g-', 'LineWidth', 2)
title('Clean Data')
disp('Fitting with quadratic polynomial')
fprintf('p(x) = %3.2fx^2 + %3.2fx + %3.2f',c)
hold off

%% Example 1a: Fit using the pseudoinverse

disp('Coefficients obtained directly with pseudoinverse')
pinvA = pinv(A);
c = pinvA*y

%% Example 2: Fit "noisy" data using a quadratic polynomial

%%
% Note that again we do not need to re-compute the SVD of the matrix $A$
% for this part since the matrix $A$ is still the same. Only the data 
% vector $y$ has changed! 

%pause
disp('Noisy Data')
% Add 10% noise to the data
y = y + 0.1*max(y)*rand(size(y));
figure
hold on
plot(x, y, 'bo', 'LineWidth',2)
xlim([9.9 11.1])
ylim([0 0.1])
%pause
disp('Solving noisy least squares problem with SVD')
% No need to re-compute the SVD of A since A is the same, only
% y has changed!
z = Shat\Uhat'*y;
c = V*z
xx = linspace(9.9,11.1,50);
yy = c(1)*xx.^2+c(2)*xx+c(3);
plot(xx, yy, 'g-', 'LineWidth', 2)
title('Noisy Data')
disp('Fitting with quadratic polynomial')
fprintf('p(x) = %3.2fx^2 + %3.2fx + %3.2f',c)
hold off

%% Example 2a: Fit "noisy" data using the pseudoinverse

disp('Coefficients obtained directly with pseudoinverse (computed earlier)')
c = pinvA*y
