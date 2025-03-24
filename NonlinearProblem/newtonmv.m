function [x, it] = newtonmv(x, f, jf, tol)
% multivariate Newton method
% requires functions f and jf (Jacobian of f) coded separately
it = 0;
fx = f(x);
while norm(fx) > tol
   Jx = jf(x);
   x = x - Jx \ fx;
   fx = f(x);
   it = it + 1;
   fprintf('Iteration %d: approx root = [%f,%f]\n', it, x);
end
