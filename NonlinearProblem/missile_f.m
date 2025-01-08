function f = missile_f(v)
t = v(1);
alpha = v(2);
f = zeros(2, 1);
f(1) = t - 1 + t*cos(alpha);
f(2) = 1 - exp(-t) - t*sin(alpha) + t^2/10;
