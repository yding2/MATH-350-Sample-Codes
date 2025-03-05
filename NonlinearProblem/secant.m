function [b,k] = secant(f,x)
%   x = secant(f,x) tries to find a zero of f(x) near the initial
%   guesses x=[x0,x1]. If successful, secant returns the secant 
%   approximation to a root of f.
%   [x,iter] = secant(f,x) returns also the number of iterations
%   required to find the root.
a = x(1);
b = x(2);
k = 0;
while abs(b-a) > eps*abs(b)
    c = a;
    a = b;
    b = b + (b - c)/(f(c)/f(b)-1);
    k = k + 1;
    fprintf('x%d = %16.14f\n',k,b)
end