%% In-Class Lab 1 
%% 1.  Solve Linear Systems in MATLAB:
% Consider the linear system $Ax =b$ as follows
% Use backslash and *bslashtx.m* to solve the  linear system. 
% Compare the computational time.

% Using backslash
A = [1 2 3; 2 4 5; 3 5 6];
b = [2; 3; 4];
tic;% Start timer
x = A\b
elapsedTime = toc; % Stop timer and get elapsed time
disp(['Elapsed time: ', num2str(elapsedTime), ' seconds']);

% Using bslashtx.m
tic;% Start timer
x = bslashtx(A,b)
elapsedTime = toc; % Stop timer and get elapsed time
disp(['Elapsed time: ', num2str(elapsedTime), ' seconds']);

%% 2. Understand partial pivoting: 
% Use *lutx.m* for A in Ex.1 to find $L, U,$ and $P$.
[L,U,p] = lutx(A)

%% 3. Special Matrices:
% I. Strictly diagonal dominant matrix:
% Use *lutx.m* to find $L, U,$ and $P$ for $A$

A = [6 2 3; 2 8 5; 3 5 10];
[L,U,p] = lutx(A)

% II. Symmetric positive definite matrix:
% Use *chol* to find $R$ for $A$
R = chol(A)

% III. Banded matrix:
% a) Please use diag to generate a diagonal matrix with the diagonal 
% elements from 1 to 10.
D = diag(1:10)

% b) Please generate a tri-diagonal matrix of size $10 \times 10$ with 
% the diagonal elements of 2 and the super- and sub-diagonal elements of 
% 1 via the following command 
%       T = diag(a,-1)  + diag(b,0) + diag(c,1)
T = diag(ones(9,1),-1) + diag(2*ones(10,1),0) + diag(ones(9,1),1)

% c) Solve $TX = d$, where $d$ is a column vector whose elements are 
% from 1 to 10.
% Please note $d$ is a column vector
d = (1:10)'
tic;
X = T\d % use backslash to solve it
elapsedTime = toc; % Stop timer and get elapsed time
disp(['Elapsed time: ', num2str(elapsedTime), ' seconds']);


% d) Please use *tridisolve.m*to solve the above tridiagonal linear system.
a = ones(10,1);
b = 2*ones(10,1);
c = a;
tic;
x = tridisolve(a,b,c,d)
elapsedTime = toc; % Stop timer and get elapsed time
disp(['Elapsed time: ', num2str(elapsedTime), ' seconds']);
