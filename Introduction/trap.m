function intval = trap(f,a,b,n)
%   intval = trap(f,a,b,n) calculate the definitinal of the integral f on
%   the invertal [a,b] with n subintervals.
%
%   Example 1.
%   f = @(x) 1/(x^2+1)
%   a = -1;
%   b = 1;
%   n = 10;
%   intval = trap(f,a,b,n)

    h = (b-a)/n; %find the length of interval
    intval = h/2*(f(a)+f(b)); %add the end points
    % perform the sum
    for i = 1: n-1
        intval = intval + h*f(a+i*h);
    end
    