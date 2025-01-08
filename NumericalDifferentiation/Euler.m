function [tvec,yvec] = Euler(t0,y0,f,h,N)
% [tvec,yvec] = Euler(t0,y0,f,h,N)
% Euler's method
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
   fvalue = f(tvec(n),yvec(n,:));
   yvec(n+1,:) = yvec(n,:)+h*fvalue';
end