%% Example 6 The trivial initial value problem
% dy/dt = 0, 0 <= t < = 10
% y(0) = 1;

f = @(t,y) 0;
ode23tx(f,[0 10],1);

%% Example 7 The harmonic oscillator
% d^2 y(t)/dt^2 = -y(t),  0 <= t <= 2Pi
% y(0) = 1, y'(0) = 0
% Rewrite as a system of the first-order IVP
%  y'_1(t) = y_2(t) y_2'(t) = -y_1(t)

f = @(t, y) [y(2); -y(1)];
ode23tx(f,[0, 2*pi], [1;0]);

%To Get a phase plane plot
f = @(t, y) [y(2); -y(1)];
[t,y]=ode23tx(f,[0, 2*pi], [1;0]);
plot(y(:,1),y(:,2),'-o')
axis([-1.2 1.2 -1.2 1.2])
axis square