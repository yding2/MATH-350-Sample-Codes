%Symbolic Function Demo
%Define variable x
syms x 
%Define function
f = cos(x)/sqrt(1 + x^2); 
%Calculate a definite integral
Fint = int(f,x,[0 10])
%Evaluate the value
Fvpa = vpa(Fint)