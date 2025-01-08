%% EulerDemo.m
%% Overview
% This script illustrates the use of Euler's method (implemented in the
% function |Euler.m|) for the problem 
%
% $$ y' = -y + 2 e^{-t}\cos(2t),\quad   y(0)=0 $$
%
% on the interval $[0,10]$ with exact solution
%
% $$ y(t) = e^{-t}\sin(2t) $$

%% Code
% Set up the problem
clear all
close all
f = @(t,y) -y+2*exp(-t).*cos(2*t);
t0=0; y0=0;    % initial condition
tmax = 10;
Nvalues = [20 100 500];

%%
% Run for several different values of $N$, the number of steps used to
% reach the final time $t=10$.
for N=Nvalues
    h=tmax/N;
    [t,y] = Euler(t0,y0,f,h,N);   % call Euler.m
    figure
    hold on 
    title(sprintf('Approximate Euler solution with %d points',N)) 
    xlabel('t'), ylabel('y')
    xlim([t0 tmax]), ylim([-0.2 1])
    plot(t,y,'b','LineWidth',2); 
    plot(t,y,'ro','LineWidth',2); 
    legend('Euler solution','Euler points');
    pause
    title(sprintf('Approximate Euler and exact solutions with %d points',N)) 
    tt=linspace(0,10,201);
    plot(tt,exp(-tt).*sin(2*tt),'g','LineWidth',2);  % exact solution
    legend('Euler solution','Euler points', 'Exact Solution');
    hold off
    if N<Nvalues(end)
        pause
    end
end
    