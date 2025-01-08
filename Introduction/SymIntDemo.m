%%Symbolic Function Demo
%% Evaluate Integral
%Define variable x
syms x 
%Define function
f = cos(x)/sqrt(1 + x^2); 
%Calculate a definite integral
Fint = int(f,x,[0 10])
%Evaluate the value
Fvpa = vpa(Fint)
%% Solve Equationn
%Define variable x
syms x 
% Define equation
eqn = 2*x + 1==0;
% Solve the equation
s = solve(eqn,x)