function jf = missile_j(v)
t = v(1);
alpha = v(2);
jf = zeros(2,2);
jf(1,:) = [1+cos(alpha)            -t*sin(alpha)];
jf(2,:) = [exp(-t)-sin(alpha)+t/5  -t*cos(alpha)];
