function jf = circhyp_j(v)
x = v(1);
y = v(2);
jf = zeros(2,2);
jf(1,:) = [2*x 2*y];
jf(2,:) = [y x];