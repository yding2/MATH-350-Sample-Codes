%% Differentiation

%%
% This script demonstrates how can use different difference scheme to 
% approximate to the derivative
%
% $$ f(x) = \arctan x $$
%
% find f'(\sqrt{2}).

%% 
% Number of trials
N = 8;

%% Result of forward difference
disp('Result of forward difference:')
for n=0:N
    x = 10^(-n);
     Dhf = (atan(sqrt(2)+x)-atan(sqrt(2)))/x;
    fprintf('h = %f, the value is %e\n',x,Dhf)
end

%% Result of symmetric difference
disp('Result of symmetric difference:')
for n=0:N
    x = 10^(-n);
    Dhf = (atan(sqrt(2)+x)-atan(sqrt(2)-x))/2/x;
    fprintf('h = %f, the value is %e\n',x,Dhf)
end

