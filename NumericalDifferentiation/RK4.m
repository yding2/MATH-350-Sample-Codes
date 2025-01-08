function [tvec,yvec] = RK4(t0,y0,f,h,N)
% [tvec,yvec] = RK4(t0,y0,f,h,N)
% Classical fourth-order Runge-Kutta method
% Inputs
% t0,y0: initial condition (y0 can be d-vector)
% f:     name or function handle of the right-hand side function f:(t,y)->f(t,y)
% h:     stepsize
% N:     number of steps
% Outputs
% tvec: vector of t values
% yvec: vector (or matrix) of corresponding y values

d = length(y0);      % number of equations in system
yvec = zeros(N+1,d);
tvec = linspace(t0,t0+N*h,N+1)';
yvec(1,:) = y0';
for n=1:N
   s1 = f(tvec(n), yvec(n,:));
   s2 = f(tvec(n)+h/2, yvec(n,:) + h/2*s1);
   s3 = f(tvec(n)+h/2, yvec(n,:) + h/2*s2);
   s4 = f(tvec(n)+h, yvec(n,:) + h*s3);
   yvec(n+1,:) = yvec(n,:) + h/6*(s1+2*s2+2*s3+s4)';
end

