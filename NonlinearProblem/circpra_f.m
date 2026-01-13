function f = circpra_f(v)
x = v(1);
y = v(2);
f = zeros(2, 1);
f(1) = x^2 + (y-1)^2 - 1;
f(2) = y-x^2;


