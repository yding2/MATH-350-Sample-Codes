function jf = circpra_j(v)
x = v(1);
y = v(2);
jf = zeros(2,2);
jf(1,:) = [2*x 2*(y-1)];
jf(2,:) = [-2*x 1];