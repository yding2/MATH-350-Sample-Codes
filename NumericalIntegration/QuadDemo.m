%% QuadDemo.m
%% Overview
% Illustrates the NCM routine |quadtx| (textbook version of |quad|) to 
% perform numerical integration on the interval $[a, b]$. 
% Also illustrates different ways to define functions for use with
% function-functions.

%% Inline functions are *obsolete*, so we no longer discuss their use.

%%
%% Integrand defined as anonymous function
% We evaluate
%
% $$ \int_0^1 J_0(x) x e^{x^2} dx$$
%
a = 0;
b = 1;
disp('Evaluate the complicated Bessel integral (f defined as anonymous function):')
f = @(x) besselj(0,x).*x.*exp(x.^2);
q = quadtx(f,a,b);
fprintf('Int(J0(x)*x*exp(x^2),x=%f..%f) = %15.12f.\n\n',a,b,q) 

%pause
%% Integrand defined as anonymous function with parameter
% We now evaluate
%
% $$ \int_0^1 J_\nu(x) x e^{x^2} dx$$
%
% for values of $\nu = 0,0.5,1,1.5,2$

disp('Evaluate even more complicated Bessel integrals:')
f = @(x,n) besselj(n,x).*x.*exp(x.^2);
for n=0:0.5:2
    % The fourth argument for quadtx expects a tolerance for the adaptive
    % subdivision. Even if we don't want to change it, we still need to
    % reserve space for it.
    q = quadtx(f,a,b,[],n);
    fprintf('Int(J_%2.1f(x)*x*exp(x^2),x=%f..%f) = %15.12f.\n\n',n,a,b,q) 
end

%pause
%%
%% Graphical illustration with |quadgui|
fprintf('Now starting quadgui with Int(J_%2.1f(x)*x*exp(x^2),x=%f..%f)\n\n',n,a,b)
f = @(x) besselj(0,x).*x.*exp(x.^2);
q = quadgui(f,a,b);

%pause
%% 
%% An Experiment from NCM
% Modified to use the Bessel function integral
Qexact = 0.739631779338781;
%Qexact = 29.85832539549867;
disp('An experiment from NCM showing the effect of the tolerance')
disp('    tol              Q          fcount        err        ratio')
for k = 1:12
    tol = 10^(-k);
    [Q,fcount] = quadtx(f,0,1,tol);
%    [Q,fcount] = quadtx(@humps,0,1,tol);
    err = Q - Qexact;
    ratio = err/tol;
    fprintf('%8.0e %21.14f %7d %13.3e %9.3f\n', ...
        tol,Q,fcount,err,ratio)
end

%pause
%%
%% Other good examples for quadgui:

%%
% The |humps| function
%
% $$ \int_{-1}^2 \left( \frac{1}{(x-0.3)^2 + 0.01} + \frac{1}{(x-0.9)^2 + 0.04} - 6 \right) dx $$
%
disp('Starting quadgui again with more examples')
disp('f(x) = humps(x) on [-1,2]')
f = @(x) humps(x);
a = -1; b = 2;
q = quadgui(f,a,b);

%pause
%%
%
% $$ \int_{0}^{9\pi/2} \cos(x) dx $$
%
disp('f(x) = cos(x) on [0,9*pi/2]')
f = @(x) cos(x);
a = 0; b = 9*pi/2;
tol = 1.e-6;
q = quadgui(f,a,b,tol);

%pause
%%
%
% $$ \int_0^1 \sqrt{x} dx $$
%
disp('f(x) = sqrt(x) on [0,1]')
f = @(x) sqrt(x);
a = 0; b = 1;
tol = 1.e-8;
q = quadgui(f,a,b,tol);

%pause
%%
%
% $$ \int_0^\pi \left(\tan(\sin(x))-\sin(\tan(x))\right) dx $$
%
disp('f(x) = tan(sin(x))-sin(tan(x)) on [0,pi]')
f = @(x) tan(sin(x))-sin(tan(x));
a = 0; b = pi;
q = quadgui(f,a,b);

