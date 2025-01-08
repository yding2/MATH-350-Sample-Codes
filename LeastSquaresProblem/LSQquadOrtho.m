%% LSQquadOrtho.m
%% Overview
% Illustrates the use of an *orthogonal basis* for the computation of a
% polynomial least squares fit

%% Solving the normal equations in single precision using an orthogonal basis

%%
% $$ \left\{ \left(x-\frac{21}{2}\right)^2-\frac{7}{60}, x-\frac{21}{2}, 1 \right\}$$

clear all
close all
x = [10:0.2:11]';
y = [0:0.2:1]'.^2/10;
m = length(x);
hold on
plot(x, y, 'bo', 'LineWidth',2)
xlim([9.9 11.1])
ylim([0 0.1])
pause
disp('Using single-precision with orthogonal basis')
A = [single((x-21/2).^2-7/60) single(x-21/2) ones(m,1)]
% Solve the normal equations
c = single((A'*A))\single((A'*y))
xx = linspace(9.9,11.1,50);
yy = c(1)*((xx-21/2).^2-7/60)+c(2)*(xx-21/2)+c(3);
plot(xx, yy, 'g-', 'LineWidth', 2)
hold off
fprintf('There no longer is a problem with the condition number of A^TA.\n')
fprintf('cond(A^TA) = %e\n\n',cond(A'*A))
fprintf('For comparison, cond(A) = %e\n\n',cond(A))

%%
% Compute the inner products of the columns of $A$ with each other to
% verify that $A$ is an orthogonal matrix.

pause
disp('Notice that the columns of A are orthogonal to each other:')
fprintf('A(:,1)''*A(:,2) = % f\n',A(:,1)'*A(:,2))
fprintf('A(:,1)''*A(:,3) = % f\n',A(:,1)'*A(:,3))
fprintf('A(:,2)''*A(:,3) = % f\n',A(:,2)'*A(:,3))
