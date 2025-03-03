%% Computer Assignment 2
% 
%
%% Problem 2.3
a = 1/sqrt(2);
A = [0 1 0 0 0 -1 0 0 0 0 0 0 0;
0 0 1 0 0 0 0 0 0 0 0 0 0;
a 0 0 -1 -a 0 0 0 0 0 0 0 0;
a 0 1 0 a 0 0 0 0 0 0 0 0;
0 0 0 1 0 0 0 -1 0 0 0 0 0;
0 0 0 0 0 0 1 0 0 0 0 0 0;
0 0 0 0 a 1 0 0 -a -1 0 0 0;
0 0 0 0 a 0 1 0 a 0 0 0 0;
0 0 0 0 0 0 0 0 0 1 0 0 -1;
0 0 0 0 0 0 0 0 0 0 1 0 0;
0 0 0 0 0 0 0 1 a 0 0 -a 0;
0 0 0 0 0 0 0 0 a 0 1 a 0;
0 0 0 0 0 0 0 0 0 0 0 a 1];
b= zeros(13,1);
b(2) = 10; b(8) = 15; b(10) = 20;
x = A\b

%% Problem 2.5
%% Part a)
% 1. M = magic(n) is NOT PD
% 2. H = hilb(n) is PD
% 3. P = pascal(n) is PD
% 4. I = eye(n,n) is PD
% 5. R = randn(n,n) is NOT PD
% 6. R = randn(n,n); A = R'R is PD
% 7. R = randn(n,n); A = R'+ R is NOT PD
% 8. R = randn(n,n); I = eye(n,n); A = R'+ R + nI is PD

%% Part b) Use mychol function
% Generate a positive definite matrix
A = [4 -1 1; -1 4.25 2.75; 1 2.75 3.5];
R = mychol(A);
Rchol = chol(A);
% return the 2-norm of the difference of two upper triangular matrix
if(norm(R-Rchol)==0)
disp('The cholesky factorization works correctly.');
else
disp('The cholesky factorization does NOT perform well');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Problem 2.8
%% Explicit for loop of LUTX
n = 10.^(1:4);
disp('For explicit for loop lu factorization');
for i =1:4
A = rand(n(i));
fprintf('For size of matrix is n = %e\n', n(i));
tic;
[~ ]= lutxmod(A); 
toc; 
end



%% Problem 2.19
%% Part a)
% Generate a tridiagonal matrix with 2 on the diagonal
% -1 on the sub- and superdiagonal
% size of the matrix

n = 100;
% Generate sub- and super diagonal vector
a = ones(n-1,1)*(-1); 
% Generate diagonal vector
b = ones(n,1)*2;
% Construct the coefficient matrix
A = diag(b)+diag(a,-1)+diag(a,1);
% Generate the righthand vector
d = (1:n)';

%Using lutx solve the problem
[L,U,p] = lutx(A);
y = L\p(d);
xlu = U\y

%Using bslashtx solve the problem
xbslashtx = bslashtx(A,d)

%% Part b)
% Generate the coefficient matrix via sparse structure
e = ones(n,1);
Asp = spdiags([-e 2*e -e], -1:1, n, n);

%Using back slash operator to solve the problem
xbslashsp = Asp\d

%% Part c)
% Use tridisolve to solve the linear system
xtridisolve = tridisolve(a,b,a,d)

%% Part d)
fprintf('The condition number of the coefficient matrix = %e\n',...
    condest(A));