%% LSQquadQR.m
%% Overview
% Illustrates the use of the *QR decomposition* for the computation of a
% polynomial least squares fit

%% Example 1: Solving the least squares problem using QR decomposition

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
disp('Solving least squares problem with QR decomposition')
A = [x.^2 x ones(m,1)]
% Compute the QR decomposition of A
[Q R] = qr(A)
Rhat = R(1:3,1:3)
z = Q(:,1:3)'*y;
c = Rhat\z
xx = linspace(9.9,11.1,50);
yy = c(1)*xx.^2+c(2)*xx+c(3);
plot(xx, yy, 'g-', 'LineWidth', 2)
title('Clean Data')
disp('Fitting with quadratic polynomial')
disp(sprintf('p(x) = %3.2fx^2 + %3.2fx + %3.2f',c))
hold off

%% Example 2: Fit "noisy" data using a quadratic polynomial

%%
% Note that we do not need to re-compute the QR decomposition of the matrix
% $A$ for this part since the matrix $A$ is still the same. Only the data
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
disp('Solving noisy least squares problem with QR decomposition')
% No need to re-compute the QR decomposition of A since A is the same, only
% y has changed!
z = Q(:,1:3)'*y;
c = Rhat\z
xx = linspace(9.9,11.1,50);
yy = c(1)*xx.^2+c(2)*xx+c(3);
plot(xx, yy, 'g-', 'LineWidth', 2)
title('Noisy Data')
disp('Fitting with quadratic polynomial')
disp(sprintf('p(x) = %3.2fx^2 + %3.2fx + %3.2f',c))
hold off

