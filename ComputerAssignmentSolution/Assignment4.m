%% Computer Assignment 4
%% Exercise 4.2
% a）use symbolic toolbox to find the roots
% of x^3 - 2x - 5
syms x
eqn = x^3-2*x-5==0;
s = solve(eqn,x);
double(s)
%We can get three roots are
% 2.0946, -1.0473 +1.1359i and -1.0473-1.1359i
%%
% b) Use the roots function
s2 = roots([1 0 -2 -5])
%%
% c) Use fzerotx to find the real root
y = fzerotx(@(x) x^3-2*x-5,[2,3])
% y = 2.0946
%%
% d) Use Newton's method starting with a complex initial value need newton.m
x0 = -1 + i;
f = @(x) x^3-2*x-5;
fprime = @(x) 3*x^2 -2;
[x,iter] = newton(f,fprime,x0);
% Use -1+i as the initial guess, after 5 iterations, we got
% -1.0473 + 1.1359i
%%
% e) Bisection doesn't work. Complex roots are not located in one interval,
% but one rectangle.
%% Exercise 4.3
% a）use symbolic toolbox to find the roots
% of p(x) =816*x^3 -3835*x^2+6000*x-3125
syms x
eqn = 816*x^3 -3835*x^2+6000*x-3125==0;
s = solve(eqn,x);
%We can get three roots are
% 25/16, 25/17, and 5/3
%%
% b) plot p(x) for 1.43 <= x < 1.71
f = @(x) 816*x.^3 -3835*x.^2+6000*x-3125;
xbase = linspace(1.43,1.71,1000);
plot(xbase,f(xbase),'b-',s,f(s),'*');
legend('cubic polynomial','roots');
%%
% c) Newton's method with initial guess 1.5 need newton.m
% get the derivative first
fprime = @(x) 2448*x.^2 -7670*x+6000;
disp('Initial guess is x0 = 1.5')
[x,iter] = newton(f,fprime,1.5);
fprintf('A root of p(x) is x = %f.\nIt was computed in %d iterations.\n\n',x,iter) 
% A root of p(x) is x = 1.470588.
% It was computed in 11 iterations.
%%
% d) secant method with initial guess 1 and 2 
%   need secant.m
disp('Initial guesses are x0 = 1, x1 = 2')
[x,iter] = secant(f,[1 2]);
fprintf('A root of p(x) is x = %f.\nIt was computed in %d iterations.\n\n',x,iter) 
% A root of p(x) is x = 1.666667.
% It was computed in 12 iterations.
%%
% e) bisection method with the interval [1,2]
%    need bisect.m
disp('Initial interval is [a,b] = [1,2]')
[x,iter] = bisect(f,[1,2]);
fprintf('A root of p(x) is x = %f.\nIt was computed in %d iterations.\n\n',x,iter) 
% A root of p(x) is x = 1.470588.
% It was computed in 52 iterations.
%%
% f) Use fzerotx with interval [1,2]
x = fzerotx(f,[1 2]);
% A root of p(x) is x = 1.666667.
%%
% Conclusion:
% Newton's method and bisection give us the root 1.470588 (25/17)
% secand method and fzerotx give the root 1.666667 (5/3)
% To easily get the middle root, we can observe the plot of p(x)
% choose the interval to be [1.5,1.6]
% x = fzerotx(f,[1.5,1.6])
% or [x,iter] = bisect(f,[1.5,1.6]);
% or [x,iter] = secant(f,[1.5 1.6]);

%% Exercise 4.15
% a) Use fzerotx to sovle for E
M = 24.851090;
e = 0.1;
g = @(E) E - e*sin(E) -M;
% You can plot the graph of this function to know how 
% to choose the interval
E = fzerotx(g,[24 25]); 
% The result is 24.820357182542910


%%
% b) Use series to get the exact answer
Eiter = M; i =1;
while (abs(E - Eiter) > 1e-11)
    Eiter = Eiter + 2 /i * besselj(i,i*e)*sin(i*M);
    i = i+1;
end
fprintf('%d terms are needed.\n\n',i);
% When we get 11 terms we can get the difference are less
% than 1e-11.


%% Extra Credit Program Exercise 4.10
% a) Compute the first ten zeros of J0(x)
J0 = @(x) besselj(0,x);
Y0 = @(x) bessely(0,x);
x = [0:.1:10*pi];
plot(x,J0(x),x, Y0(x),x,zeros(size(x)));
% To find the first 10 zeros of J0
n = 10;
j0zeros = zeros(1,n);
for i = 1:n
    j0zeros(i) = fzerotx(J0,[(i-1)*pi i*pi]);
end 
% j0zeros =
%    2.4048    5.5201    8.6537   11.7915   14.9309
%   18.0711   21.2116   24.3525   27.4935   30.6346
%%
% b) To find the first 10 zeros of Y0
y0zeros = zeros(1,n);
for i = 1:n
    y0zeros(i) = fzerotx(Y0,[(i-1)*pi i*pi]);
end 
% y0zeros =
%    0.8936    3.9577    7.0861   10.2223   13.3611
%   16.5009   19.6413   22.7820   25.9230   29.0640
%%
% c) To find the values of x such that J0(x) = Y0(x)
J0Y0 = @(x) J0(x)-Y0(x);
j0y0zeros = zeros(1,n);
for i = 1:n
    j0y0zeros(i) = fzerotx(J0Y0,[(i-1)*pi i*pi]);
end 
% j0y0zeros =
%    1.6386    4.7382    7.8697   11.0069   14.1460
%   17.2860   20.4265   23.5672   26.7082   29.8493
%%
% d) Make a plot show both function and all the zeros
figure
plot(x,J0(x),x,Y0(x),j0zeros,zeros(10,1),'*',y0zeros,zeros(10,1),'o',...
    j0y0zeros,J0(j0y0zeros),'+')
xlim([0 32])
ylim([-1 1])
legend('J0(x)','Y0(x)','Roots of J0(x)','Roots of Y0(x)','J0(x) = Y0(x)');

