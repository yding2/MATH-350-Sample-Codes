%% LSQquad.m
%% Overview
% Illustrates the effect of ill-conditioning of the normal equations by
% performing least squares solution in double and single-precision

%% First Example: Solving the normal equations in double precision

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
disp('Using double-precision')
A = [x.^2 x ones(m,1)]
% Solve the normal equations
c = (A'*A)\(A'*y)
xx = linspace(9.9,11.1,50);
yy = c(1)*xx.^2+c(2)*xx+c(3);
plot(xx, yy, 'g-', 'LineWidth', 2)
hold off

%% Second Example: Solving the normal equations in single precision

%%
% We will find out that the problem lies with the condition number of the
% normal equations matrix $A^TA$, which is roughly the square of the
% condition number of $A$. 

pause
disp('Using single-precision')
figure
hold on
plot(x, y, 'bo', 'LineWidth',2)
xlim([9.9 11.1])
ylim([0 0.1])
A = [single(x.^2) x ones(m,1)];
% Solve the normal equations
c = single((A'*A))\single((A'*y))
xx = linspace(9.9,11.1,50);
yy = c(1)*xx.^2+c(2)*xx+c(3);
plot(xx, yy, 'g-', 'LineWidth', 2)
hold off
pause
fprintf('The problem lies with the condition number of A^TA.\n cond(A^TA) = %e\n\n',cond(A'*A))
fprintf('For comparison, cond(A) = %e\n\n',cond(A))

%% Third Example: Again in single precision, but using a more stable method
pause
disp('Solution using a more stable method (also in single-precision)')
figure
hold on
plot(x, y, 'bo', 'LineWidth',2)
xlim([9.9 11.1])
ylim([0 0.1])
A = [single(x.^2) x ones(m,1)];
% Solve the overdetermined system directly via backslash (implicitly, this
% corresponds to a QR decomposition) 
c = A\single(y)
xx = linspace(9.9,11.1,50);
yy = c(1)*xx.^2+c(2)*xx+c(3);
plot(xx, yy, 'g-', 'LineWidth', 2)
hold off