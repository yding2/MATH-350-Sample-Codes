function [b,k] = iqi(f,x)
%   x = iqi(f,x) tries to find a zero of f(x) near the initial
%   guesses x=[x0,x1,x2]. If successful, iqi returns the inverse quadratic 
%   interpolation approximation to a root of f.
%   [x,iter] = iqi(f,x) returns also the number of iterations
%   required to find the root.
a = x(1);
b = x(2);
c = x(3);
k = 0;
while abs(c-b) > eps*abs(c)
    x = polyinterp([f(a),f(b),f(c)],[a,b,c],0);
    a = b;
    b = c;
    c = x;
    k = k + 1;
    fprintf('x%d = %16.14f\n',k,c)
end
