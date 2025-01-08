function f = circhyp_f(v)
x = v(1);
y = v(2);
f = zeros(2, 1);
f(1) = x^2 + y^2 - 4;
f(2) = x*y - 1;


