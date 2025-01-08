%% TwoBodyDemo.m
%% Overview
% This script illustrates the use of |ode23tx| for the solution of the
% two-body problem 
%
% $$ x''(t) = -\frac{x(t)}{r(t)^3}, $$
%
% $$ y''(t) = -\frac{y(t)}{r(t)^3}, $$
%
% where
%
% $$ r(t) = \sqrt{x(t)^2 + y(t)^2}. $$
%
% Here $x$ and $y$ are the coordinates of a small body (such as a space
% ship) *relative to* a (fixed) large body (such as a planet), and $t$ is
% time. In other words, the parametric curve $C: t \mapsto (x(t),y(t))$
% describes the *orbit* of the small body around the large body.
%
% In order to apply an IVP solver we need to convert the system of two
% second-order ODEs to a system of four first-order ODEs, i.e.,
%
% $$ \mathbf{y} = \left[y_1, y_2, y_3, y_4 \right]^T = \left[x, x',
% y, y' \right]^T $$ 
% 
% so that
%
% $$ \mathbf{y}' = \left[y'_1, y'_2, y'_3, y'_4 \right]^T =
% \left[y_2, -\frac{y_1}{r^3}, y_4, -\frac{y_3}{r^3} \right]^T $$ 
%
% This first-order system is coded in the function |twobody.m|.

%% Beginning of code
% Initialize
clear all
close all

%% Example 1
% Use |ode23tx| to solve the two-body problem with initial condition
%
% $$ x(0) = 1,\ x'(0) = 0,\ y(0) = 0,\ y'(0) = 1, $$
%
% i.e., with the small body starting at $(1,0)$ with *unit initial
% velocity* in the "upward" direction. The large body is to be interpreted
% as a point mass located at the origin. We use a time interval of
% $[0,2\pi]$. The horizontal axis in the plot is the $t$-axis. The
% different colors correspond to
%
% * dark blue: $x(t)$ (identical with $y'(t)$)
% * green: $x'(t)$ 
% * red: $y(t)$
% * light blue: $y'(t)$


ode23tx(@twobody,[0 2*pi],[1; 0; 0; 1]);
pause

%% 
% To get a *phase plane plot*, i.e., a plot of the $t$-parametrized actual
% orbit determined by the first and third components of the system of four
% first-order ODEs we store the output of |ode23tx| in |t| and |y| and then
% plot those first and third components of |y| together.

y0 = [1; 0; 0; 1];
[t,y] = ode23tx(@twobody,[0 2*pi],y0);
plot(y(:,1),y(:,3),'-',0,0,'ro')
xlabel('x'), ylabel('y')
axis equal
pause

%% Example 2
% Now we use |ode23tx| to solve the two-body problem with slightly modified
% initial conditions
%
% $$ x(0) = 1,\ x'(0) = 0,\ y(0) = 0,\ y'(0) = 1.3, $$
%
% i.e., we *increase the initial velocity* in the "upward" direction. We
% also change the time interval to $[0,12\pi]$. Again, the horizontal axis
% in the plot is the $t$-axis, and the different colors correspond to
%
% * dark blue: $x(t)$
% * green: $x'(t)$ 
% * red: $y(t)$
% * light blue: $y'(t)$

y0 = [1; 0; 0; 1.3];
ode23tx(@twobody,[0 12*pi],y0);
pause

%% 
% The corresponding phase plane plot for this modified $y$-velocity is
% given by
y0 = [1; 0; 0; 1.3];
[t,y] = ode23tx(@twobody,[0 12*pi],y0);
plot(y(:,1),y(:,3),'-',0,0,'ro')
xlabel('x'), ylabel('y')
axis equal
