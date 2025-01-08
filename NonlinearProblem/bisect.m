function [b,k] = bisect(f,ab)
%   x = bisect(f,[a,b]) tries to find a zero of f(x) between a and b.
%   f(a) and f(b) must have opposite signs.  bisect returns one 
%   end point of a small subinterval of [a,b] where f changes sign.
%   [x,iter] = bisect(f,[a,b]) returns also the number of iterations
%   required to find the root.
a = ab(1);
b = ab(2);
k = 0;
while abs(b-a) > eps*abs(b)
    x = (a + b)/2;
    if sign(f(x)) == sign(f(b))
        b = x;
    else
        a = x;
    end
    k = k + 1;
    disp(sprintf('x%d = %16.14f',k,b))
end