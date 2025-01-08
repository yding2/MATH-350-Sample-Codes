function [x,k] = newton(f,fprime,x)
%   x = newton(f,fprime,x) tries to find a zero of f(x) near the initial
%   guess x. If successful, newton returns the newton approximation to a 
%   root of f.
%   [x,iter] = newton(f,fprime,x) returns also the number of iterations
%   required to find the root.
% Both functions f and fprime need to be provided.
k = 0;
xprev = realmax;   % just to get started
while abs(x - xprev) > eps*abs(x)
    xprev = x;
    if fprime(x) ~= 0
        x = x - f(x)/fprime(x);
    else 
        disp(sprintf('Newton iteration failed since derivative is zero.\n'))
        return
    end
    k = k + 1;
    disp(sprintf('x%d = %16.14f',k,x))
end