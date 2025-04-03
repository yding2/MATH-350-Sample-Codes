%% Math350 Computer Assignment 3
%% Problem 3.3 
% a)
x = [-1 -0.96 -0.65 0.10 0.40 1.00];
y = [-1 -0.1512 .3860 .4802 0.8838 1];
u = linspace(-1,1,201);
title('Interpolation');
plot(x,y,'bo',u,piecelin(x,y,u),'r',u,polyinterp(x,y,u),'g'...
    ,u,splinetx(x,y,u),u,pchiptx(x,y,u));
legend('data','piecelin','polyinterp','spline','pchip');
%part b) evaluate the the value of the interpolant at 0.3
piecelin(x,y,-0.3)
polyinterp(x,y,-0.3)
splinetx(x,y,-0.3)
pchiptx(x,y,-0.3)
%part c) Using vandermonde matrix to find the coefficients
c = vander(x)\y';
(16*x.^5-20*x.^3+5*x)';
%% Problem 3.4
figure('position',get(0,'screensize'))
axes('position',[0 0 1 1])
[x,y] = ginput;

n = length(x);
s = (1:n)';
t = (1:.05:n)';
u = splinetx(s,x,t);
v = splinetx(s,y,t);
clf reset
upchip = pchiptx(s,x,t);
vpchip = pchiptx(s,y,t);
plot(x,y,'g.',u,v,'b-',upchip,vpchip,'r-');
legend('data','spline','pchip');



%% Assignment 3 Problem 3
% Define the data and evaluation points
x = [0 1 2];
y = [1 1 5];
u = linspace(0,2,100);

%% Call |splinetx_natural|
% Evaluate *cubic natural spline* interpolant at u
v = splinetx_natural(x,y,u);

hold on
xlim([-1 3])
ylim([-0 6])
title('Cubic Natural Spline Interpolant')
plot(x,y,'bo','LineWidth',2)
legend('Data','Location','NorthWest')

%%
% Use MATLAB to get a continuous graph
plot(u,v,'r','LineWidth',2)
legend('Data','MATLAB graph','Location','NorthWest')
hold off